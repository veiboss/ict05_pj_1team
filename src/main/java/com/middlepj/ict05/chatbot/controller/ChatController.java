package com.middlepj.ict05.chatbot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middlepj.ict05.chatbot.service.FaqService;
import com.middlepj.ict05.chatbot.service.OpenAiChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {

    private static final String SAFETY_NOTE =
        "전문가 상담은 필수! 중요한 건강 문제는 AI가 아닌 의사·약사와 꼭 상의하세요.";

    private final OpenAiChatService chatService;
    private final FaqService faqService;

    public ChatController(OpenAiChatService chatService, FaqService faqService) {
        this.chatService = chatService;
        this.faqService = faqService;
    }

    /** 추천 질문: /chat/suggestions, /chat/suggestions.do */
    @GetMapping(value = {"/suggestions", "/suggestions.do"},
                produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> suggestions(@RequestParam(defaultValue = "6") int limit) {
        return Map.of("items", faqService.suggestions(limit));
    }

    /** 대화 API: /chat/api, /chat/api.do  (FAQ → GPT + 안전문구) */
    @PostMapping(value = {"/api", "/api.do"},
                 consumes = "application/json",
                 produces = "application/json; charset=UTF-8")
    @ResponseBody
    public Map<String, Object> api(@RequestBody Map<String, Object> body, HttpSession session) {
        String user = String.valueOf(body.getOrDefault("message", "")).trim();

        // 0) FAQ (정확 일치) 우선
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

        // 2) GPT 호출 + 안전문구(중복 방지) 부착
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

    /** 안전문구가 이미 포함돼 있으면 다시 붙이지 않음(공백/줄바꿈 무시) */
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
