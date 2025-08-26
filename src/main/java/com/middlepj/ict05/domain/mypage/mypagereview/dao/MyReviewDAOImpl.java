package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.ReviewDTO;

@ Repository
public class MyReviewDAOImpl implements ReviewDAO{
	
	@ Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReviewDTO> reviewList(int mb_id) {
		return null;
	}
	
	// 게시글 목록

}
