package com.middlepj.ict05.domain.admin.adminreview.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.admin.adminreview.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSession sqlSession;
	
	// 관리자인지 체크할거임
	@Override
	public int userCheck(String strId) {
		System.out.println("ReviewDAOImpl - userCheck()");
		
		int userCnt = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.userCheck", strId);
		
		return userCnt;
	}

	// 후기 갯수 구할거임
	@Override
	public int boardCnt() {
		System.out.println("ReviewDAOImpl - boardCnt()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.boardCnt");
		
		// 5. list를 리턴
		return total;
	}

	// 목록 뿌릴거임
	@Override
	public List<ReviewDTO> reviewList(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - reviewList()");
		List<ReviewDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.reviewList", map);
		
		return list;
	}
	
	@Override
	public int boardSearchCnt(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - boardSearchCnt()");
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.boardSearchCnt", map);
		
		return total;
	}

	@Override
	public List<ReviewDTO> reviewSearchList(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - reviewSearchList()");
		List<ReviewDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.reviewSearchList", map);
		
		return list;
	}

	@Override
	public ReviewDTO review_detailAction(int rv_id) {
		System.out.println("ReviewDAOImpl - review_detailAction()");
		ReviewDTO dto = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO.review_detailAction", rv_id);
		
		return dto;
	}

}
