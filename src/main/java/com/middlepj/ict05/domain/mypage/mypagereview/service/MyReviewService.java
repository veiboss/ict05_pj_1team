package com.middlepj.ict05.domain.mypage.mypagereview.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MyReviewService {
	
	// 1. 게시글 상세화면 목록
	public void reviewListAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException;
	
	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	public void reviewDetailAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException;
	
		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	public void reviewUpdateAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException;
	
	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	public void reviewDeleteAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException;
	
}
