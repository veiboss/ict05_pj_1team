package com.middlepj.ict05.domain.faq.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.faq.dao.FaqDAO;
import com.middlepj.ict05.domain.faq.dto.FaqDTO;
import com.middlepj.ict05.domain.faq.dto.FaqList;
import com.middlepj.ict05.domain.faq.dto.FaqUserDTO;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO dao;

	// FAQ 회원 목록
	@Override
	public FaqList faqUserListAction(HttpServletRequest request, HttpServletResponse response, Model model)
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

		List<FaqUserDTO> list = dao.userFaqlist(map);
		System.out.println("list : " + list);

		FaqList faqList = new FaqList();

		faqList.setFaqUserList(list);
		faqList.setPaging(paging);

		return faqList;

	}

	// FAQ 목록
	@Override
	public FaqList faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - faqListAction()");

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

		FaqList faqList = new FaqList();

		faqList.setFaqList(list);
		faqList.setPaging(paging);

		return faqList;
	}

	// FAQ 등록(노출/비노출)
	@Override
	public void faqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("FaqServiceImpl - faqInsertAction()");
		
		FaqDTO dto = new FaqDTO();
		dto.setFa_writer_id((Integer)request.getSession().getAttribute("sessionID"));
		dto.setFa_title(request.getParameter("fa_title"));
		dto.setFa_content(request.getParameter("fa_content"));
		dto.setFa_show(request.getParameter("fa_show"));
		dao.insertFaq(dto);
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
