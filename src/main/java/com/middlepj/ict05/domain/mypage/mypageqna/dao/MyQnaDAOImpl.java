package com.middlepj.ict05.domain.mypage.mypageqna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.middlepj.ict05.domain.mypage.mypageqna.dto.MyQnaDTO;

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

	// 게시글 갯수 구하기
	@Override
	public int listCnt(int mb_id) {
		
		System.out.println("MyQnaDAOImpl - listCnt()");
		
		int total = sqlsession.selectOne("com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAO.listCnt", mb_id);
				
		return total;
	}
	
	// 게시글 목록
	
	
	// 게시글 갯수 구하기
	
	// 2. 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	

	// 3. 게시글 수정 
	
	
	// 게시글 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)

}
