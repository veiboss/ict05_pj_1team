package com.middlepj.ict05.domain.admin.adminmember.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MemberAdminService {

	// 회원 목록
	public void memberListAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
	
	// 회원 등록
	public void memberAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 상세
	public void memberDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 수정
	public void memberUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 삭제
	public void memberDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}