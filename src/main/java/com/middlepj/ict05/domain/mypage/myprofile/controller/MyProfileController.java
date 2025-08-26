package com.middlepj.ict05.domain.mypage.myprofile.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.middlepj.ict05.domain.mypage.myprofile.sevice.MyProfileService;

public class MyProfileController {

		@Autowired
		private MyProfileService service;

		private static final Logger logger = LoggerFactory.getLogger(MyProfileController.class);


		@RequestMapping("/myProfileEdit.do")
		public String main() {
			logger.info("<<< url ==>  /myProfileEdit.do >>>");

			return "myprofile/myProfileEdit";
		}

		@RequestMapping("/myProfileGrade.do")
		public String login() {
			logger.info("<<< url ==>  /myProfileGradedo.do >>>");

			return "myprofile/myProfileGrade";
		}

		@RequestMapping("/loginAction.do")
		public String loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException {
			logger.info("<<< url ==>  /loginAction.do >>>");

			//service.loginAction(request, response, model);

			return "user/login/loginAction";
		}

	

}
