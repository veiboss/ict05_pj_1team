// src/main/java/com/middlepj/ict05/global/web/LogInterceptor.java
package com.middlepj.ict05.config;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LogInterceptor implements HandlerInterceptor {
    private static final ThreadLocal<Long> START = new ThreadLocal<>();

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) {
        START.set(System.currentTimeMillis());
        System.out.println("[REQ] " + req.getMethod() + " " + req.getRequestURI());
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object handler, Exception ex) {
        Long start = START.get();
        if (start != null) {
            long ms = System.currentTimeMillis() - start;
            System.out.println("[RES] " + res.getStatus() + " (" + ms + "ms) " + req.getRequestURI());
            START.remove();
        }
    }
}
