package com.middlepj.ict05.domain.mypage.mypagedrug.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.mypage.mypagedrug.dao.MyPageDrugDAO;
import com.middlepj.ict05.domain.mypage.mypagedrug.dto.MyPageDrugDTO;

@Service
public class MyPageDrugServiceImpl implements MyPageDrugService{

	@Autowired
	private MyPageDrugDAO dao;

	@Override
	public void myPageDrugList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		int mb_id = (int) request.getSession().getAttribute("sessionID");
		System.out.println("deleteCnt => " + mb_id);
		
		System.out.println("=== drugService - myPageDrugList() ===");
		
		
		List<MyPageDrugDTO> list = dao.myPageDrugList(mb_id);
		
		model.addAttribute("list", list);
		
		
		
	}

	@Override
	public void myPageDrugDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		int dr_id = Integer.parseInt(request.getParameter("dr_id"));
 		
		int mb_id = (int) request.getSession().getAttribute("sessionID");
		System.out.println("sessionID => " + mb_id);
		
		int deleteCnt = dao.myPageDrugDelete(dr_id);
		System.out.println("deleteCnt => " + deleteCnt);
	
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
}
