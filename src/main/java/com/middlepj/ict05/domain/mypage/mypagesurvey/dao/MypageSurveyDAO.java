package com.middlepj.ict05.domain.mypage.mypagesurvey.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dto.MypageSurveyDTO;

public interface MypageSurveyDAO {
	
	// 회원 설문 내용 등록
	public int insertSurvey(MypageSurveyDTO dto);
	
	// 설문 결과 표시
	public MypageSurveyDTO getScoreSurvey(int sessionID);
	
	// 사용자 영양제 추천
	public List<DrugDTO> recommendPill(Map<String, Object> map);
	
	// 회원 최근 설문 목록
	public List<MypageSurveyDTO> selectSurvey(int sessionID);
	
	// 메인페이지 설문 점수 10개
	public List<Map<String, Object>> surveyList();
	
}
