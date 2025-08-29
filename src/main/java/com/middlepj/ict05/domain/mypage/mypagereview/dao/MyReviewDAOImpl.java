package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.MyReviewDTO;

@ Repository
public class MyReviewDAOImpl implements MyReviewDAO{
	
	@ Autowired
	private SqlSession sqlSession;

	
	// 게시글 목록
	@Override
	public List<MyReviewDTO> reviewList(Map<String, Object> map) {
		
		System.out.println("ReviewDAOImpl - reviewList()");
		
		List<MyReviewDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAO.reviewList", map);
		
		return list;
	}

	// 내후기 리스트 갯수 구하기
	@Override
	public int listCnt(int mb_id) {
		
		System.out.println("ReviewDAOImpl - listCnt()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAO.listCnt", mb_id);
		
		return total;
	}

	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	@Override
	public MyReviewDTO reviewDetail(int rv_id) {
		
		System.out.println("ReviewDAOImpl - reviewDetail");
		
		MyReviewDTO dto = sqlSession.selectOne("com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAO.reviewDetail", rv_id);
		
		return dto;
	}

	// 2-1. 게시글 수정 (내용, 별점)
	@Override
	public void updateReview(MyReviewDTO dto) {
		
		System.out.println("ReviewDAOImpl - updateReview");
		
		sqlSession.update("com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAO.updateReview", dto);
		
	}

	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	@Override
	public void deleteReview(int rv_id) {
		
		System.out.println("ReviewDAOImpl - deleteReview");
		
		sqlSession.update("com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAO.deleteReview", rv_id);
		
	}
	

}
