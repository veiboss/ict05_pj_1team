package com.middlepj.ict05.domain.admin.adminreview.controller;

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

import com.middlepj.ict05.domain.admin.adminhome.AdminHomeController;
import com.middlepj.ict05.domain.admin.adminreview.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminHomeController.class);

	/* 후기 리스트 이동 */
	@RequestMapping("/review.ad")
	public String review(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /review.ad >>>");

		service.reviewList(request, response, model);
		return "adminReview/reviewList";
	}
	
	@RequestMapping("/reviewSearch.ad")
	public String reviewSearch(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /reviewSearch.ad >>>");

		return "adminReview/reviewList";
	}
}
