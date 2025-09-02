package com.middlepj.ict05.domain.admin.admindrug.service;

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

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.admin.admindrug.dao.AdminDrugDAO;
import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugListDTO;

@Service
public class AdminDrugServiceImpl implements AdminDrugService{

	@Autowired
	private AdminDrugDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDrugServiceImpl.class);
	
	@Override
	public void drugList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("AdminDrugServiceImpl - drugList");
		
		// 페이징 연산 해줄거임
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");  // 검색어
		
		Paging paging = new Paging(pageNum);
		
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
	            logger.error("Failed to get total drug count", e);
	            throw new ServletException("영양제 개수 조회 실패", e);
	        }
			
	        // 페이징에 총개수 세팅 (중복 제거)
			paging.setTotalCount(total);
			
			// start/end 계산해 map에 추가
			int start = paging.getStartRow();
			int end = paging.getEndRow();
		    map.put("start", start);
		    map.put("end", end);
			
			
			// 목록띄워줌 리스트로 가져올거임
		    List<AdminDrugListDTO> list;
	        try {
	            if (safeKeyword.isEmpty()) {
	            	list = dao.drugList(map);
	            } else {
	            	list = dao.drugSearchList(map);
	            }
	        } catch (Exception e) {
	            logger.error("Failed to fetch drug list", e);
	            throw new ServletException("영양제 목록 조회 실패", e);
	        }
			
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			// model.addAttribute("userCnt", userCnt);
		    model.addAttribute("keyword", keyword); // 검색어 유지용
	}

}
