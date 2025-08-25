package com.middlepj.ict05.domain.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;	// ����
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;	// ����

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class userDAOImpl implements userDAO {

	@Autowired
	private SqlSession session;

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - idPasswordChk()");
		
		int selectCnt = session.selectOne("com.middlepj.ict05.domain.user.userDAO.idPasswordChk", map);
		
		return selectCnt;
	}
}