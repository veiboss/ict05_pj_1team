package com.middlepj.ict05.domain.faq.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.faq.dto.FaqDTO;
import com.middlepj.ict05.domain.faq.dto.FaqUserDTO;

public interface FaqDAO {

	// FAQ 회원 목록
	public List<FaqUserDTO> userFaqlist(Map<String, Object> map);
	
	// FAQ 회원 total
	public int userFaqCount();

	// FAQ 관리자 목록
	public List<FaqDTO> faqlist(Map<String, Object> map);
	
	// FAQ 관리자 목록 total
	public int faqCount(Map<String,Object> map);

	// FAQ 등록 처리(노출/비노출)
	public void insertFaq(FaqDTO dto);

	// FAQ 상세 
	public FaqDTO faqDetail(int fa_id);

	// FAQ 수정 처리(노출/비노출)
	public int updateFaq(FaqDTO dto);
	
	// FAQ 검색 total
	public int faqSearchCount(Map<String, Object> map);
	
	// FAQ 목록 조회 영역
	public List<FaqDTO> faqSearchList(Map<String, Object> map);
}
