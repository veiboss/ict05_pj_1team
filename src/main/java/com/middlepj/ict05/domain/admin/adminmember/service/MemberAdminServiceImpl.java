package com.middlepj.ict05.domain.admin.adminmember.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.admin.adminmember.dao.MemberAdminDAO;
import com.middlepj.ict05.domain.admin.adminmember.dto.MemberAdminDTO;
import com.middlepj.ict05.domain.admin.adminmember.dto.MemberSearchDTO;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Autowired
	private MemberAdminDAO dao;

	// 회원 목록
	public void memberListAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberListAction()");
		
		String pageNum = request.getParameter("pageNum");
		String s_grade = request.getParameter("s_grade");
		String s_keyword = request.getParameter("s_keyword");

		System.out.println("검색조건 => grade=" + s_grade + ", keyword=" + s_keyword);
		
		// SearchDTO
		MemberSearchDTO searchDTO = new MemberSearchDTO();
		searchDTO.setS_grade(s_grade);
		searchDTO.setS_keyword(s_keyword);
		
		// total 구할 때 조건 반영
		int total = dao.memberCnt(searchDTO);
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		// HashMap 생성후 추가
//		Map<String, Object> map = new HashMap<String, Object>(); 
//		map.put("start", start);
//		map.put("end", end);
		
		searchDTO.setStart(start);
		searchDTO.setEnd(end);

		List<MemberAdminDTO> list = dao.memberList(searchDTO);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("s_grade", s_grade);
		model.addAttribute("s_keyword", s_keyword);
		
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
		
		int mb_id = Integer.parseInt(request.getParameter("mbId"));
		
		System.out.println("mb_id : " + mb_id);
		
		int deleteCnt = dao.memberDelete(mb_id);
		System.out.println("deleteCnt : " + deleteCnt);
		
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("mbId", mb_id);
	}
}