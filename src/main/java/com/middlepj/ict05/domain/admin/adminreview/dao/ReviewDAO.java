package com.middlepj.ict05.domain.admin.adminreview.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.admin.adminreview.dto.ReviewDTO;

public interface ReviewDAO {
	
	// 관리자인지 체크할거임
	public int userCheck(String strId);
	
	// 후기 갯수 구할거임
	public int boardCnt();
	
	// 목록 뿌릴거임
	public List<ReviewDTO> reviewList(Map<String, Object> map);
	
	
	public int boardSearchCnt(Map<String, Object> map);
	
	public List<ReviewDTO> reviewSearchList(Map<String, Object> map);
}
