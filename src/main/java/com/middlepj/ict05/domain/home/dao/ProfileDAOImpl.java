package com.middlepj.ict05.domain.home.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.home.dto.ProfileDTO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dto.MypageSurveyDTO;
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

	// 회원 설문 내용 등록
	@Override
	public int insertSurvey(MypageSurveyDTO dto) {
		System.out.println("ProfileDAOImpl-insertSurvey");
		int Cnt = sqlsession.insert("com.middlepj.ict05.domain.home.dao.ProfileDAO.insertSurvey", dto);
		return Cnt;
	}
	
	// 사용자 영양제 추천
	@Override
	public List<DrugDTO> recommendPill(Map<String, Object> map) {
		System.out.println("ProfileDAOImpl-recommendPill");
		List<DrugDTO> list = new ArrayList<>();
		list = sqlsession.selectList("com.middlepj.ict05.domain.home.dao.ProfileDAO.recommendPill", map);
		return list;
	}

	// 설문 결과 표시
	@Override
	public MypageSurveyDTO getScoreSurvey(int sessionID) {
		System.out.println("ProfileDAOImpl-getScoreSurvey");
		MypageSurveyDTO dto = new MypageSurveyDTO();
		dto = sqlsession.selectOne("com.middlepj.ict05.domain.home.dao.ProfileDAO.getScoreSurvey", sessionID);
		return dto;
	}
	
	// 회원 최근 설문 목록
	@Override
	public List<MypageSurveyDTO> selectSurvey(int sessionID) {
		System.out.println("ProfileDAOImpl-selectSurvey");
		List<MypageSurveyDTO> list = sqlsession.selectList("com.middlepj.ict05.domain.home.dao.ProfileDAO.selectSurvey", sessionID);
		return list;
	}

	
	
}
