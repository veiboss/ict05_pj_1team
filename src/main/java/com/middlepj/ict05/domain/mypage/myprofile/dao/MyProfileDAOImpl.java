package com.middlepj.ict05.domain.mypage.myprofile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyProfileDAOImpl {
	
	@Autowired
	private SqlSession session;
	
}
