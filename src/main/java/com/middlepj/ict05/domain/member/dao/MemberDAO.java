package com.middlepj.ict05.domain.member.dao;

import java.util.Map;

import com.middlepj.ict05.domain.member.dto.MemberDTO;

public interface MemberDAO {

	public int idPasswordChk(Map<String, Object> map);

	// ID 중복확인 처리
	public int emailCheck(String strEmail);

	// 회원가입 처리
	public int insertMember(MemberDTO dto);
	
	// 회원정보 가져옴
	public MemberDTO memberSelect(Map<String, Object> map);

}
