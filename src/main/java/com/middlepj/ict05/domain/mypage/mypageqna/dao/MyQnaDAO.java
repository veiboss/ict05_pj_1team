package com.middlepj.ict05.domain.mypage.mypageqna.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.mypage.mypageqna.dto.MyQnaDTO;

public interface MyQnaDAO {

	
	// qna 상세 목록 
	public List<MyQnaDTO> qnaList(Map<String,Object> map);
	
	// qna 갯수 구하기
	public int listCnt(Map<String, Object> map);
	
	// 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	public MyQnaDTO qnaDetail(int qa_id);
	
	// qna 답변 확인용
	public MyQnaDTO selectQnaDetail(int qa_id);

	// qna 수정 
	public void updateQna(MyQnaDTO dto);
	
	// 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
	public int deleteQna(int qa_id);
}
