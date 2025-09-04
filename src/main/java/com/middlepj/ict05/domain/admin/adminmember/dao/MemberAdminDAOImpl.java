package com.middlepj.ict05.domain.admin.adminmember.dao;

import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.admin.adminmember.dto.MemberAdminDTO;
import com.middlepj.ict05.domain.admin.adminmember.dto.MemberSearchDTO;

@Repository
public class MemberAdminDAOImpl implements MemberAdminDAO {

	// 커넥션 풀 객체를 보관
	DataSource dataSource = null;

	@Autowired
	private SqlSession sqlSession; // DB커넥션과 맵퍼

	// 회원 목록
	@Override
	public List<MemberAdminDTO> memberList(MemberSearchDTO searchDTO) {
		System.out.println("MemberDAOImpl - memberList()");

		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		List<MemberAdminDTO> list = dao.memberList(searchDTO);

		return list;
	}

	// 회원수
	@Override
	public int memberCnt(MemberSearchDTO searchDto) {
		System.out.println("MemberDAOImpl - memberCnt()");

		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		int selectCnt = dao.memberCnt(searchDto);

		return selectCnt;
	}

	// 회원 등록
	@Override
	public int memberInsert(MemberAdminDTO dto) {
		System.out.println("MemberDAOImpl - memberInsert()");
		
		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		int insertCnt = dao.memberInsert(dto);
		
		return insertCnt;
	}

	// 회원 상세
	@Override
	public MemberAdminDTO memberDetail(int mbId) {
		System.out.println("MemberDAOImpl - memberDetail()");

		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		MemberAdminDTO dto = dao.memberDetail(mbId);

		return dto;
	}

	// 회원 수정
	@Override
	public int memberUpdate(MemberAdminDTO dto) {
		System.out.println("MemberDAOImpl - memberUpdate()");
		
		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		int updateCnt = dao.memberUpdate(dto);
		
		return updateCnt;
	}

	// 회원 삭제
	@Override
	public int memberDelete(int mbId) {
		System.out.println("MemberDAOImpl - memberDelete()");

		MemberAdminDAO dao = sqlSession.getMapper(MemberAdminDAO.class);
		int deleteCnt = dao.memberDelete(mbId);

		return deleteCnt;
	}

}
