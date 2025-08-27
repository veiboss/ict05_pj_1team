package com.middlepj.ict05.domain.qna.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.qna.dto.QnaAnswer;
import com.middlepj.ict05.domain.qna.dto.QnaDto;
import com.middlepj.ict05.domain.qna.dto.QnaSearchDto;


@Repository
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// QnA 목록
	public List<QnaDto> qnaList(QnaSearchDto qnaSearchDto) {

		List<QnaDto> result = sqlSession.selectList("com.middlepj.ict05.domain.qna.dao.QnaDao.qnaList", qnaSearchDto);
		
		return result;
	}
	
	// QnA 갯수 카운터
	public int qnaCnt(QnaSearchDto qnaSearchDto) {
		return sqlSession.selectOne("com.middlepj.ict05.domain.qna.dao.QnaDao.qnaCnt", qnaSearchDto);
	}
	
	// QnA 조회수 증가
	public int plusReadCnt(int qa_id) {
		
		return sqlSession.update("com.middlepj.ict05.domain.qna.dao.QnaDao.plusReadCnt", qa_id);
	}
	
	// QnA 상세 처리
	public QnaDto getQnaDetail(int qa_id) {
		int read_count = plusReadCnt(qa_id);
		return sqlSession.selectOne("com.middlepj.ict05.domain.qna.dao.QnaDao.getQnaDetail", qa_id);
	}

	public void answerQna(QnaAnswer qnaAnswer) {
		sqlSession.update("com.middlepj.ict05.domain.qna.dao.QnaDao.answerQna", qnaAnswer);
	}
	
	// QnA 수정삭제 버튼 클릭 시 - 비밀번호 인증처리
	public int password_chk(int qa_id, String password) {
		
		return 0;
	}
	
	// QnA 수정 처리
	public void updateBoard(QnaDto dto) {
		
	}
	
	// QnA 삭제 처리
	public void deleteBoard(int qa_id) {
		
		
	}
	
	// QnA 작성 처리
	public int insertQna(QnaDto dto) {
		
		int insertCnt = sqlSession.insert("com.middlepj.ict05.domain.qna.dao.QnaDao.insertQna", dto);
		
		return insertCnt;
	}
	
	// 답변 작성 처리
	public void insertComment(QnaDto dto) {
		
	}
	
	// 댓글 목록
	public List<QnaDto> commentList(int qa_id) {
		return null;
	}
}
