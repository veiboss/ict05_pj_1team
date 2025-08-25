package com.middlepj.ict05.User.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.User.dao.userDAO;


@Service
public class userServiceImpl implements userService {
	
	@Autowired
	private userDAO dao;

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public void loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("userServiceImpl - loginAction()");
		// 3단계. 화면에서 입력받은 값을 가져온다
		Map<String, Object> map = new HashMap<>();
		map.put("mb_email", request.getParameter("mb_email"));
		map.put("mb_password", request.getParameter("mb_password"));
		// 5단계. 로그인 처리
		int selectCnt = dao.idPasswordChk(map);
		
		// 로그인 성공시 세션ID를 설정(중요)
		if(selectCnt == 1) {
			request.getSession().setAttribute("sessionID", request.getParameter("mb_email"));
		}
		
		// 6단계. jsp로 처리결과를 전달 x
	}
}