package com.middlepj.ict05.domain.admin.adminreview.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.domain.admin.adminreview.dao.ReviewDAO;
import com.middlepj.ict05.domain.admin.adminreview.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	@Override
	public void reviewList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		// 페이징 연산 해줄거임
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");  // 검색어
		// String sessionID = (String)request.getSession().getAttribute("sessionID");
		
		com.middlepj.ict05.common.Paging paging = new com.middlepj.ict05.common.Paging(pageNum);
	   
		// 검색 조건 반영해서 총 개수 카운트
		Map<String, Object> map = new HashMap<>();
		String safeKeyword = (keyword == null) ? "" : keyword.trim();
		map.put("keyword", safeKeyword);
		
		// 총 카운트 가져오기 (검색 유무에 따라 분기)
		int total;
        try {
            if (safeKeyword.isEmpty()) {
                total = dao.boardCnt();
            } else {
                total = dao.boardSearchCnt(map);
            }
        } catch (Exception e) {
            logger.error("Failed to get total review count", e);
            throw new ServletException("후기 개수 조회 실패", e);
        }
		
        // 페이징에 총개수 세팅 (중복 제거)
		paging.setTotalCount(total);
		
		// start/end 계산해 map에 추가
		int start = paging.getStartRow();
		int end = paging.getEndRow();
	    map.put("start", start);
	    map.put("end", end);
		
		// 세션 올라간거 관리자인지 체크, 관리자아니면 안띄워줌
	    
		// int userCnt = dao.userCheck(sessionID);
		
		// 목록띄워줌 리스트로 가져올거임
	    List<ReviewDTO> list;
        try {
            if (safeKeyword.isEmpty()) {
                list = dao.reviewList(map);
            } else {
                list = dao.reviewSearchList(map);
            }
        } catch (Exception e) {
            logger.error("Failed to fetch review list", e);
            throw new ServletException("후기 목록 조회 실패", e);
        }
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		// model.addAttribute("userCnt", userCnt);
	    model.addAttribute("keyword", keyword); // 검색어 유지용
	}

}
