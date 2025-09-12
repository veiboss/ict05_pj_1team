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

    private static final String SAFETY_NOTE =
        "전문가 상담은 필수! 중요한 건강 문제는 AI가 아닌 의사·약사와 꼭 상의하세요.";

    private final OpenAiChatService chatService;
    private final FaqService faqService;
    private final DrugInteractionService interactionService;

    public ChatController(OpenAiChatService chatService,
                          FaqService faqService,
                          DrugInteractionService interactionService) {
        this.chatService = chatService;
        this.faqService = faqService;
        this.interactionService = interactionService;
    }

    /** 추천 질문: /chat/suggestions, /chat/suggestions.do */
    @GetMapping(value = {"/suggestions", "/suggestions.do"},
                produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> suggestions(@RequestParam(defaultValue = "6") int limit) {
        return Map.of("items", faqService.suggestions(limit));
    }

    /** 대화 API: (FAQ → GPT) + 안전문구 */
    @PostMapping(value = {"/api", "/api.do"},
                 consumes = "application/json",
                 produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> api(@RequestBody Map<String, Object> body, HttpSession session) {
        String user = String.valueOf(body.getOrDefault("message", "")).trim();

        // 0) FAQ 우선
        String faq = faqService.answerFromDb(user);
        if (faq != null) {
            return Map.of("reply", faq + "\n\n(FAQ)");
        }

        // 1) 세션 히스토리
        @SuppressWarnings("unchecked")
        List<Map<String, String>> history =
            (List<Map<String, String>>) session.getAttribute("chat_history");
        if (history == null) history = new ArrayList<>();
        if (history.isEmpty()) {
            history.add(Map.of("role", "system",
                "content", "너는 한국어 상담 챗봇이다. 모르면 모른다고 답해."));
        }
        history.add(Map.of("role", "user", "content", user));

        // 2) GPT 호출 + 안전문구 부착(중복 방지)
        String answer = chatService.replyWithHistory(history);
        String safeAnswer = appendSafetyNoteIfMissing(answer);

        // 3) 히스토리 저장
        history.add(Map.of("role", "assistant", "content", safeAnswer));
        session.setAttribute("chat_history", history);

        return Map.of("reply", safeAnswer + "\n\n(AI)");
    }

    /** 리셋: /chat/reset, /chat/reset.do */
    @PostMapping(value = {"/reset", "/reset.do"})
    @ResponseBody
    public Map<String, Object> reset(HttpSession session) {
        session.removeAttribute("chat_history");
        return Map.of("ok", true);
    }

    /** 내 약 상호작용 확인: 세션(sessionID)에서 회원 식별자 조회 */
    @GetMapping(value = {"/check-interactions", "/check-interactions.do"},
                produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> checkInteractions(HttpSession session) {
        Long memberId = resolveFromSessionID(session);
        if (memberId == null) {
            return Map.of("error", true, "code", "LOGIN_REQUIRED", "message", "로그인이 필요합니다.");
        }

        InteractionReport rpt = interactionService.checkForMember(memberId);

        StringBuilder sb = new StringBuilder();
        if (rpt.interactions.isEmpty()) {
            sb.append("등록된 약/영양성분 기준에서 특이 상호작용 주의사항이 발견되지 않았어요.\n");
        } else {
            sb.append("다음 상호작용/동시복용 주의가 확인되었습니다:\n");
            rpt.interactions.forEach(it -> {
                if (it.nutrientB == null) {
                    sb.append("- [").append(it.severity).append("] ")
                      .append(it.nutrientA).append(": ").append(it.message).append("\n");
                    if (!it.drugsA.isEmpty()) {
                        sb.append("  · 관련 약: ")
                          .append(String.join(", ", it.drugsA)).append("\n");
                    }
                } else {
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
        sb.append("\n").append(SAFETY_NOTE);

        return Map.of(
            "memberId", memberId,
            "nutrients", rpt.nutrients,      // 감지된 성분
            "hits", rpt.nutrientHits,        // 성분→해당 약 목록
            "count", rpt.interactions.size(),
            "items", rpt.interactions,       // 상세 항목
            "summary", sb.toString()
        );
    }

    private Long resolveFromSessionID(HttpSession session){
        Object sid = session.getAttribute("sessionID");
        if (sid instanceof Number) return ((Number) sid).longValue();
        if (sid instanceof String && !((String) sid).isBlank()) {
            try { return Long.parseLong(((String) sid).trim()); } catch (Exception ignore) {}
        }
        return null;
    }

    private String appendSafetyNoteIfMissing(String answer) {
        if (answer == null) answer = "";
        String normalized = answer.replaceAll("\\s+", "");
        String key = SAFETY_NOTE.replaceAll("\\s+", "");
        if (!normalized.contains(key)) {
            answer = answer.isBlank() ? SAFETY_NOTE : (answer.trim() + "\n\n" + SAFETY_NOTE);
        }
        return answer.trim();
    }
}
