package com.middlepj.ict05.domain.mypage.mypageqna.controller;

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

import com.middlepj.ict05.domain.mypage.mypageqna.service.MyQnaServiceImpl;
import com.middlepj.ict05.domain.mypage.mypagereview.controller.MyReviewController;

@Controller
public class MyQnaController {

private static final Logger logger = LoggerFactory.getLogger(MyReviewController.class);	
	
	@Autowired
	private MyQnaServiceImpl service;
	
	 // 1. qna 상세 목록
	 @RequestMapping("/myQnaList.do")
	 public String myQnaList(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaList.do >>>");
	
		 service.qnaListAction(request, response, model);
		 
		 return "myPage/myPageQna/myQnaList"; 
		 
	 
	 }
	 
	
	
	// 2. 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	
	
	// 3. 게시글 수정 
	
	
	// 게시글 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
}
