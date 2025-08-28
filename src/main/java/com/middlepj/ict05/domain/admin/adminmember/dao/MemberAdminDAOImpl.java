package com.middlepj.ict05.domain.admin.adminmember.dao;

import java.util.List;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.admin.adminmember.dto.MemberAdminDTO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO{
	
	// 커넥션 풀 객체를 보관 
	DataSource dataSource = null;
	
	@Autowired
	private SqlSession sqlSession;	// DB커넥션과 맵퍼
	
	// 회원 목록
	@Override
	public List<MemberAdminDTO> memberList(Map<String, Object> map) {
		System.out.println("MemberDAOImpl - memberList()");
		
		List<MemberAdminDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.adminmember.dao.MemberAdminDAO.memberList", map);
		
		return list;
	}
	
	// 회원수
	@Override
	public int memberCnt() {
		System.out.println("MemberDAOImpl - memberCnt()");
		
		int selectCnt = sqlSession.selectOne("com.middlepj.ict05.domain.admin.adminmember.dao.MemberAdminDAO.memberCnt");
		
		return selectCnt;
	}
	// 회원 등록
	@Override
	public int memberInsert(MemberAdminDTO dto) {
		System.out.println("MemberDAOImpl - memberInsert()");
		return 0;
	}
	
	// 회원 상세
	@Override
	public MemberAdminDTO memberDetail(int mbId) {
		System.out.println("MemberDAOImpl - memberDetail()");
		return null;
	}

	// 회원 수정
	@Override
	public int memberUpdate(MemberAdminDTO dto) {
		System.out.println("MemberDAOImpl - memberUpdate()");
		return 0;
	}

	// 회원 삭제
	@Override
	public int memberDelete(int mbId) {
		System.out.println("MemberDAOImpl - memberDelete()");
		return 0;
	}

}
