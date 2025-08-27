package com.middlepj.ict05.domain.mypage.myprofile.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.mypage.myprofile.dao.MyProfileDAO;

@Service
public class MyProfileServiceImpl implements MyProfileService{

	@Autowired
	private MyProfileDAO dao;
	
//	@Override
//	public void myProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException{
//		System.out.println("service=>myProfile");
//		// 설문dto에 저장된 회원정보 불러와서 화면에 표시
//		
//	}
//	
//	@Override
//	public void myProfileEditAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException{
//		System.out.println("service=>myProfileEdit");
//		// 화면에 표시된 정보 수정해서 update
//		
//	}
//
//	@Override
//	public void myProfileGradeAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException{
//		System.out.println("service=>myProfileGrade");
//		// 이거는 이메일 요청이긴한데 모르겟네
//		
//	}
//
//	@Override
//	public void deleteMemberAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException{
//		System.out.println("service=>deleteMember");
//		// 탈퇴라서 회원 delete나 안보임 처리 예정
//		
//	}


	
}
