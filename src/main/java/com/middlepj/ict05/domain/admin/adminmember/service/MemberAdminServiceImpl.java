package com.middlepj.ict05.domain.admin.adminmember.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.admin.adminmember.dao.MemberAdminDAO;
import com.middlepj.ict05.domain.admin.adminmember.dto.MemberAdminDTO;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Autowired
	private MemberAdminDAO dao;

	// 회원 목록
	public void memberListAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberListAction()");
		
		String pageNum = request.getParameter("pageNum");
		
		int total = dao.memberCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		// HashMap 생성후 추가
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("start", start);
		map.put("end", end);
		
		List<MemberAdminDTO> list = dao.memberList(map);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
	}
	
	// 회원 등록
	public void memberAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberAddAction()");
		
	}
	
	// 회원 상세
	public void memberDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberDetailAction()");
		
	}
	// 회원 수정
	public void memberUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberUpdateAction()");
		
	}
	
	// 회원 삭제
	public void memberDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberDeleteAction()");
		
	}
}