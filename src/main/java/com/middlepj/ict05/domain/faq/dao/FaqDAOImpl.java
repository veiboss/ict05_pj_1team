package com.middlepj.ict05.domain.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.faq.dto.FaqDTO;
import com.middlepj.ict05.domain.faq.dto.FaqUserDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	 private SqlSession sqlSession;

	
	// FAQ 회원 목록
	@Override
	public List<FaqUserDTO> userFaqlist(Map<String, Object> map) {
		System.out.println("FaqDAOImpl - userFaqlist()");
		
		List<FaqUserDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.faq.dao.FaqDAO.userFaqlist", map);
		return list;
	}

	// FAQ 회원 total
	@Override
	public int userFaqCount() {
		System.out.println("FaqDAOImpl - userFaqCount()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.faq.dao.FaqDAO.userFaqCount");
		return total;
	}

	// FAQ 관리자 목록
	@Override
	public List<FaqDTO> faqlist(Map<String, Object> map) {
		System.out.println("FaqDAOImpl - faqlist()");
		
		List<FaqDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.faq.dao.FaqDAO.faqlist", map);
		return list;
	}

	// FAQ 관리자 목록 total
	@Override
	public int faqCount(Map<String, Object> map) {
		System.out.println("FaqDAOImpl - faqCount()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.faq.dao.FaqDAO.faqCount");
		return total;
	}
	
	// FAQ 등록(노출/비노출)
	@Override
	public void insertFaq(FaqDTO dto) {
		
	}

	// FAQ 상세
	@Override
	public FaqDTO faqDetail(int fa_id) {
		return null;
	}

	// FAQ 수정(노출/비노출)
	@Override
	public void updateFaq(FaqDTO dto) {
		
	}
	
	
}
