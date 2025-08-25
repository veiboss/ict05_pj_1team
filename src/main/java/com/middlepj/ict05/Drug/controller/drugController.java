package com.middlepj.ict05.Drug.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.middlepj.ict05.User.controller.userController;

@Controller
public class drugController {
	
	private static final Logger logger = LoggerFactory.getLogger(userController.class);
	
	@RequestMapping("/drug_list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /drug_list.do");
		
		return "drug/drug_list";
	}
}
