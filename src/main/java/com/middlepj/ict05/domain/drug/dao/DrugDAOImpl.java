package com.middlepj.ict05.domain.drug.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.drug.dto.DrugReviewDTO;

@Repository
public class DrugDAOImpl implements DrugDAO{

	@Autowired
	private SqlSession sqlSession;

	// 영양제 검색 시 - 총 개수 
	@Override
	public int drugSearchCnt(Map<String, Object> map) {
		
		int searchCnt = sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.drugSearchCnt", map);
		
		return searchCnt;
	}

	// 영양제 검색 시 - 목록
	@Override
	public List<DrugDTO> drugSearchList(Map<String, Object> map) {
		
		List<DrugDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.drug.dao.DrugDAO.drugSearchList", map);
		
		return list;
	}
	
	// 영양제 목록
	@Override
	public List<DrugDTO> drugList(Map<String, Object> map) {
		System.out.println("=== drugDAO - drugList() ===");
		
		List<DrugDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.drug.dao.DrugDAO.drugList", map);

		return list;
	}
	
	// 해당 영양제 개수 카운팅
	@Override
	public int drugCnt() {
		System.out.println("=== drugDAO - drugCnt() ===");
		
		int selectCnt = sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.drugCnt");
		
		return selectCnt;
	}
	
	// 영양제 추가 버튼 클릭 시 - 내 영양제에 추가
	@Override
	public int addDrug(String mbId, int drId) {
		System.out.println("=== drugDAO - addDrug() ===");
		
		return 0;
	}
	
	// 내 영양제 확인
	@Override
	public int countMyDrug(String mbId, int drId) {
		System.out.println("=== drugDAO - countDrug() ===");
		
		return 0;
	}
	
	// 영양제 상세 처리
	@Override
	public DrugDTO getDrugDetail(int dr_id) {
		System.out.println("=== drugDAO - getDrugDetail() ===");
		
		return null;
	}
	
	// 후기 목록
	@Override
	public List<DrugReviewDTO> drugReviewList(Map<String, Object> map) {
		System.out.println("=== drugDAO - drugReviewList() ===");
		
		return null;
	}
	
	// 후기 등록 처리
	@Override
	public void insertReview(DrugReviewDTO dto) {
		System.out.println("=== drugDAO - insertReview() ===");
		
	}

	
}