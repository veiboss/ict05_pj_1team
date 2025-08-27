package com.middlepj.ict05.domain.member.controller;


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
public class MemberController {

	@Autowired
	private MemberService service;

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("/main.do")
	public String main() {
		logger.info("<<< url ==>  /main.do >>>");

		return "common/layout";
	}

	@RequestMapping("/login.do")
	public String login() {
		logger.info("<<< url ==>  /login.do >>>");

		return "member/login/login";
	}

	@RequestMapping("/loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /loginAction.do >>>");

		service.loginAction(request, response, model);

		return "member/login/loginAction";
	}
	
	@RequestMapping("/join.do")
	public String join() {
		logger.info("<<< url ==>  /join.do >>>");

		return "member/join/join";
	}
	
	// id 중복확인 버튼 클릭시
	@RequestMapping("/emailCheckAction.do")
	public String emailCheckAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /emailCheckAction.do >>>");
		
		service.emailCheckAction(request, response, model);
		
		return "member/join/emailCheckAction";
	}
	
	// 회원가입 버튼 클릭시
	@RequestMapping("/joinAction.do")
	public String joinAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /joinAction.do >>>");

		service.signUpAction(request, response, model);
		
		return "member/join/joinAction";
	}
	@RequestMapping("/myPage.do")
	public String myPage(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myPage.do >>>");

	
		return "myprofile/myPage";
	}

}
