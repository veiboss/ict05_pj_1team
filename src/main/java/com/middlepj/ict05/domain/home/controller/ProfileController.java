package com.middlepj.ict05.domain.home.controller;

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

import com.middlepj.ict05.domain.home.service.ProfileServiceImpl;


@Controller
public class ProfileController {

	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);

	@Autowired
	private ProfileServiceImpl service;
	

	@RequestMapping("MA10")
	public String addProfile(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-addProfile");
		// 기존 프로필 내용 있는지 체크해서 있으면 home으로 돌려보냄
		if(request.getSession().getAttribute("sessionID") == null) {
			return "member/login/login";
		} else {
			service.insertProfile(request, response, model);
			return "home/profile";
		}
	}
	

	@RequestMapping("MA11")
	public String addProfileAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-addProfileAction");
		service.insertProfileAction(request, response, model);
		return "home/profileAction";
	}
	
}
