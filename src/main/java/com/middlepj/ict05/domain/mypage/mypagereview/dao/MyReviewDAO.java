package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.MyReviewDTO;

public interface MyReviewDAO {

	// 게시글 목록
	public List<MyReviewDTO> reviewList(int mb_id);
//	
//	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
//	public ReviewDTO reviewDetail(int rv_id);
//		
//		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
//	public void updateReview(ReviewDTO dto);
//	
//	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
//	public void deleteReview(int rv_id);
		
	
	
}
