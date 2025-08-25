package com.middlepj.ict05.domain.member.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MemberService {

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
		public void loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException;
}