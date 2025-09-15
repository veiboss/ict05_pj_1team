package com.middlepj.ict05.chatbot.service;

import java.util.*;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.middlepj.ict05.chatbot.dao.MemberDrugMapper;
import com.middlepj.ict05.chatbot.dto.MemberDrug;

@Service
public class DrugInteractionService {

    private final MemberDrugMapper memberDrugMapper;

    /**
     * 의존성 주입: 회원별 등록 약 정보를 조회하는 Mapper
     */
    public DrugInteractionService(MemberDrugMapper memberDrugMapper) {
        this.memberDrugMapper = memberDrugMapper;
    }

    /** 성분 키워드 사전: "표준 성분명" → "탐지 키워드들"
     * - 약명/효능 설명 문자열에서 아래 키워드가 발견되면 해당 "표준 성분명"을 감지로 처리
     * - 표준 성분명은 UI/리포트 표기용으로도 활용됨
     */
    private static final Map<String, List<String>> KEYWORDS = Map.ofEntries(
        Map.entry("칼슘",     List.of("칼슘", "calcium", "ca")),
        Map.entry("철분",     List.of("철", "철분", "iron", "fe")),
        Map.entry("마그네슘", List.of("마그네슘", "magnesium", "mg")),
        Map.entry("아연",     List.of("아연", "zinc", "zn")),
        Map.entry("비타민C",  List.of("비타민 c", "ascorbic", "ascorbic acid", "vitamin c")),
        Map.entry("비타민D",  List.of("비타민 d", "cholecalciferol", "vitamin d")),
        Map.entry("비오틴",   List.of("비오틴", "biotin")),
        Map.entry("오메가3",  List.of("오메가3", "omega 3", "epa", "dha"))
    );

    /** 간단한 룰셋(예시)
     * - (A,B) 쌍이 모두 감지되면 상호작용/주의를 보고
     * - B가 null이면 단독 성분 A에 대한 주의 문구를 보고
     * - severity는 심각도(여기서는 "주의"만 예시)
     */
    private static final List<Rule> RULES = List.of(
        // 동시복용 간격 권장
        new Rule("칼슘",     "철분",   "주의",
            "칼슘과 철분은 동시에 복용하면 흡수 저해가 있을 수 있어요. 2시간 이상 간격을 두세요."),
        new Rule("마그네슘", "철분",   "주의",
            "마그네슘과 철분은 함께 복용 시 흡수 간섭이 보고됩니다. 시간 간격을 두세요."),
        new Rule("아연",     "철분",   "주의",
            "아연과 철분은 경쟁적으로 흡수될 수 있어요. 2시간 간격 복용을 권장합니다."),
        // 단독 주의 (B=null)
        new Rule("칼슘",     null,     "주의",
            "고용량 칼슘은 일부 항생제/갑상선호르몬제와 상호작용이 있어요. 복용 중이라면 식사 후 충분한 물과 함께 복용을 고려하세요.")
    );

    /**
     * 회원의 등록 약 목록을 바탕으로
     * 1) 성분 감지 (키워드 사전 기반)
     * 2) 룰셋 적용하여 상호작용 리스트 생성
     * 3) 원자료/감지 성분/상호작용/성분별 관련 약 매핑을 포함한 리포트 반환
     *
     * @param memberId 회원 식별자
     * @return InteractionReport 구조체
     */
    @Transactional(readOnly = true)
    public InteractionReport checkForMember(Long memberId) {
        // 1) 회원 등록 약 조회
        List<MemberDrug> drugs = memberDrugMapper.findByMemberId(memberId);

        // 2) 약명/효능 텍스트에서 성분을 감지하고, 성분별 관련 약 목록을 수집
        Map<String, Set<String>> nutrientHits = extractNutrientsWithHits(drugs);
        Set<String> detected = nutrientHits.keySet();

        // 3) 감지된 성분 조합을 룰셋에 대입해 상호작용(또는 단독 주의) 항목 생성
        List<Interaction> interactions = new ArrayList<>();
        for (Rule r : RULES) {
            boolean a = containsNutrient(detected, r.a);
            boolean b = (r.b == null) || containsNutrient(detected, r.b);
            if (a && b) {
                List<String> drugsA = toList(nutrientHits.get(r.a));
                List<String> drugsB = (r.b == null) ? Collections.emptyList()
                                                    : toList(nutrientHits.get(r.b));
                interactions.add(new Interaction(r.a, r.b, r.severity, r.message, drugsA, drugsB));
            }
        }

        // 4) 결과 패키징
        return new InteractionReport(drugs, detected, interactions, nutrientHits);
    }

