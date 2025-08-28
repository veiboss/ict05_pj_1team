package com.middlepj.ict05.domain.faq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.faq.dto.FaqDTO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	 private SqlSession sqlSession;

	
	// FAQ 회원 목록
	@Override
	public List<FaqDTO> userFaqlist(Map<String, Object> map) {
		System.out.println("FaqDAOImpl - userFaqlist()");
		
		List<FaqDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.faq.dto.FaqDTO", map);
		return  list;
	}

	// FAQ 회원 total
	@Override
	public int userFaqCount() {
		return 0;
	}

	// FAQ 관리자 목록
	@Override
	public List<FaqDTO> faqlist(Map<String, Object> map) {
		return null;
	}

	// FAQ 관리자 목록 total
	@Override
	public int faqCount(Map<String, Object> map) {
		return 0;
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
