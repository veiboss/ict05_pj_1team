package com.middlepj.ict05.domain.qna.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.qna.dao.QnaDao;
import com.middlepj.ict05.domain.qna.dto.QnaAnswer;
import com.middlepj.ict05.domain.qna.dto.QnaDto;
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
	
	/**
	 * QnA 등록
	 * @param dto
	 * @return
	 */
	public int insertQna(HttpServletRequest request) {
		QnaDto dto = new QnaDto();
		dto.setMb_id(1);
		dto.setQa_title(request.getParameter("qa_title"));
		dto.setQa_content(request.getParameter("qa_content"));
		String qaPrivateStr = request.getParameter("qa_private");
		char qaPrivate = qaPrivateStr != null && qaPrivateStr.length() > 0 
		                 ? 'Y' 
		                 : 'N';   // 기본값
		dto.setQa_private(qaPrivate);
		dto.setQa_readcount(0);
		String showPrivateStr = request.getParameter("qa_show");
		char showPrivate = showPrivateStr != null && showPrivateStr.length() > 0 
                ? 'Y' 
                : 'N';   // 기본값
		dto.setQa_show(showPrivate);
		dto.setQa_writer_id(1);
		
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
		answer.setDr_id(1);
		answer.setQa_answer(request.getParameter("qa_answer"));

		dao.answerQna(answer);

		QnaDto dto = dao.getQnaDetail(answer.getQa_id());
		return dto;
	}
}
