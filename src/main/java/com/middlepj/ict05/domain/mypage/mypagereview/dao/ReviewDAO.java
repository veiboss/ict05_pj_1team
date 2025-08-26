package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.ReviewDTO;

public interface ReviewDAO {

	// 게시글 목록
	public List<ReviewDTO> reviewList(int mb_id);
	
	
}
