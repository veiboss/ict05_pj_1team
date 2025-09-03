package com.middlepj.ict05.domain.mypage.myprofile.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.myprofile.dto.MyProfileDTO;

@Repository
public class MyProfileDAOImpl implements MyProfileDAO{

	@Autowired
	private SqlSession session;

	@Override
	public MyProfileDTO myProfileDetail(int md_id) {
		System.out.println("dao-myProfileDetail");
		
		MyProfileDTO dto = session.selectOne("com.middlepj.ict05.domain.mypage.myprofile.dao.MyProfileDAO.myProfileDetail",md_id);
		return dto;
	}
	
	@Override
	public int myProfileUpdate(MyProfileDTO dto) {
		System.out.println("dao-myProfileUpdate");
		
		int updateCnt = session.update("com.middlepj.ict05.domain.mypage.myprofile.dao.MyProfileDAO.myProfileUpdate",dto);
		return updateCnt;
	}

	

	@Override
	public int myProfileDelete(int id) {
		System.out.println("dao-myProfileDelete");
		
		int deleteCnt = session.delete("com.middlepj.ict05.domain.mypage.myprofile.dao.MyProfileDAO.myProfileDelete",id);
		return deleteCnt;
	}
}
