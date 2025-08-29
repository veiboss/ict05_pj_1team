package com.middlepj.ict05.domain.home.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


public interface ProfileService {
	
	// 프로필 등록 페이지
	public void insertProfile(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 프로필 등록
	public void insertProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 설문 내용 등록
	public void insertSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 설문 결과 페이지
	public void resultScoreSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 사용자 영양제 추천
	public void recommendPill(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 회원 최근 설문 목록
	public void listSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
}
