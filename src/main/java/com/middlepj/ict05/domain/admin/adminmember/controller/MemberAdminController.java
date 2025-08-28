package com.middlepj.ict05.domain.admin.adminmember.controller;

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

import com.middlepj.ict05.domain.admin.adminmember.service.MemberAdminServiceImpl;


@Controller
public class MemberAdminController {

	@Autowired private MemberAdminServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);

	// 회원 목록
	@RequestMapping("/memberList.ad")
	public String memberList(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /memberList.ad >>>");
		
		service.memberListAction(request, response, model);
		
		return "admin_member/memberList";
	}
	
	// 회원 등록
	
	// 회원 등록 처리 => 등록
	
	// 회원 상세
	
	// 회원 수정

	// 회원 삭제
}
