//package com.middlepj.ict05.controller;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.middlepj.ict05.service.CustomerService;
//
//
//
//public class CustomerControllerddd {
//	
//	@Autowired
//	private CustomerService service;
//
//	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
//
//	@RequestMapping("/main.do")
//	public String main() {
//		logger.info("<<< url ==>  /main.do >>>");
//
//		return "common/main";
//	}
//	
//	@RequestMapping("/login.do")
//	public String login() {
//		logger.info("<<< url ==>  /login.do >>>");
//
//		return "customer/login/login";
//	}
//	
//	@RequestMapping("/loginAction.do")
//	public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /loginAction.do >>>");
//
//		service.loginAction(request, response, model);
//		return "customer/login/loginAction";
//	}
//	
//	@RequestMapping("/MA20.do")
//	public String MA20() {
//		logger.info("<<< url ==>  /MA20.do >>>");
//
//		return "MA/MA20";
//	}
//	
//	@RequestMapping("/PL10.do")
//	public String PL10() {
//		logger.info("<<< url ==>  /PL10.do >>>");
//
//		return "PL/PL10";
//	}
//
//	@RequestMapping("/SI20.do")
//	public String SI20() {
//		logger.info("<<< url ==>  /SI20.do >>>");
//
//		return "SI/SI20";
//	}
//	
//	@RequestMapping("/MY10.do")
//	public String MY10() {
//		logger.info("<<< url ==>  /MY10.do >>>");
//
//		return "MY/MY10";
//	}
//
//	
//	@RequestMapping("/QA10.do")
//	public String QA10() {
//		logger.info("<<< url ==>  /QA10.do >>>");
//
//		return "QA/QA10";
//	}
//
//	/* 관리자 레이아웃 */
//	@RequestMapping("/layout.ad")
//	public String layout() {
//		logger.info("<<< url ==>  /layout.ad >>>");
//
//		return "admin/common/layout";
//	}
//	
//	@RequestMapping("/login.ad")
//	public String loginAd() {
//		logger.info("<<< url ==>  /login.ad >>>");
//
//		return "admin/login/login";
//	}
//	
//	@RequestMapping("/loginAction.ad")
//	public String loginAdAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /loginAction.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/login/loginAction";
//	}
//
//	@RequestMapping("/ADP10.ad")
//	public String ADP10(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /ADP10.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/ADP/ADP10";
//	}
//	
//	@RequestMapping("/ADU20.ad")
//	public String ADU20(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /ADU20.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/ADU/ADU20";
//	}
//
//	@RequestMapping("/AQA30.ad")
//	public String AQA30(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /AQA30.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/AQA/AQA30";
//	}
//	@RequestMapping("/AFQ40.ad")
//	public String AFQ40(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /AFQ40.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/AFQ/AFQ40";
//	}
//
//	@RequestMapping("/ARV50.ad")
//	public String ARV50(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==>  /ARV50.ad >>>");
//
//		service.loginAction(request, response, model);
//		return "admin/ARV/ARV50";
//	}
//	
//}