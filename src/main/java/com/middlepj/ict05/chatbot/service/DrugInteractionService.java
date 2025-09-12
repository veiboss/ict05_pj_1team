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

    public DrugInteractionService(MemberDrugMapper memberDrugMapper) {
        this.memberDrugMapper = memberDrugMapper;
    }

    /** 성분 키워드 사전: 성분명 → 탐지 키워드들 */
    private static final Map<String, List<String>> KEYWORDS = Map.ofEntries(
        Map.entry("칼슘", List.of("칼슘", "calcium", "ca")),
        Map.entry("철분", List.of("철", "철분", "iron", "fe")),
        Map.entry("마그네슘", List.of("마그네슘", "magnesium", "mg")),
        Map.entry("아연", List.of("아연", "zinc", "zn")),
        Map.entry("비타민C", List.of("비타민 c", "ascorbic", "ascorbic acid", "vitamin c")),
        Map.entry("비타민D", List.of("비타민 d", "cholecalciferol", "vitamin d")),
        Map.entry("비오틴", List.of("비오틴", "biotin")),
        Map.entry("오메가3", List.of("오메가3", "omega 3", "epa", "dha"))
    );

    /** 간단 룰셋(예시) */
    private static final List<Rule> RULES = List.of(
        // 동시복용 간격
        new Rule("칼슘", "철분", "주의",
            "칼슘과 철분은 동시에 복용하면 흡수 저해가 있을 수 있어요. 2시간 이상 간격을 두세요."),
        new Rule("마그네슘", "철분", "주의",
            "마그네슘과 철분은 함께 복용 시 흡수 간섭이 보고됩니다. 시간 간격을 두세요."),
        new Rule("아연", "철분", "주의",
            "아연과 철분은 경쟁적으로 흡수될 수 있어요. 2시간 간격 복용을 권장합니다."),
        // 단독 주의
        new Rule("칼슘", null, "주의",
            "고용량 칼슘은 일부 항생제/갑상선호르몬제와 상호작용이 있어요. 복용 중이라면 식사 후 충분한 물과 함께 복용을 고려하세요.")
    );

    @Transactional(readOnly = true)
    public InteractionReport checkForMember(Long memberId) {
        List<MemberDrug> drugs = memberDrugMapper.findByMemberId(memberId);

        // 성분 ↔ 해당 약 목록
        Map<String, Set<String>> nutrientHits = extractNutrientsWithHits(drugs);
        Set<String> detected = nutrientHits.keySet();

        List<Interaction> interactions = new ArrayList<>();
        for (Rule r : RULES) {
            boolean a = containsNutrient(detected, r.a);
            boolean b = r.b == null || containsNutrient(detected, r.b);
            if (a && b) {
                List<String> drugsA = toList(nutrientHits.get(r.a));
                List<String> drugsB = (r.b == null) ? Collections.emptyList()
                                                    : toList(nutrientHits.get(r.b));
                interactions.add(new Interaction(r.a, r.b, r.severity, r.message, drugsA, drugsB));
            }
        }
        return new InteractionReport(drugs, detected, interactions, nutrientHits);
    }

    /** 약 리스트에서 성분을 추출하고, 성분별로 해당 약 이름 목록을 모은다 */
    private Map<String, Set<String>> extractNutrientsWithHits(List<MemberDrug> drugs) {
        Map<String, Set<String>> res = new LinkedHashMap<>();
        for (MemberDrug d : drugs) {
            final String name = nvl(d.getDrugName());
            final String hay  = (name + " " + nvl(d.getDrugEffect())).toLowerCase(Locale.ROOT);

            for (Map.Entry<String, List<String>> e : KEYWORDS.entrySet()) {
                for (String kw : e.getValue()) {
                    if (containsWordLike(hay, kw.toLowerCase(Locale.ROOT))) {
                        res.computeIfAbsent(e.getKey(), k -> new LinkedHashSet<>()).add(name);
                        break;
                    }
                }
            }
        }
        return res;
    }

    // ==== helpers ====
    private static boolean containsNutrient(Set<String> set, String target){
        for (String s : set) if (s.equalsIgnoreCase(target)) return true;
        return false;
    }
    private static String nvl(String s){ return (s==null)?"":s; }
    private static List<String> toList(Set<String> s){
        return (s==null)?Collections.emptyList():new ArrayList<>(s);
    }

    /** 공백/구두점 기준으로 느슨하게 포함 여부 판단 */
    private static boolean containsWordLike(String hay, String needle){
        String n = normalize(needle);
        if (n.isEmpty()) return false;
        String[] tokens = n.split("\\s+");
        for (String t : tokens) {
            if (t.length() < 2) continue;
            if (!Pattern.compile("\\b" + Pattern.quote(t) + "\\b").matcher(hay).find()
                && !hay.contains(t)) {
                return false;
            }
        }
        return true;
    }
    private static String normalize(String s){
        return s.replaceAll("[\\p{Punct}]+", " ").toLowerCase(Locale.ROOT).trim();
    }

    // ==== DTOs ====
    private static class Rule {
        final String a, b;      // 성분 A, 성분 B (B가 null이면 단독 주의)
        final String severity;  // "주의" 등급
        final String message;   // 안내 문구
        Rule(String a, String b, String severity, String message){
            this.a=a; this.b=b; this.severity=severity; this.message=message;
        }
    }

    public static class InteractionReport {
        public final List<MemberDrug> drugs;
        public final Set<String> nutrients;
        public final List<Interaction> interactions;
        public final Map<String, Set<String>> nutrientHits; // 성분→해당 약들

        public InteractionReport(List<MemberDrug> drugs, Set<String> nutrients,
                                 List<Interaction> interactions,
                                 Map<String, Set<String>> nutrientHits) {
            this.drugs = drugs;
            this.nutrients = nutrients;
            this.interactions = interactions;
            this.nutrientHits = nutrientHits;
        }
    }

    public static class Interaction {
        public final String nutrientA;
        public final String nutrientB; // null이면 A만
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
