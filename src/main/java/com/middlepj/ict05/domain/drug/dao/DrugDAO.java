package com.middlepj.ict05.domain.drug.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.drug.dto.DrugReviewDTO;

public interface DrugDAO {

	// 검색
	public int drugSearchCnt(Map<String, Object> map);
	public List<DrugDTO> drugSearchList(Map<String, Object> map);
	
	// 영양제 목록
	public List<DrugDTO> drugList(Map<String, Object> map);
	
	// 해당 영양제 개수 카운팅
	public int drugCnt();
	
	// 영양제 추가 버튼 클릭 시 - 내 영양제에 추가
	public int addDrug(String mbId, int drId);
	
	// 내 영양제 확인
	public int countMyDrug(String mbId, int drId);
	
	// 영양제 상세 처리
	public DrugDTO getDrugDetail(int dr_id);
	
	// 후기 목록
	public List<DrugReviewDTO> drugReviewList(Map<String, Object> map);
	
	// 후기 등록 처리
	public void insertReview(DrugReviewDTO dto);
	
}

