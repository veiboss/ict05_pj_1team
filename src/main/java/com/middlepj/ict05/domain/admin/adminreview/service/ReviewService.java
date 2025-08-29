package com.middlepj.ict05.domain.admin.adminreview.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface ReviewService {

	public void reviewList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	public void review_detailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	public void review_modifyAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
