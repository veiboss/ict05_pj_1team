package com.middlepj.ict05.domain.mypage.myprofile.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.mypage.myprofile.dao.MyProfileDAO;
import com.middlepj.ict05.domain.mypage.myprofile.dto.MyProfileDTO;

@Service
public class MyProfileServiceImpl implements MyProfileService{

	@Autowired
	private MyProfileDAO dao;

	@Override
	public void myProfileDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("service-myProfileUpdate");
		
		int md_id = (int) request.getSession().getAttribute("sessionID");
		
		MyProfileDTO dto = dao.myProfileDetail(md_id);
		System.out.println("찍");
		System.out.println("dto =>"+dto);
		model.addAttribute("dto",dto);
	}
	
	@Override
	public void myProfileUpdate(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("service-myProfileUpdate");
		
		
		MyProfileDTO dto = new MyProfileDTO();
		
		dto.setMb_id((int) request.getSession().getAttribute("sessionID"));
		dto.setMbp_gender(request.getParameter("mbp_gender"));
		dto.setMbp_height(Integer.parseInt(request.getParameter("mbp_height")));
		dto.setMbp_age(Integer.parseInt(request.getParameter("mbp_age")));
		dto.setMbp_weight(Integer.parseInt(request.getParameter("mbp_weight")));
		
		dao.myProfileUpdate(dto);
				
		model.addAttribute("dto",dto);
		
	}

	

	@Override
	public void myProfileDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("service-myProfileDelete");
		
		int sessionID = (int) request.getSession().getAttribute("sessionID");
		String password = request.getParameter("mb_password");
 		
		int deleteCnt = dao.myProfileDelete(sessionID);
		System.out.println("deleteCnt => " + deleteCnt);
		if(deleteCnt == 1) { 
			request.getSession().invalidate();
		} 
		model.addAttribute("deleteCnt", deleteCnt);
		
	}
	
	
	
}
