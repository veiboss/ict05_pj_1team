package com.middlepj.ict05.domain.home.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


public interface ProfileService {
	
	// 프로필 등록 페이지
	public void insertProfile(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 프로필 등록
	public void insertProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
