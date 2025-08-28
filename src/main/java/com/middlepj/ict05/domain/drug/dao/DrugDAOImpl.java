package com.middlepj.ict05.domain.drug.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.drug.dto.DrugReviewDTO;
import com.middlepj.ict05.domain.drug.dto.DrugSearchDTO;

@Repository
public class DrugDAOImpl implements DrugDAO{

	@Autowired
	private SqlSession sqlSession;

	// 영양제 검색 
	@Override
	public List<DrugSearchDTO> drugSearch(String keyword) {
		System.out.println("=== drugDAO - drugSearch() ===");
		
		//List<DrugSearchDTO> list = sqlSession.selectList("", keyword);
		
		return null;
	}

	// 영양제 목록
	@Override
	public List<DrugDTO> drugList(Map<String, Object> map) {
		System.out.println("=== drugDAO - drugList() ===");
		
		return null;
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
	
	// 영양제 확인
	@Override
	public int countDrug(String mbId, int drId) {
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