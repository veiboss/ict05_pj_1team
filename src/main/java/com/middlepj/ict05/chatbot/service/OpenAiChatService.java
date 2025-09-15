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

    // OpenAI ChatCompletion API 엔드포인트 URL
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    // 사용할 모델 지정 (gpt-4o-mini: 저렴/빠른 응답용)
    private static final String MODEL   = "gpt-4o-mini";
    // JSON 직렬화/역직렬화를 위한 Jackson ObjectMapper
    private static final ObjectMapper MAPPER = new ObjectMapper();

    private final String apiKey;   // OpenAI API 키
    private final HttpClient http; // HTTP 요청 클라이언트

    // === 생성자 ===
    public OpenAiChatService() {
        // 1. 환경변수에서 API Key 읽기
        String k = System.getenv("OPENAI_API_KEY");
        // 2. 시스템 속성에서도 확인
        if (k == null || k.isBlank()) k = System.getProperty("OPENAI_API_KEY");
        // 3. 둘 다 없으면 에러
        if (k == null || k.isBlank()) {
            throw new IllegalStateException("OPENAI_API_KEY 미설정");
        }
        this.apiKey = k;

        // HttpClient 생성 (연결 타임아웃 10초)
        this.http = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(10))
                .build();
    }

    // === 단일 질문/답변용 메서드 ===
    // 사용자 입력(userText)을 받아 system 프롬프트와 함께 OpenAI API 호출
    public String reply(String userText){
        List<Map<String,String>> msgs = new ArrayList<>();
        // system 역할: 챗봇의 성격을 정의 ("한국어 상담 챗봇")
        msgs.add(Map.of("role","system",
                "content","너는 한국어 상담 챗봇이야. 모르면 모른다고 답해."));
        // user 역할: 실제 사용자 입력
        msgs.add(Map.of("role","user","content", userText));
        // OpenAI API 호출
        return callOpenAI(msgs);
    }

    // === 대화 히스토리 포함 메서드 ===
    // 이전 대화 메시지들을 함께 전달해 맥락 기반 응답 요청
    public String replyWithHistory(List<Map<String,String>> messages){
        return callOpenAI(messages);
    }

    // === OpenAI API 호출 공통 함수 ===
    private String callOpenAI(List<Map<String,String>> messages){
        try{
            // 요청 body 생성
            Map<String,Object> body = new HashMap<>();
            body.put("model", MODEL);       // 사용할 모델
            body.put("messages", messages); // 대화 메시지 배열
            String json = MAPPER.writeValueAsString(body);

            // HTTP POST 요청 생성
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .timeout(Duration.ofSeconds(35))
                    .header("Authorization", "Bearer " + apiKey)
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(json))
                    .build();

            // 요청 전송 + 응답 수신
            HttpResponse<String> res = http.send(req, HttpResponse.BodyHandlers.ofString());

            // HTTP 상태코드 확인 (2xx가 아니면 에러 메시지 반환)
            if (res.statusCode()/100 != 2) {
                return "(오류) HTTP " + res.statusCode() + ": " + res.body();
            }

            // 응답 JSON 파싱
            Map<?,?> root = MAPPER.readValue(res.body(), Map.class);
            List<?> choices = (List<?>) root.get("choices");
            if (choices == null || choices.isEmpty()) return "(응답 없음)";

            // 첫 번째 choice에서 message.content 추출
            Map<?,?> c0 = (Map<?,?>) choices.get(0);
            Map<?,?> msg = (Map<?,?>) c0.get("message");
            String content = msg == null ? null : String.valueOf(msg.get("content"));

            // 최종 응답 반환
            return (content == null || content.isBlank()) ? "(응답 없음)" : content.trim();

        }catch(Exception e){
            // 예외 발생 시 예외 클래스와 메시지 반환
            return "(예외) " + e.getClass().getSimpleName() + ": " + e.getMessage();
        }
    }
}
