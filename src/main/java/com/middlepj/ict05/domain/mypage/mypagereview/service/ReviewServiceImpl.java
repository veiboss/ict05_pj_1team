package com.middlepj.ict05.domain.mypage.mypagereview.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.mypage.mypagereview.dao.ReviewDAOImpl;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAOImpl dao;

	// 1. 게시글 목록
	@Override
	public void reviewListAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewListAction()");
		
		// 저장되어 있는 값을 
		
	}

	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	@Override
	public void reviewDetailAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewDetailAction()");
		
	}

		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	@Override
	public void reviewUpdateAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewUpdateAction()");
		
	}

	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	@Override
	public void reviewDeleteAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewDeleteAction()");
		
	}
	
}
