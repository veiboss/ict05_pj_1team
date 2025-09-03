package com.middlepj.ict05.domain.mypage.mypagesurvey.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middlepj.ict05.domain.drug.service.DrugServiceImpl;
import com.middlepj.ict05.domain.mypage.mypagesurvey.service.MypageSurveyServiceImpl;

@Controller
public class MypageSurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageSurveyController.class);
	
	@Autowired
	private MypageSurveyServiceImpl service;
	@Autowired
	private DrugServiceImpl drugService;
	
	// 회원 설문 내용 등록 페이지
	@RequestMapping("MA13")
	public String addSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("ProfileCMypageSurveyControllerontroller-addSurvey");
		return "myPage/myPageSurvey/survey";
	}
	
	// 회원 설문 내용 등록 처리
	@RequestMapping("MA14")
	public String addSurveyAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("MypageSurveyController-addSurveyAction");
		service.insertSurvey(request, response, model);
		return "myPage/myPageSurvey/surveyAddAction";
	}
	
	
	// 회원 설문 결과 페이지
	@RequestMapping("MA15")
	public String resultSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("MypageSurveyController-resultSurvey");
		service.resultScoreSurvey(request, response, model);
		service.recommendPill(request, response, model);
		return "myPage/myPageSurvey/surveyResult";
	}
	
	//
	// 영양제 추가 클릭 시 - 내 영양제에 추가
	@RequestMapping(value = "MA16", method = RequestMethod.POST)
	@ResponseBody // JSON을 바로 반환
	public Map<String, String> survey_drug_addAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws IOException, ServletException {
		logger.info("MypageSurveyController-survey_drug_addAction");
		Map<String, String> messageMap = drugService.drugAddAction(request, null, null);
		return messageMap; // {"msg":"..."}
	}
	
	// 회원 최근 설문 목록
	@RequestMapping("MA20")
	public String recentSurvey(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("MypageSurveyController-recentSurvey");
		service.resultScoreSurvey(request, response, model);
		service.listSurvey(request, response, model);
		return "myPage/myPageSurvey/surveyList";
	}
}
