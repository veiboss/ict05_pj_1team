package com.middlepj.ict05.domain.home.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.home.dto.ProfileDTO;
@Repository
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	// 프로필 등록여부 체크
	
	public int checkProfile(int checkNo) {
		System.out.println("ProfileDAOImpl-checkProfile");
		int chkCnt = sqlsession.selectOne("com.middlepj.ict05.domain.home.dao.ProfileDAO.checkProfile", checkNo);
		return chkCnt;
	}
	
	// 프로필 등록
	@Override
	public int insertProfile(ProfileDTO dto) {
		System.out.println("ProfileDAOImpl-checkProfile");
		int Cnt = sqlsession.insert("com.middlepj.ict05.domain.home.dao.ProfileDAO.insertProfile", dto);
		return Cnt;
	}

	

	
	
}
