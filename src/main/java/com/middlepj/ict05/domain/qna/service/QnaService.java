package com.middlepj.ict05.domain.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.qna.dao.QnaDao;
import com.middlepj.ict05.domain.qna.dto.QnaDto;


@Service
public class QnaService {

	@Autowired
	private QnaDao dao;
	
	public List<QnaDto> qnaList(HttpServletRequest request, HttpServletResponse response) {
		
		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		
		int total = dao.qnaCnt();
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		List<QnaDto> list = dao.qnaList(start, end);
		
		return null;
	}

	
	
}
