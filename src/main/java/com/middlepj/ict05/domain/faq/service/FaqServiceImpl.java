package com.middlepj.ict05.domain.faq.service;

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
import com.middlepj.ict05.domain.faq.dao.FaqDAO;
import com.middlepj.ict05.domain.faq.dto.FaqDTO;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO dao;

	// FAQ 회원 목록
	@Override
	public void faqUserListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - faqUserListAction()");
		
		// 페이징 처리
		String pageNum = request.getParameter("pageNum");
		
		// 전체 게시글 갯수 카운터를 해야 페이징처리 가능
		Paging paging = new Paging(pageNum);
		int total = dao.userFaqCount();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 목록 조회 영역
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<FaqDTO> list = dao.faqlist(map);
		System.out.println("list : " + list);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
		model.addAttribute("paging",paging);
		
	}

	// FAQ 목록
	@Override
	public void faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// FAQ 등록(노출/비노출)
	@Override
	public void faqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// FAQ 상세
	@Override
	public void faqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

	// FAQ 수정(노출/비노출)
	@Override
	public void faqUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}
	
	
}
