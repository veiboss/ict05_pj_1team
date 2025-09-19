package com.middlepj.ict05.domain.member.service;

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

import com.middlepj.ict05.domain.member.dao.MemberDAO;
import com.middlepj.ict05.domain.member.dto.MemberDTO;
import com.middlepj.ict05.domain.mypage.mypagedrug.dao.MyPageDrugDAO;
import com.middlepj.ict05.domain.mypage.mypagesurvey.dao.MypageSurveyDAO;
import com.middlepj.ict05.domain.mypage.myprofile.dto.MyProfileDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private MypageSurveyDAO surveyDAO;
	
	@Autowired
	private MyPageDrugDAO drugDAO;
	
	// 최근 설문 목록 10명
	public void recentSurveyList(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	    System.out.println("MemberServiceImpl - recentSurveyList()");
	    List<Map<String, Object>> surveyList = surveyDAO.surveyList();
	    model.addAttribute("surveyList", surveyList);
	}
	
	// 메인 인기영양제 5개	
	public void top5Drugs(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	    System.out.println("MemberServiceImpl - top5Drugs()");
	    List<Map<String, Object>> top5list = drugDAO.selectTop5Drugs();
	    model.addAttribute("top5list", top5list);
	}

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public void loginAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MemberServiceImpl - loginAction()");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mb_email", request.getParameter("mb_email"));
		map.put("mb_password", request.getParameter("mb_password"));
		
		int selectCnt = dao.idPasswordChk(map);
		
		// 로그인 성공시 세션ID를 설정(중요)
		if(selectCnt == 1) {
			request.getSession().setAttribute("sessionEmail", request.getParameter("mb_email"));
			MemberDTO dto = dao.memberSelect(map);
			request.getSession().setAttribute("sessionID", dto.getMb_id());
			request.getSession().setAttribute("sessionName", dto.getMb_name());
			request.getSession().setAttribute("sessionGrade", dto.getMb_grade());
		}
		// 로그인 성공 후 다시 로그인 했을 때, 비번이 맞지 않아도 로그인 성공으로 처리되어 추가
		else {
			request.getSession().invalidate();
		}
	}
	
	// 회원가입_아이디 중복확인
	@Override
	public void emailCheckAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MemberServiceImpl - idConfirmAction");

		// 화면에서 입력받은 이메일 가져오기
		String strEmail = request.getParameter("mb_email");
		
		// id 중복확인 처리
		int selectCnt = dao.emailCheck(strEmail);

		// jsp로 처리결과 전달
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("strEmail", strEmail);
	}

	// 회원가입처리
	@Override
	public void signUpAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MemberServiceImpl - signUpAction");

		// DTO 생성 -> setter
		MemberDTO dto = new MemberDTO();
		dto.setMb_email(request.getParameter("mb_email"));
		dto.setMb_password(request.getParameter("mb_password"));
		dto.setMb_name(request.getParameter("mb_name"));
		
		// 회원가입 처리
		int insertCnt = dao.insertMember(dto);
		
		// jsp로 처리결과 전달
		model.addAttribute("insertCnt", insertCnt);
	}
	
	// 마이페이지 정보 제공
	@Override
	public void myProfileDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("service-myProfileUpdate");
		
		int md_id = (int) request.getSession().getAttribute("sessionID");
		
		MyProfileDTO dto = dao.myProfileDetail(md_id);
		System.out.println("찍");
		System.out.println("dto =>"+dto);
		model.addAttribute("dto",dto);
	}

}