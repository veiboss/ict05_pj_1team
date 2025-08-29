package com.middlepj.ict05.domain.admin.adminmember.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.admin.adminmember.dto.MemberAdminDTO;

public interface MemberAdminDAO {
	
	// 회원 목록
	public List<MemberAdminDTO> memberList(Map<String, Object> map);
	
	// 회원수
	public int memberCnt();
		
	// 회원 등록
	public int memberInsert(MemberAdminDTO dto);
	
	// 회원 상세
	public MemberAdminDTO memberDetail(int mbId);
	
	// 회원 수정
	public int memberUpdate(MemberAdminDTO dto);
	
	// 회원 삭제
	public int memberDelete(int mbId);
	
}
