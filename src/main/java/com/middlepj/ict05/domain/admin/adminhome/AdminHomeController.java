package com.middlepj.ict05.domain.admin.adminhome;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.middlepj.ict05.domain.member.service.MemberService;

@Controller
public class AdminHomeController {

	@Autowired
	private MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(AdminHomeController.class);

	/* 템플릿확인용 삭제예정 */
	@RequestMapping("/layout.ad")
	public String layout() {
		logger.info("<<< url ==>  /layout.ad >>>");

		return "admin/layout";
	}

	@RequestMapping("/login.ad")
	public String login() {
		logger.info("<<< url ==>  /login.ad >>>");

		return "admin_login/login";
	}

	@RequestMapping("/loginAction.ad")
	public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /loginAction.ad >>>");

		service.loginAction(request, response, model);

		return "admin_login/loginAction";
	}

}
