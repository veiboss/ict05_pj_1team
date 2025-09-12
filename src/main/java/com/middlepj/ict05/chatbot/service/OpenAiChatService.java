package com.middlepj.ict05.chatbot.service;

import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.*;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class OpenAiChatService {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String MODEL   = "gpt-4o"; // 저렴/빠름
    private static final ObjectMapper MAPPER = new ObjectMapper();

    private final String apiKey;
    private final HttpClient http;

    public OpenAiChatService() {
        String k = System.getenv("OPENAI_API_KEY");
        if (k == null || k.isBlank()) k = System.getProperty("OPENAI_API_KEY");
        if (k == null || k.isBlank()) {
            throw new IllegalStateException("OPENAI_API_KEY 미설정");
        }
        this.apiKey = k;
        this.http = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(10))
                .build();
    }

    // 1문장 요청용
    public String reply(String userText){
        List<Map<String,String>> msgs = new ArrayList<>();
        msgs.add(Map.of("role","system",
                "content","너는 한국어 상담 챗봇이야. 모르면 모른다고 답해."));
        msgs.add(Map.of("role","user","content", userText));
        return callOpenAI(msgs);
    }

    // 대화 히스토리 포함 요청용
    public String replyWithHistory(List<Map<String,String>> messages){
        return callOpenAI(messages);
    }

    private String callOpenAI(List<Map<String,String>> messages){
        try{
            Map<String,Object> body = new HashMap<>();
            body.put("model", MODEL);
            body.put("messages", messages);
            String json = MAPPER.writeValueAsString(body);

            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .timeout(Duration.ofSeconds(35))
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(json))
                    .build();

            HttpResponse<String> res = http.send(req, HttpResponse.BodyHandlers.ofString());
            if (res.statusCode()/100 != 2) {
                // 프런트에서 보기 쉽게 에러 바디 그대로 반환
                return "(오류) HTTP " + res.statusCode() + ": " + res.body();
            }
            Map<?,?> root = MAPPER.readValue(res.body(), Map.class);
            List<?> choices = (List<?>) root.get("choices");
            if (choices == null || choices.isEmpty()) return "(응답 없음)";
            Map<?,?> c0 = (Map<?,?>) choices.get(0);
            Map<?,?> msg = (Map<?,?>) c0.get("message");
            String content = msg == null ? null : String.valueOf(msg.get("content"));
            return (content == null || content.isBlank()) ? "(응답 없음)" : content.trim();
        }catch(Exception e){
            return "(예외) " + e.getClass().getSimpleName() + ": " + e.getMessage();
        }
    }
}
