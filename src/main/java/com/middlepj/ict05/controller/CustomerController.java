package com.middlepj.ict05.controller;

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

import com.middlepj.ict05.service.CustomerService;



@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService service;

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@RequestMapping("/main.do")
	public String main() {
		logger.info("<<< url ==>  /main.do >>>");

		return "common/main";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		logger.info("<<< url ==>  /login.do >>>");

		return "customer/login/login";
	}
	
	@RequestMapping("/loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /loginAction.do >>>");

		service.loginAction(request, response, model);

		return "customer/login/loginAction";
	}
	
	@RequestMapping("/brand.do")
	public String brand() {
		logger.info("<<< url ==>  /brand.do >>>");

		return "outline/brand/brandTemp";
	}
	// faq 
	@RequestMapping("/faq.do")
	public String faq() {
		logger.info("<<< url ==>  /faq.do >>>");

		return "customer/temp/사용자FAQ목록";
	}
	
	@RequestMapping("/pill.do")
	public String pill() {
		logger.info("<<< url ==>  /pill.do >>>");

		return "customer/temp/영양제파트";
	}
	
	@RequestMapping("/qna.do")
	public String qna() {
		logger.info("<<< url ==>  /qna.do >>>");

		return "customer/temp/전문가QNA";
	}
	
	@RequestMapping("/myPage.do")
	public String myPage() {
		logger.info("<<< url ==>  /myPage.do >>>");

		return "customer/temp/마이페이지";
	}
	
	/* 관리자 레이아웃 */
	@RequestMapping("/layout.ad")
	public String layout() {
		logger.info("<<< url ==>  /layout.ad >>>");

		return "admin/common/layout";
	}
	
	@RequestMapping("/login.ad")
	public String loginAd() {
		logger.info("<<< url ==>  /login.ad >>>");

		return "customer/temp/관리자페이지";
	}
	
	@RequestMapping("/loginAction.ad")
	public String loginAdAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /loginAction.ad >>>");

		service.loginAction(request, response, model);
		return "admin/login/loginAction";
	}
	
	@RequestMapping("/MA10.do")
	public String MA20() {
		logger.info("<<< url ==>  /MA20.do >>>");

		return "customer/temp/설문";
	}
	
	
	@RequestMapping("/ADU20.ad")
	public String ADU20(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /ADU20.ad >>>");

		return "customer/temp/관리자페이지_회원관리";
	}
	
	@RequestMapping("/AFQ40.ad")
	public String AFQ40(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /AFQ40.ad >>>");

		return "customer/temp/관리자페이지_FAQ목록";
	}
	
	@RequestMapping("/AQA30.ad")
	public String AQA30(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /AQA30.ad >>>");

		return "customer/temp/관리자페이지_전문가QNA";
	}
	
	@RequestMapping("/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /join.do >>>");

		return "customer/temp/회원가입";
	}
}