package com.middlepj.ict05.domain.qna.dao;

import java.util.List;

import com.middlepj.ict05.domain.qna.dto.QnaDto;


public class QnaDao {

	// Qna 목록
	public List<QnaDto> qnaList(int start, int end) {
		return null;
		
	}
	
	// Qna 갯수 카운터
	public int qnaCnt() {
		return 0;
	}
	
	// Qna 조회수 증가
	public int plusReadCnt() {
		
		return 0;
	}
	
	//Qna 상세 처리
	public QnaDto getQnaDetail(int qa_id) {
		
		return null;
	}
	
	//Qna 수정삭제 버튼 클릭 시 - 비밀번호 인증처리
	public int password_chk(int qa_id, String password) {
		
		return 0;
	}
	
	//Qna 수정 처리
	public void updateBoard(QnaDto dto) {
		
	}
	
	//Qna 삭제 처리
	public void deleteBoard(int qa_id) {
		
		
	}
	
	//Qa 작성 처리
	public void insertQna(QnaDto dto) {
		
	}
	
	//답변 작성 처리
	public void insertComment(QnaDto dto) {
		
	}
	
	//댓글 목록
	public List<QnaDto> commentList(int qa_id) {
		return null;
	}
}
