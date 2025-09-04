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
		System.out.println("=== drugService - myPageDrugList() ===");
		
		int mb_id = (int) request.getSession().getAttribute("sessionID");
		
		List<MyPageDrugDTO> list = dao.myPageDrugList(mb_id);
		
		model.addAttribute("list", list);
		
		
		
	}
}
