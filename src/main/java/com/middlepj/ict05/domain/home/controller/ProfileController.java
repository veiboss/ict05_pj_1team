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
	
	// 회원 프로필 내용 등록 페이지
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
	
	// 회원 프로필 내용 등록 실행
	@RequestMapping("MA11")
	public String addProfileAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-addProfileAction");
		service.insertProfileAction(request, response, model);
		return "home/profileAction";
	}
	
	
	// 회원 설문 내용 등록 페이지
	@RequestMapping("MA13")
	public String addSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-addSurvey");
		return "home/survey";
	}
	
	// 회원 설문 내용 등록 페이지
	@RequestMapping("MA14")
	public String addSurveyAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-addSurveyAction");
		service.insertSurvey(request, response, model);
		return "home/surveyAddAction";
	}
	
	
	// 회원 설문 결과 페이지
	@RequestMapping("MA15")
	public String resultSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-resultSurvey");
		service.resultScoreSurvey(request, response, model);
		service.recommendPill(request, response, model);
		return "home/surveyResult";
	}
	
	// 회원 최근 설문 목록
	@RequestMapping("MA20")
	public String recentSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileController-recentSurvey");
		service.resultScoreSurvey(request, response, model);
		service.listSurvey(request, response, model);
		return "home/surveyRecent";
	}
	
}
