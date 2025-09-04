package com.middlepj.ict05.domain.mypage.mypagedrug.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.mypage.mypagedrug.dto.MyPageDrugDTO;

@Repository
public class MyPageDrugDAOImpl implements MyPageDrugDAO{

	@Autowired
	private SqlSession session;

	@Override
	public List<MyPageDrugDTO> myPageDrugList(int mb_id) {
		System.out.println("dao - myPageDrugList");
		
		List<MyPageDrugDTO> list = session.selectList("com.middlepj.ict05.domain.mypage.mypagedrug.dao.MyPageDrugDAO.myPageDrugList",mb_id);
		
		return list;
	}
	
	
	
}
