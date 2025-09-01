package com.middlepj.ict05.domain.mypage.mypagereview.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.mypage.mypagereview.dto.MyReviewDTO;

public interface MyReviewDAO {

	// 게시글 목록
	public List<MyReviewDTO> reviewList(Map<String, Object> map);
	
	// 게시글 갯수 구하기
	public int listCnt(int mb_id);
	
	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	public MyReviewDTO reviewDetail(int rv_id);
		
		// 2-1. 게시글 수정 (내용, 별점)
	public void updateReview(MyReviewDTO dto);
	
	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
	public void deleteReview(int rv_id);
		
	
	
}
