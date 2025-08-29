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

import com.middlepj.ict05.domain.mypage.mypagereview.service.MyReviewServiceImpl;


@Controller
public class MyReviewController {
	
private static final Logger logger = LoggerFactory.getLogger(MyReviewController.class);	
	
	@Autowired
	private MyReviewServiceImpl service;
	
	// 1. 게시글 상세화면 목록
	@RequestMapping("/myReviewList.do")
	public String myReviewList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myReview_list.do >>>");
		
		service.reviewListAction(request, response, model);
		
		return "myPage/myPageReview/reviewList";
		
	}
	
	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	@RequestMapping("/myReviewDetail.do")
	public String myReviewDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myReviewDetail.do >>>");
		
		service.reviewDetailAction(request, response, model);
		
		return "myPage/myPageReview/reviewDetail";
	
	}
	
		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	@RequestMapping("/myReviewUpdate.do")
	public String myReviewUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /myReviewUpdate.do >>>");
		
		service.reviewUpdateAction(request, response, model);
		
		return "myPage/myPageReview/reviewDetail";
	
	}
	
//	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
//	@RequestMapping("/myReviewDelete.do")
//	public String myReviewDelete(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		logger.info("<<< url ==> /myReviewDelete.do >>>");
//		
//		service.reviewDeleteAction(request, response, model);
//		
//		return "myPage/myPageReview/reviewList";
//	
//	}
	

}
