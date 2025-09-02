package com.middlepj.ict05.domain.mypage.mypagesurvey.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dto.MypageSurveyDTO;

@Repository
public class MypageSurveyDAOImpl implements MypageSurveyDAO{
	
	@Autowired
	SqlSession sqlsession;
	
	// 회원 설문 내용 등록
	@Override
	public int insertSurvey(MypageSurveyDTO dto) {
		System.out.println("MypageSurveyDAOImpl-insertSurvey");
		int Cnt = sqlsession.insert("com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO.insertSurvey", dto);
		return Cnt;
	}
	
	// 사용자 영양제 추천
	@Override
	public List<DrugDTO> recommendPill(Map<String, Object> map) {
		System.out.println("MypageSurveyDAOImpl-recommendPill");
		List<DrugDTO> list = new ArrayList<>();
		list = sqlsession.selectList("com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO.recommendPill", map);
		return list;
	}

	// 설문 결과 표시
	@Override
	public MypageSurveyDTO getScoreSurvey(int sessionID) {
		System.out.println("MypageSurveyDAOImpl-getScoreSurvey");
		MypageSurveyDTO dto = new MypageSurveyDTO();
		dto = sqlsession.selectOne("com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO.getScoreSurvey", sessionID);
		return dto;
	}
	
	// 회원 최근 설문 목록
	@Override
	public List<MypageSurveyDTO> selectSurvey(int sessionID) {
		System.out.println("MypageSurveyDAOImpl-selectSurvey");
		List<MypageSurveyDTO> list = sqlsession.selectList("com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO.selectSurvey", sessionID);
		return list;
	}
}
