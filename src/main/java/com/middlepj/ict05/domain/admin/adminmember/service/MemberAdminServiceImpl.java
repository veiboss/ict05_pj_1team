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
		
		// 페이징, 검색 파라미터 가져오기
		String pageNum = request.getParameter("pageNum");
		String s_grade = request.getParameter("s_grade");
		String s_keyword = request.getParameter("s_keyword");
		
		// SearchDTO 생성, setter
		MemberSearchDTO searchDTO = new MemberSearchDTO();
		
		// 검색 키워드 setter 
		searchDTO.setS_grade(s_grade);
		searchDTO.setS_keyword(s_keyword);
		
		// 검색결과 갯수 조건 반영
		int total = dao.memberCnt(searchDTO);
		
		// 페이징 처리
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		// 페이징 처리를 위한 setter
		searchDTO.setStart(start);
		searchDTO.setEnd(end);

		// 목록 처리
		List<MemberAdminDTO> list = dao.memberList(searchDTO);
		
		// jsp로 처리결과 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("s_grade", s_grade);
		model.addAttribute("s_keyword", s_keyword);
	}
	
	// 회원 등록
	public void memberAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberAddAction()");

		// DTO 생성 -> setter
		MemberAdminDTO dto = new MemberAdminDTO();
		dto.setMb_name(request.getParameter("mb_name"));
		dto.setMb_email(request.getParameter("mb_email"));
		dto.setMb_password(request.getParameter("mb_password"));
		dto.setMb_grade(request.getParameter("mb_grade"));
		dto.setMb_writer_id(Integer.parseInt(request.getParameter("mb_writer_id")));

		// 회원등록 처리
		int insertCnt = dao.memberInsert(dto);
		
		// jsp로 처리결과 전달
		model.addAttribute("insertCnt" , insertCnt);
	}
	
	// 회원 상세
	public void memberDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberDetailAction()");
		
		// 목록에서 넘긴 파라미터 가져오기
		// memberList.ad?pageNum=${paging.prev}&s_grade=${s_grade}&s_keyword=${s_keyword}
		int mb_id = Integer.parseInt(request.getParameter("mbId"));
		String pageNum = request.getParameter("pageNum");
		String s_grade = request.getParameter("s_grade");
		String s_keyword = request.getParameter("s_keyword");

		// 회원상세 처리
		MemberAdminDTO dto = dao.memberDetail(mb_id);

		// jsp로 처리결과 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);
		model.addAttribute("s_grade", s_grade);
		model.addAttribute("s_keyword", s_keyword);
	}
	// 회원 수정
	public void memberUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberUpdateAction()");

		// 수정페이지에서 넘긴 파라미터 가져오기
		String hiddenPageNum = request.getParameter("hiddenPageNum");
		int hiddenMbId = Integer.parseInt(request.getParameter("hiddenMbId"));

		// DTO 생성 -> setter
		MemberAdminDTO dto = new MemberAdminDTO();
		dto.setMb_id(hiddenMbId);
		dto.setMb_name(request.getParameter("mb_name"));
		dto.setMb_password(request.getParameter("mb_password"));
		dto.setMb_grade(request.getParameter("mb_grade"));
		dto.setMb_modify_id(Integer.parseInt(request.getParameter("mb_modify_id")));

		// 회원정보 수정 처리
		int updateCnt = dao.memberUpdate(dto);
		
		// jsp로 처리결과 전달
		model.addAttribute("updateCnt" , updateCnt);
		model.addAttribute("hiddenPageNum" , hiddenPageNum);
		model.addAttribute("hiddenMbId" , hiddenMbId);
	}
	
	// 회원 삭제
	public void memberDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException{
		System.out.println("MemberServiceImpl - memberDeleteAction()");

		// 목록에서 넘긴 파라미터 가져오기
		int mb_id = Integer.parseInt(request.getParameter("mbId"));

		// 회원 삭제 처리
		int deleteCnt = dao.memberDelete(mb_id);
		
		// jsp로 처리결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
		model.addAttribute("mbId", mb_id);
	}
}