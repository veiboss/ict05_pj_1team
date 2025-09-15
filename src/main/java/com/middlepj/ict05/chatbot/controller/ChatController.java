package com.middlepj.ict05.chatbot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.middlepj.ict05.chatbot.service.FaqService;
import com.middlepj.ict05.chatbot.service.OpenAiChatService;
import com.middlepj.ict05.chatbot.service.DrugInteractionService;
import com.middlepj.ict05.chatbot.service.DrugInteractionService.InteractionReport;

@Controller
@RequestMapping("/chat")
public class ChatController {

    /** 의료/건강 관련 답변에 항상 붙일 안전 고지 */
    private static final String SAFETY_NOTE =
        "전문가 상담은 필수! 중요한 건강 문제는 AI가 아닌 의사·약사와 꼭 상의하세요.";

    private final OpenAiChatService chatService;
    private final FaqService faqService;
    private final DrugInteractionService interactionService;

    /**
     * 의존성 주입: OpenAI 서비스, FAQ 서비스, 약물상호작용 서비스
     */
    public ChatController(OpenAiChatService chatService,
                          FaqService faqService,
                          DrugInteractionService interactionService) {
        this.chatService = chatService;
        this.faqService = faqService;
        this.interactionService = interactionService;
    }

    /**
     * 추천 질문 가져오기
     * GET /chat/suggestions(.do)?limit=6
     * - 프런트 홈/빈 대화창에서 보여줄 샘플 질문 목록
     */
    @GetMapping(value = {"/suggestions", "/suggestions.do"},
                produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> suggestions(@RequestParam(defaultValue = "6") int limit) {
        // FAQ 서비스에서 limit 개수만큼 추천 문항 조회
        return Map.of("items", faqService.suggestions(limit));
    }

    /**
     * 대화 API (FAQ 우선 → GPT 백업) + 안전문구 부착
     * POST /chat/api(.do)
     * Request: {"message":"유저의 질문"}
     * Response: {"reply":"봇의 답변 ... (FAQ|AI)"}
     */
    @PostMapping(value = {"/api", "/api.do"},
                 consumes = "application/json",
                 produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> api(@RequestBody Map<String, Object> body, HttpSession session) {
        // 0) 사용자 입력 추출
        String user = String.valueOf(body.getOrDefault("message", "")).trim();

        // 1) FAQ 우선 매칭 (있으면 즉시 반환)
        String faq = faqService.answerFromDb(user);
        if (faq != null) {
            return Map.of("reply", faq + "\n\n(FAQ)");
        }

        // 2) 세션별 대화 히스토리 확보 (없으면 system 프롬프트로 초기화)
        @SuppressWarnings("unchecked")
        List<Map<String, String>> history =
            (List<Map<String, String>>) session.getAttribute("chat_history");
        if (history == null) history = new ArrayList<>();
        if (history.isEmpty()) {
            history.add(Map.of("role", "system",
                "content", "너는 한국어 상담 챗봇이다. 모르면 모른다고 답해."));
        }
        // 현재 사용자 메시지 추가
        history.add(Map.of("role", "user", "content", user));

        // 3) GPT 호출 후 안전 고지 문구를 (중복 없이) 부착
        String answer = chatService.replyWithHistory(history);
        String safeAnswer = appendSafetyNoteIfMissing(answer);

        // 4) 어시스턴트 응답을 히스토리에 저장 → 세션에 반영
        history.add(Map.of("role", "assistant", "content", safeAnswer));
        session.setAttribute("chat_history", history);

        // 5) 프런트 구분을 위해 (AI) 태그 부착
        return Map.of("reply", safeAnswer + "\n\n(AI)");
    }

    /**
     * 대화 리셋
     * POST /chat/reset(.do)
     * - 세션에 저장된 대화 히스토리를 제거
     */
    @PostMapping(value = {"/reset", "/reset.do"})
    @ResponseBody
    public Map<String, Object> reset(HttpSession session) {
        session.removeAttribute("chat_history");
        return Map.of("ok", true);
    }

    /**
     * 내 약 상호작용 확인
     * GET /chat/check-interactions(.do)
     * - 세션의 sessionID로 회원을 식별
     * - 등록된 약/영양성분을 기반으로 상호작용 리포트 생성
     * - 사람이 읽을 수 있는 summary + 구조화된 필드 동시 반환
     */
    @GetMapping(value = {"/check-interactions", "/check-interactions.do"},
                produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> checkInteractions(HttpSession session) {
        // 1) 로그인 확인 (세션에서 회원 식별자 추출)
        Long memberId = resolveFromSessionID(session);
        if (memberId == null) {
            return Map.of("error", true, "code", "LOGIN_REQUIRED", "message", "로그인이 필요합니다.");
        }

        // 2) 해당 회원의 상호작용 검사 수행
        InteractionReport rpt = interactionService.checkForMember(memberId);

        // 3) 사람이 읽기 쉬운 요약 문자열 생성
        StringBuilder sb = new StringBuilder();
        if (rpt.interactions.isEmpty()) {
            sb.append("등록된 약/영양성분 기준에서 특이 상호작용 주의사항이 발견되지 않았어요.\n");
        } else {
            sb.append("다음 상호작용/동시복용 주의가 확인되었습니다:\n");
            rpt.interactions.forEach(it -> {
                if (it.nutrientB == null) {
                    // 단일 성분 기준 경고
                    sb.append("- [").append(it.severity).append("] ")
                      .append(it.nutrientA).append(": ").append(it.message).append("\n");
                    if (!it.drugsA.isEmpty()) {
                        sb.append("  · 관련 약: ")
                          .append(String.join(", ", it.drugsA)).append("\n");
                    }
                } else {
                    // 성분A ↔ 성분B 상호작용
                    sb.append("- [").append(it.severity).append("] ")
                      .append(it.nutrientA).append(" ↔ ").append(it.nutrientB).append(": ")
                      .append(it.message).append("\n");
                    if (!it.drugsA.isEmpty() || !it.drugsB.isEmpty()) {
                        sb.append("  · 관련 약: ");
                        if (!it.drugsA.isEmpty()) {
                            sb.append(it.nutrientA).append("=").append(String.join(", ", it.drugsA));
                        }
                        if (!it.drugsA.isEmpty() && !it.drugsB.isEmpty()) sb.append(" / ");
                        if (!it.drugsB.isEmpty()) {
                            sb.append(it.nutrientB).append("=").append(String.join(", ", it.drugsB));
                        }
                        sb.append("\n");
                    }
                }
            });
        }
        // 4) 안전 고지 추가
        sb.append("\n").append(SAFETY_NOTE);

        // 5) 구조화된 결과 + 요약 동시 반환
        return Map.of(
            "memberId", memberId,
            "nutrients", rpt.nutrients,      // 감지된 성분 목록
            "hits", rpt.nutrientHits,        // 성분 → 해당 약 목록 매핑
            "count", rpt.interactions.size(),
            "items", rpt.interactions,       // 상세 상호작용 항목(리스트)
            "summary", sb.toString()         // 사람이 읽기 쉬운 요약 문자열
        );
    }

    /**
     * 세션에서 회원 식별자(sessionID) 해석
     * - Number면 그대로 Long 변환
     * - String이면 parseLong 시도
     * - 그 외/실패 시 null
     */
    private Long resolveFromSessionID(HttpSession session){
        Object sid = session.getAttribute("sessionID"); // 팀 규칙: 세션 키 이름은 "sessionID"
        if (sid instanceof Number) return ((Number) sid).longValue();
        if (sid instanceof String && !((String) sid).isBlank()) {
            try { return Long.parseLong(((String) sid).trim()); } catch (Exception ignore) {}
        }
        return null;
    }

    /**
     * 답변에 안전 고지 문구가 없으면 덧붙이기 (중복 방지)
     * - 공백 제거한 문자열로 포함 여부 검사
     */
    private String appendSafetyNoteIfMissing(String answer) {
        if (answer == null) answer = "";
        String normalized = answer.replaceAll("\\s+", "");
        String key = SAFETY_NOTE.replaceAll("\\s+", "");
        if (!normalized.contains(key)) {
            // 기존 답변이 비어있으면 안전문구만, 아니면 개행 후 부착
            answer = answer.isBlank() ? SAFETY_NOTE : (answer.trim() + "\n\n" + SAFETY_NOTE);
        }
        return answer.trim();
    }
}
