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

	
	// 게시글 목
	@Override
	public List<ReviewDTO> reviewList(int mb_id) {
		return null;
	}
	
	
	
	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	
	
	
		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	
		// 2-2. 게시글 삭제 처리 (안보임처리)
	
	
	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	
	
	// 내 후기 목록 페이지로 이동

}
