package com.middlepj.ict05.domain.mypage.mypagereview.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAOImpl;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private MyReviewDAOImpl dao;

	// 게시글 목록
	@Override
	public void reviewListAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewListAction()");
		
		// 저장되어 있는 값을 
		
	}
	
	
}
