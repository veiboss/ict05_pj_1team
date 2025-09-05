package com.middlepj.ict05.domain.mypage.mypageqna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.mypageqna.dto.MyQnaDTO;

@Repository
public class MyQnaDAOImpl implements MyQnaDAO{

	@Autowired
	private SqlSession sqlsession;
	
	// qna 상세 목록 
	@Override
	public List<MyQnaDTO> qnaList(Map<String, Object> map) {
		
		System.out.println("MyQnaDAOImpl - qnaList()");
		
		List<MyQnaDTO> list = sqlsession.selectList("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.qnaList", map);
		
		return list;
	}

	// qna 갯수 구하기
	@Override
	public int listCnt(Map<String, Object> map) {
		
		System.out.println("MyQnaDAOImpl - listCnt()");
		
		int total = sqlsession.selectOne("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.listCnt", map);
				
		return total;
	}

	// 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	@Override
	public MyQnaDTO qnaDetail(int qa_id) {
		
		System.out.println("MyQnaDAOImpl - qnaDetail()");
		
		MyQnaDTO dto = sqlsession.selectOne("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.qnaDetail", qa_id);
		
		return dto;
	}

	// qna 답변 여부확인
	@Override
	public MyQnaDTO selectQnaDetail(int qa_id) {
		
		System.out.println("MyQnaDAOImpl - selectQnaDetail()");
		
		MyQnaDTO dto = sqlsession.selectOne("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.selectQnaDetail", qa_id);
		
		return dto;
	}
	
 
	// 3. qna 수정
	@Override
	public void updateQna(MyQnaDTO dto) {
		
		System.out.println("MyQnaDAOImpl - updateQna()");
		
		sqlsession.update("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.updateQna", dto);
		
	}

	// 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
	@Override
	public int deleteQna(int qa_id) {
		
		System.out.println("MyQnaDAOImpl - deleteQna()");
		
		int deleteCnt = sqlsession.update("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.deleteQna", qa_id);
		
		return deleteCnt;
	}

	@Override
	public int updateAnswer(MyQnaDTO dto) {
		System.out.println("MyQnaDAOImpl - updateAnswer()");
	    return sqlsession.update("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.updateAnswer", dto);
	
	}

	@Override
	public int deleteAnswer(int qa_id) {
		   System.out.println("MyQnaDAOImpl - deleteAnswer()");
		   
		    return sqlsession.update(
		      "com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.deleteAnswer", qa_id);
	}

}
