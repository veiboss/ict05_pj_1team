package com.middlepj.ict05.domain.home.service;

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
import com.middlepj.ict05.domain.home.dao.ProfileDAO;
import com.middlepj.ict05.domain.home.dto.ProfileDTO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dto.MypageSurveyDTO;

@Service
public class ProfileServiceImpl implements ProfileService{
	
	@Autowired
	private ProfileDAO dao;
	
	// 프로필 등록 페이지
	@Override
	public void insertProfile(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProfileServiceImpl-insertProfile");
		int checkNo = ((int)request.getSession().getAttribute("sessionID"));
		int checkCnt = dao.checkProfile(checkNo);
		model.addAttribute("checkCnt", checkCnt);
	}
	
	// 프로필 등록 
	@Override
	public void insertProfileAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProfileServiceImpl-insertProfileAction");
		// 입력 받은 값을 가져와서 DTO에 담는다.
		ProfileDTO dto = new ProfileDTO();
		dto.setMbp_gender(request.getParameter("gender"));
		dto.setMbp_age(Integer.parseInt(request.getParameter("age")));
		dto.setMbp_height(Integer.parseInt(request.getParameter("height")));
		dto.setMbp_weight(Integer.parseInt(request.getParameter("weight")));
		dto.setMbp_int_pill(request.getParameter("interests"));
		dto.setMbp_pill_score(Integer.parseInt(request.getParameter("totalScore")));
		dto.setMbp_disease(request.getParameter("diseases"));
		dto.setMb_id((int)request.getSession().getAttribute("sessionID"));
		dto.setMbp_writer_id((int)request.getSession().getAttribute("sessionID"));
		// DAO에 DTO 보낸다
		int insertCnt = dao.insertProfile(dto);
		model.addAttribute("insertCnt", insertCnt);
	}

	// 회원 설문 내용 등록
	@Override
	public void insertSurvey(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("ProfileServiceImpl-insertSurvey");
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
		System.out.println("ProfileServiceImpl-resultSurvey");
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
		System.out.println("ProfileServiceImpl-recommendPill");
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
		System.out.println("ProfileServiceImpl-listSurvey");
		int sessionID = (int)request.getSession().getAttribute("sessionID");
		List<MypageSurveyDTO> list = dao.selectSurvey(sessionID);
		model.addAttribute("list", list);
	}
	
	// 회원 최근 설문 목록 상세
	

	
}
