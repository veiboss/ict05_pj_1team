package com.middlepj.ict05.domain.faq.controller;

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

import com.middlepj.ict05.HomeController;
import com.middlepj.ict05.domain.faq.service.FaqServiceImpl;

@Controller
public class FaqController {

	@Autowired
	private FaqServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// FAQ 회원 목록
	@RequestMapping("/faq_user_list.fc")
	public String faq_user_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_user_list.fc >>>");

		service.faqUserListAction(request, response, model);
		return "faq/faq_user_list";
	}
}