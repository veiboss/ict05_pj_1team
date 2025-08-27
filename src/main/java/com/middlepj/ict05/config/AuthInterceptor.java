// src/main/java/com/middlepj/ict05/global/web/AuthInterceptor.java
package com.middlepj.ict05.config;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
@Component
public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        Object user = req.getSession().getAttribute("sessionId"); // 팀 규칙에 맞게 키 이름 조정
        if (user == null) {
            // AJAX 구분 등 필요하면 헤더 보고 처리
            res.sendRedirect(req.getContextPath() + "/login");
            return false; // 이후 핸들러로 진행 중단
        }
        return true; // 통과
    }
}
