package com.middlepj.ict05.domain.mypage.mypageqna.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public class MyQnaServiceImpl implements MyQnaService{

	// 1. qna 상세 목록 
	@Override
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - qnaListAction()");
		
	}
	
	// 2. 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	
	
	// 3. 게시글 수정 
	
	
	// 게시글 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)

}
