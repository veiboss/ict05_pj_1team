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
		
		int userCnt = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.ReviewDAO.userCheck", strId);
		
		return userCnt;
	}

	// 후기 갯수 구할거임
	@Override
	public int boardCnt() {
		System.out.println("ReviewDAOImpl - boardCnt()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminreview.ReviewDAO.boardCnt");
		
		// 5. list를 리턴
		return total;
	}

	// 목록 뿌릴거임
	@Override
	public List<ReviewDTO> reviewList(Map<String, Object> map) {
		System.out.println("ReviewDAOImpl - reviewList()");
		List<ReviewDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.adminreview.ReviewDAO.reviewList", map);
		
		return list;
	}

}
