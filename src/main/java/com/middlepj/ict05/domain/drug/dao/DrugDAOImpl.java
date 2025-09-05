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
	
	// 영양제 추가 버튼 클릭 시 - 영양제 중복 확인
	@Override
	public int existCnt(Map<String, Object> map) {
		System.out.println("=== drugDAO - existCnt() ===");
		return sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.existCnt", map);
	}
	
	// 영양제 정보 가져오기
	@Override
	public DrugDTO getDrugById(int dr_id) {
		System.out.println("=== drugDAO - getDrugById() ===");
		
		return sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.getDrugById", dr_id);
	}
	
	// 영양제 추가 버튼 클릭 시 - 내 영양제에 추가
	@Override
	public int addDrug(Map<String, Object> map) {
		System.out.println("=== drugDAO - addDrug() ===");
		return sqlSession.insert("com.middlepj.ict05.domain.drug.dao.DrugDAO.addDrug", map);
	}
	
	// 영양제 상세 처리
	@Override
	public DrugDTO getDrugDetail(int dr_id) {
		System.out.println("=== drugDAO - getDrugDetail() ===");
		
		return sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.getDrugDetail", dr_id);
	}
	
	// 후기 목록
	@Override
	public List<DrugReviewDTO> drugReviewList(Map<String, Object> map) {
		System.out.println("=== drugDAO - drugReviewList() ===");
		
		List<DrugReviewDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.drug.dao.DrugDAO.drugReviewList", map);
		
		return list;
	}
	
	// 후기 개수
	@Override
	public int reviewCnt(int dr_id) {
		System.out.println("=== drugDAO - reviewCnt() ===");
		
		int reviewCnt = sqlSession.selectOne("com.middlepj.ict05.domain.drug.dao.DrugDAO.reviewCnt", dr_id);
		
		return reviewCnt;
	}
	
	// 후기 등록 처리
	@Override
	public int insertReview(DrugReviewDTO dto) {
		System.out.println("=== drugDAO - insertReview() ===");
		
		int insertCnt = sqlSession.insert("com.middlepj.ict05.domain.drug.dao.DrugDAO.insertReview", dto);
		
		return insertCnt;
	}

}