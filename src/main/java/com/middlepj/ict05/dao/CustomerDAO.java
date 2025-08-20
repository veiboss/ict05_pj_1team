package com.middlepj.ict05.dao;

import java.util.Map;

import com.middlepj.ict05.dto.CustomerDTO;


public interface CustomerDAO {
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(Map<String, Object> map);
}
