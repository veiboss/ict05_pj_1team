package com.middlepj.ict05.domain.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("MemberDAOImpl - idPasswordChk()");

		int selectCnt = session.selectOne("com.middlepj.ict05.domain.member.dao.MemberDAO.idPasswordChk", map);

		return selectCnt;
	}
}