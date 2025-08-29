package com.middlepj.ict05.common;

import java.time.LocalDateTime;

public class ApiResponse<T> {

    private int status;              // HTTP 상태 코드
    private LocalDateTime timestamp; // 요청 처리 시간
    private String message;          // 응답 메시지
    private T data;                  // 실제 데이터
    
    public ApiResponse() {
    	
    }

    // 생성자
    public ApiResponse(int status, String message, T data) {
        this.status = status;
        this.timestamp = LocalDateTime.now(); // 생성 시 현재 시간 자동 세팅
        this.message = message;
        this.data = data;
    }

    // Getter & Setter
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    // 편리한 static 팩토리 메소드 (선택)
    public static <T> ApiResponse<T> success(T data, String message) {
        return new ApiResponse<>(200, message, data);
    }

    public static <T> ApiResponse<T> error(String message, int status) {
        return new ApiResponse<>(status, message, null);
    }
}
