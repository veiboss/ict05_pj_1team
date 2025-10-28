package com.middlepj.ict05.domain.mypage.myprofile.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MyProfileService {

	public void myProfileDetail(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	public void myProfileUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	public void myProfileDelete(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
}
