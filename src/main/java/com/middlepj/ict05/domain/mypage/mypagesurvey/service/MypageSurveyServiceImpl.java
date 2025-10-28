package com.middlepj.ict05.domain.mypage.mypagesurvey.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dto.MypageSurveyDTO;

@Service
public class MypageSurveyServiceImpl implements MypageSurveyService{
	
	@Autowired
	private MypageSurveyDAO dao;

	// 회원 설문 내용 등록
	@Override
	public void insertSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MypageSurveyServiceImpl-insertSurvey");
		// 입력 받은 값을 가져와서 DTO에 담는다.
		MypageSurveyDTO dto = new MypageSurveyDTO();
		dto.setMb_id((int)request.getSession().getAttribute("sessionID"));
		dto.setMbs_score(Integer.parseInt(request.getParameter("score")));
		dto.setMbs_writer_id((int)request.getSession().getAttribute("sessionID"));
		// DAO에 DTO 보낸다
		int insertCnt = dao.insertSurvey(dto);
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("dto", dto);
	}
	
	// 회원 설문 결과 페이지
	@Override
	public void resultScoreSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MypageSurveyServiceImpl-resultSurvey");
		int sessionID = (int)request.getSession().getAttribute("sessionID");
		System.out.println(sessionID);
		MypageSurveyDTO dto = dao.getScoreSurvey(sessionID);
		System.out.println(dto);
		model.addAttribute("dto", dto);
	}
	
	// 사용자 영양제 추천
	@Override
	public void recommendPill(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MypageSurveyServiceImpl-recommendPill");
		// 입력 받은 값을 가져온다
		int sessionID = (int)request.getSession().getAttribute("sessionID");
		int score = Integer.parseInt(request.getParameter("score"));
		int resultScore = 0;
		if(score <= 80 && score > 6) {
			resultScore = 3;
		}
		else if (score >= 4) {
			resultScore = 2;
		}
		else if (score < 4 && score >=0) {
			resultScore = 1;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("sessionID", sessionID);
		map.put("resultScore", resultScore);
		List<DrugDTO> list = dao.recommendPill(map);
		
		// jsp로 값 전달
		model.addAttribute("list", list);
	}

	// 회원 최근 설문 목록
	@Override
	public void listSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MypageSurveyServiceImpl-listSurvey");
		int sessionID = (int)request.getSession().getAttribute("sessionID");
		List<MypageSurveyDTO> list = dao.selectSurvey(sessionID);
		model.addAttribute("list", list);
	}
}
