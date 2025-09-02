package com.middlepj.ict05.domain.mypage.mypagesurvey.controller;

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

import com.middlepj.ict05.domain.mypage.mypagesurvey.service.MypageSurveyServiceImpl;

@Controller
public class MypageSurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageSurveyController.class);
	
	@Autowired
	private MypageSurveyServiceImpl service;
	
	// 회원 설문 내용 등록 페이지
		@RequestMapping("MA13")
		public String addSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
				throws ServletException, IOException {
			logger.info("ProfileCMypageSurveyControllerontroller-addSurvey");
			return "mypage/mypagesurvey/survey";
		}
		
		// 회원 설문 내용 등록 처리
		@RequestMapping("MA14")
		public String addSurveyAction(HttpServletRequest request, HttpServletResponse response, Model model) 
				throws ServletException, IOException {
			logger.info("MypageSurveyController-addSurveyAction");
			service.insertSurvey(request, response, model);
			return "mypage/mypagesurvey/surveyAddAction";
		}
		
		
		// 회원 설문 결과 페이지
		@RequestMapping("MA15")
		public String resultSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
				throws ServletException, IOException {
			logger.info("MypageSurveyController-resultSurvey");
			service.resultScoreSurvey(request, response, model);
			service.recommendPill(request, response, model);
			return "mypage/mypagesurvey/surveyResult";
		}
		
		// 회원 최근 설문 목록
		@RequestMapping("MA20")
		public String recentSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
				throws ServletException, IOException {
			logger.info("MypageSurveyController-recentSurvey");
			service.resultScoreSurvey(request, response, model);
			service.listSurvey(request, response, model);
			return "mypage/mypagesurvey/surveyList";
		}
}
