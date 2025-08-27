package com.middlepj.ict05.domain.mypage.myprofile.controller;

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

import com.middlepj.ict05.domain.mypage.myprofile.service.MyProfileService;

@Controller
public class MyProfileController {

		@Autowired
		private MyProfileService service;

		private static final Logger logger = LoggerFactory.getLogger(MyProfileController.class);


		@RequestMapping("/myProfileAction.do")
		public String myProfileAction() {
			logger.info("<<< url ==>  /myProfileAction.do >>>");
			//마이프로필창으로 이동
			return "myprofile/myProfileAction";
		}
		
//		@RequestMapping("/myProfileEditAction.do")
//		public String myProfileEditAction(HttpServletRequest request, HttpServletResponse response, Model model)
//				throws ServletException, IOException {
//			logger.info("<<< url ==>  /myProfileEditAction.do >>>");
//			//설문 결과에 있던 값 가져와서 디폴트로 띄우다가 변경 후 버튼 클릭
//			service.myProfileEditAction(request,response, model);
//			return "myprofile/myProfileEditAction";
//		}
//
//		@RequestMapping("/myProfileGradeAction.do")
//		public String myProfileGradeAction(HttpServletRequest request, HttpServletResponse response, Model model)
//				throws ServletException, IOException {
//			logger.info("<<< url ==>  /myProfileGradeAction.do >>>");
//			//누르면 관리자한테 이메일 전송
//			service.myProfileGradeAction(request, response, model);
//			return "myprofile/myProfileGradeAction";
//		}
//
//		@RequestMapping("/deleteMemberAction.do")
//		public String deleteMemberAction(HttpServletRequest request, HttpServletResponse response, Model model)
//				throws ServletException, IOException {
//			logger.info("<<< url ==>  /deleteMemberAction.do >>>");
//			//탈퇴하기 누르면 비밀번호 체크 후 탈퇴처리 
//			service.deleteMemberAction(request, response, model);
//			return "myprofile/deleteMemberAction";
//		}

	

}
