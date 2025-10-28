package com.middlepj.ict05.domain.home.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.home.dao.ProfileDAO;
import com.middlepj.ict05.domain.home.dto.ProfileDTO;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	private ProfileDAO dao;
	
	// 프로필 등록 페이지
	@Override
	public void insertProfile(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProfileServiceImpl-insertProfile");
		int checkNo = ((int)request.getSession().getAttribute("sessionID"));
		int checkCnt = dao.checkProfile(checkNo);
		model.addAttribute("checkCnt", checkCnt);
	}
	
	// 프로필 등록 
	@Override
	public void insertProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProfileServiceImpl-insertProfileAction");
		// 입력 받은 값을 가져와서 DTO에 담는다.
		ProfileDTO dto = new ProfileDTO();
		dto.setMbp_gender(request.getParameter("gender"));
		dto.setMbp_age(Integer.parseInt(request.getParameter("age")));
		dto.setMbp_height(Integer.parseInt(request.getParameter("height")));
		dto.setMbp_weight(Integer.parseInt(request.getParameter("weight")));
		dto.setMbp_int_pill(request.getParameter("interests"));
		dto.setMbp_pill_score(Integer.parseInt(request.getParameter("totalScore")));
		dto.setMbp_disease(request.getParameter("diseases"));
		dto.setMb_id((int)request.getSession().getAttribute("sessionID"));
		dto.setMbp_writer_id((int)request.getSession().getAttribute("sessionID"));
		// DAO에 DTO 보낸다
		int insertCnt = dao.insertProfile(dto);
		model.addAttribute("insertCnt", insertCnt);
	}
}
