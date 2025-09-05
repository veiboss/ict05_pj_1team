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
	
private static final Logger logger = LoggerFactory.getLogger(MyProfileController.class);	
	
	@Autowired
	private MyProfileService service;
//	// 1. 마이페이지 상세화면
//	@RequestMapping("/myProfileAction.do")
//	public String myProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==> /myProfileAction.do >>>");
//		
//		service.myProfileDetail(request, response, model);
//		return "myPage/myprofile/myProfileAction";
//		
//	}
	
	// 2. 수정버튼 클릭시 - 수정창으로 
		@RequestMapping("/myProfileUpdate.do")
		public String myProfileUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException {
			logger.info("<<< url ==> /myProfileUpdate.do >>>");
			
			service.myProfileDetail(request, response, model);
//			service.myProfileUpdate(request, response, model);
			return "myPage/myprofile/myProfileEditAction";
		
		}
		
		// 3. 수정창에서 버튼 클릭시 - 적용하고 메인으로
			@RequestMapping("/myProfileUpdateAction.do")
			public String myProfileUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
					throws ServletException, IOException {
				logger.info("<<< url ==> /myProfileUpdate.do >>>");
				
				service.myProfileUpdate(request, response, model);
				return "myPage/myPage";
			
			}
	
	
	// 3. 탈퇴버튼 클릭시 - 비밀번호 체크 창 띄우기
	@RequestMapping("/myProfileDelete.do")
	public String myProfileDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myProfileDelete.do >>>");
		
		
		return "myPage/myprofile/myProfileDelete";
	
	}
	// 4. 탈퇴 처리 - 처리시 메인화면으로
	@RequestMapping("/myProfileDeleteAction.do")
	public String myProfileDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myProfileDeleteAction.do >>>");
		
		service.myProfileDelete(request, response, model);
		return "myPage/myprofile/myProfileDeleteAction";
	
	}
	

}
