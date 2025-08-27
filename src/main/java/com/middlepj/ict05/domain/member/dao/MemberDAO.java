package com.middlepj.ict05.domain.member.dao;

import java.util.Map;

import com.middlepj.ict05.domain.member.dto.MemberDTO;

public interface MemberDAO {

	public int idPasswordChk(Map<String, Object> map);

	// ID 중복확인 처리
	int emailCheck(String strEmail);

	// 회원가입 처리
	int insertMember(MemberDTO dto);

}