    /**
     * 약 리스트에서 성분을 추출하고, 성분별로 해당 약 이름 목록을 모은다.
     * - 약명 + 효능 설명 텍스트(haystack)를 소문자로 정규화 후 키워드 검사
     * - 매칭되면 res[표준 성분명]에 약명을 add
     */
    private Map<String, Set<String>> extractNutrientsWithHits(List<MemberDrug> drugs) {
        Map<String, Set<String>> res = new LinkedHashMap<>();
        for (MemberDrug d : drugs) {
            final String name = nvl(d.getDrugName());
            final String hay  = (name + " " + nvl(d.getDrugEffect())).toLowerCase(Locale.ROOT);

            for (Map.Entry<String, List<String>> e : KEYWORDS.entrySet()) {
                for (String kw : e.getValue()) {
                    // 느슨한 토큰 포함 검사(단어 경계 + 부분 포함 보조)
                    if (containsWordLike(hay, kw.toLowerCase(Locale.ROOT))) {
                        res.computeIfAbsent(e.getKey(), k -> new LinkedHashSet<>()).add(name);
                        break; // 한 성분에 대해 하나의 키워드라도 매칭되면 다음 성분으로
                    }
                }
            }
        }
        return res;
    }

    // ==== helpers ====

    /** 대소문자 무시 동일성 비교로 성분 존재 확인 */
    private static boolean containsNutrient(Set<String> set, String target){
        for (String s : set) if (s.equalsIgnoreCase(target)) return true;
        return false;
    }

    /** null-safe 빈 문자열 처리 */
    private static String nvl(String s){ return (s==null)?"":s; }

    /** Set을 List로 변환(null이면 빈 리스트) */
    private static List<String> toList(Set<String> s){
        return (s==null)?Collections.emptyList():new ArrayList<>(s);
    }

    /**
     * 공백/구두점 기준으로 느슨하게 포함 여부 판단
     * - needle(키워드)을 normalize → 공백으로 분할한 토큰 각각에 대해
     *   1) \b토큰\b 정규식 매칭 또는
     *   2) 부분 문자열 포함(hay.contains(token))
     *   이 둘 중 하나라도 성립하지 않으면 false
     * - 모든 토큰이 만족해야 true
     */
    private static boolean containsWordLike(String hay, String needle){
        String n = normalize(needle);
        if (n.isEmpty()) return false;
        String[] tokens = n.split("\\s+");
        for (String t : tokens) {
            if (t.length() < 2) continue; // 1글자 토큰은 너무 약해 스킵
            boolean boundaryMatch = Pattern
                .compile("\\b" + Pattern.quote(t) + "\\b")
                .matcher(hay)
                .find();
            boolean substringMatch = hay.contains(t);
            if (!boundaryMatch && !substringMatch) {
                return false; // 하나라도 매칭 실패하면 전체 실패
            }
        }
        return true;
    }

    /** 구두점 제거 → 소문자 → 트림 */
    private static String normalize(String s){
        return s.replaceAll("[\\p{Punct}]+", " ").toLowerCase(Locale.ROOT).trim();
    }

    // ==== DTOs / 내부 클래스 ====

    /** 룰 정의: (성분 A, 성분 B|null, 심각도, 메시지) */
    private static class Rule {
        final String a, b;      // 성분 A, 성분 B (B가 null이면 단독 주의)
        final String severity;  // "주의" 등급 등
        final String message;   // 사용자 안내 문구
        Rule(String a, String b, String severity, String message){
            this.a=a; this.b=b; this.severity=severity; this.message=message;
        }
    }

    /** 상호작용 검사 결과 전체 리포트 */
    public static class InteractionReport {
        public final List<MemberDrug> drugs;                 // 원본: 회원의 등록 약 리스트
        public final Set<String> nutrients;                  // 감지된 표준 성분명 집합
        public final List<Interaction> interactions;         // 룰 매칭 결과(상호작용/주의 항목들)
        public final Map<String, Set<String>> nutrientHits;  // 성분 → 해당 약들 매핑

        public InteractionReport(List<MemberDrug> drugs, Set<String> nutrients,
                                 List<Interaction> interactions,
                                 Map<String, Set<String>> nutrientHits) {
            this.drugs = drugs;
            this.nutrients = nutrients;
            this.interactions = interactions;
            this.nutrientHits = nutrientHits;
        }
    }

    /** 단일 상호작용(또는 단독 주의) 항목 */
    public static class Interaction {
        public final String nutrientA;
        public final String nutrientB; // null이면 A 단독 주의
        public final String severity;
        public final String message;
        public final List<String> drugsA; // A 성분 포함 약들
        public final List<String> drugsB; // B 성분 포함 약들

        public Interaction(String a, String b, String severity, String message,
                           List<String> drugsA, List<String> drugsB) {
            this.nutrientA=a; this.nutrientB=b; this.severity=severity; this.message=message;
            this.drugsA = drugsA; this.drugsB = drugsB;
        }
    }
}
