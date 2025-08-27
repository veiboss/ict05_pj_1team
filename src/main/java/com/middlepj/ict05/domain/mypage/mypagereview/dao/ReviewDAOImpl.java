package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.ReviewDTO;

@ Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@ Autowired
	private SqlSession sqlSession;

	
	// 게시글 목록
	@Override
	public List<ReviewDTO> reviewList(int mb_id) {
		return null;
	}

	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	@Override
	public ReviewDTO reviewDetail(int rv_id) {
		return null;
	}

	// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	@Override
	public void updateReview(ReviewDTO dto) {
		
	}

	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	@Override
	public void deleteReview(int rv_id) {
		
	}
	
	
	
	


}
