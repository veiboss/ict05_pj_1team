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
}