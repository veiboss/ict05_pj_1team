package com.middlepj.ict05.domain.mypage.mypageqna.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MyQnaService {
	
	// qna 상세 목록
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
//	// qna 수정 
//	public void qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException;
//	
//	// qna 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
//	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException;
}
