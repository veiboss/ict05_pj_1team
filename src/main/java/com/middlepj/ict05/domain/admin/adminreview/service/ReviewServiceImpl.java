package com.middlepj.ict05.domain.admin.adminreview.service;

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

import com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO;
import com.middlepj.ict05.domain.admin.adminreview.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO dao;
	
	@Override
	public void reviewList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		// 페이징 연산 해줄거임
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");  // 검색어
		String sessionID = (String)request.getSession().getAttribute("sessionID");
		
		com.middlepj.ict05.common.Paging paging = new com.middlepj.ict05.common.Paging(pageNum);
	    // 검색 조건 반영해서 총 개수 카운트
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
	    int total = (keyword == null || keyword.trim().isEmpty())
	                ? dao.boardCnt()
	                : dao.boardSearchCnt(map);
	    paging.setTotalCount(total);
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
	    map.put("start", start);
	    map.put("end", end);
		
		// 세션 올라간거 관리자인지 체크, 관리자아니면 안띄워줌
		int userCnt = dao.userCheck(sessionID);
		
		// 목록띄워줌 리스트로 가져올거임
	    List<ReviewDTO> list = (keyword == null || keyword.trim().isEmpty())
                ? dao.reviewList(map)
                : dao.reviewSearchList(map);
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("userCnt", userCnt);
	    model.addAttribute("keyword", keyword); // 검색어 유지용
	}

}
