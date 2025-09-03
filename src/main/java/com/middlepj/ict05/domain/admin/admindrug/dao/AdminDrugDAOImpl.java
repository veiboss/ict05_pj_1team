package com.middlepj.ict05.domain.admin.admindrug.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugDetailDTO;
import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugListDTO;

@Repository
public class AdminDrugDAOImpl implements AdminDrugDAO{
	
	@Autowired
	private SqlSession sqlSession; 

	@Override
	public int boardCnt() {
		System.out.println("AdminDrugDAOImpl - boardCnt()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.boardCnt");
		
		return total;
	}

	@Override
	public int boardSearchCnt(Map<String, Object> map) {
		System.out.println("AdminDrugDAOImpl - boardCnt()");
		
		int total = sqlSession.selectOne("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.boardSearchCnt", map);
		
		return total;
	}

	@Override
	public List<AdminDrugListDTO> drugList(Map<String, Object> map) {
		System.out.println("AdminDrugDAOImpl - drugList()");
		
		List<AdminDrugListDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.drugList", map);
		
		return list;
	}

	@Override
	public List<AdminDrugListDTO> drugSearchList(Map<String, Object> map) {
		System.out.println("AdminDrugDAOImpl - drugSearchList()");
		
		List<AdminDrugListDTO> list = sqlSession.selectList("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.drugSearchList", map);
		
		return list;
	}

	@Override
	public int drugInsert(AdminDrugDetailDTO dto) {
		System.out.println("AdminDrugDAOImpl - drugInsert()");
		
		int insertCnt = sqlSession.insert("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.drugInsert", dto);
		
		return insertCnt;
	}

	@Override
	public AdminDrugDetailDTO drugSelectOne(int dr_id) {
		System.out.println("AdminDrugDAOImpl - drugDetail()");
		
		AdminDrugDetailDTO dto = sqlSession.selectOne("com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO.drugSelectOne", dr_id);
		
		return dto;
	}
	
}
