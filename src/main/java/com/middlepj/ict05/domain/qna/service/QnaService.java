package com.middlepj.ict05.domain.qna.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.qna.dao.QnaDao;
import com.middlepj.ict05.domain.qna.dto.QnaAnswer;
import com.middlepj.ict05.domain.qna.dto.QnaDto;
import com.middlepj.ict05.domain.qna.dto.QnaForm;
import com.middlepj.ict05.domain.qna.dto.QnaList;
import com.middlepj.ict05.domain.qna.dto.QnaSearchDto;




@Service
public class QnaService {

	@Autowired
	private QnaDao dao;
	
	/**
	 * QnA 전체 목록 질의
	 * @param request
	 * @return
	 */
	public QnaList qnaList(HttpServletRequest request) {
		QnaSearchDto qnaSearchDto = new QnaSearchDto();

		qnaSearchDto.setMode(request.getParameter("mode"));
		qnaSearchDto.setS(request.getParameter("s"));

		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);

		int total = dao.qnaCnt(qnaSearchDto);
		paging.setTotalCount(total);

		int start = paging.getStartRow();
		int end   = paging.getEndRow();

		qnaSearchDto.setStart(start);
		qnaSearchDto.setEnd(end);

		QnaList qnaList = new QnaList();
		qnaList.setQnaList(dao.qnaList(qnaSearchDto));
		qnaList.setPaging(paging);

		return qnaList;
	}
	
	public QnaList qnaAdminList(HttpServletRequest request) {
		QnaSearchDto qnaSearchDto = new QnaSearchDto();

		qnaSearchDto.setMode(request.getParameter("mode"));
		qnaSearchDto.setS(request.getParameter("s"));

		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);

		int total = dao.qnaAdminCnt(qnaSearchDto);
		paging.setTotalCount(total);

		int start = paging.getStartRow();
		int end   = paging.getEndRow();

		qnaSearchDto.setStart(start);
		qnaSearchDto.setEnd(end);

		QnaList qnaList = new QnaList();
		qnaList.setQnaList(dao.qnaAdminList(qnaSearchDto));
		qnaList.setPaging(paging);

		return qnaList;
	}
	
	/**
	 * QnA 등록
	 * @param dto
	 * @return
	 */
	public int insertQna(QnaForm form, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object sessionIdObj = session.getAttribute("sessionID");
		String sessionID = sessionIdObj != null ? sessionIdObj.toString():null;
		
		QnaDto dto = new QnaDto();
		dto.setQa_title(form.getQa_title());
		dto.setQa_content(form.getQa_content());
		dto.setQa_private(form.getQa_private());
		dto.setQa_show(form.getQa_show());
		dto.setQa_readcount(0);
		dto.setQa_writer_id(Integer.parseInt(sessionID));
		
		int insertCnt = dao.insertQna(dto);
		
		return insertCnt;
	}


	public QnaDto detailQna(Integer qa_id) {
		QnaDto dto = dao.getQnaDetail(qa_id);
		return dto;
	}

	public QnaDto answerQna(HttpServletRequest request) {
		QnaAnswer answer = new QnaAnswer();
		answer.setQa_id(Integer.parseInt(request.getParameter("qa_id")));
		answer.setMb_id(1);
		answer.setQa_answer(request.getParameter("qa_answer"));

		dao.answerQna(answer);

		QnaDto dto = dao.getQnaDetail(answer.getQa_id());
		return dto;
	}
	
	public int modifyQna(QnaForm form, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object sessionIdObj = session.getAttribute("sessionID");
		String sessionID = sessionIdObj != null ? sessionIdObj.toString():null;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("qa_id", form.getQa_id());		
		map.put("qa_title", form.getQa_title());
		map.put("qa_content", form.getQa_content());
		map.put("qa_private", form.getQa_private());
		map.put("qa_show", form.getQa_show());
		map.put("qa_modify_id", Integer.parseInt(sessionID));
		
		int updateCnt = dao.updateQna(map);
		
		return updateCnt;
	}
}
