package com.middlepj.ict05.domain.mypage.mypagedrug.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MyPageDrugService {

	public void myPageDrugList(HttpServletRequest request, HttpServletResponse response, Model model)
		throws ServletException, IOException;
	
	public void myPageDrugDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
