package com.middlepj.ict05.domain.admin.admindrug.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminDrugController {

	private static final Logger logger = LoggerFactory.getLogger(AdminDrugController.class);
	
	/* 후기 리스트 이동 */
	@RequestMapping("/drug.ad")
	public String drug(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /drug.ad >>>");

		String grade = (String)request.getSession().getAttribute("sessionGrade");
		if("ADMIN".equals(grade)) {
			// 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
			try {
			} catch (Exception e) {
				// 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
				logger.error("Error while preparing review list page", e);
				throw new ServletException("영양제 목록을 불러오는 중 오류가 발생했습니다.", e);
			}
			
			return "admindrug/drugList";
		}
		else {
			request.getSession().invalidate();
			return "admin_login/login";
		}
	}
	
}
