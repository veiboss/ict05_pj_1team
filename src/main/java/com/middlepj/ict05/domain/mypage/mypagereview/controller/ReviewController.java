package com.middlepj.ict05.domain.mypage.mypagereview.controller;

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

import com.middlepj.ict05.domain.mypage.mypagereview.service.ReviewServiceImpl;


@Controller
public class ReviewController {
	
private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);	
	
	@Autowired
	private ReviewServiceImpl service;
	
	// 1. 게시글 상세화면 목록
	@RequestMapping("/myReview_list.do")
	public String myReview_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myReview_list.do >>>");
		
		service.reviewListAction(request, response, model);
		
		return "";
		
	}
	
	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	
	
		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	
		// 2-2. 게시글 삭제 처리 (안보임처리)
	
	
	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	
	
	// 내 후기 목록 페이지로 이동
	
	
}
