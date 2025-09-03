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
import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugDetailDTO;
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
		
		int currentPage = (pageNum == null || pageNum.equals("0")) ? 1 : Integer.parseInt(pageNum);
		Paging paging = new Paging(String.valueOf(currentPage));
		
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

	@Override
	public void drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("AdminDrugServiceImpl - drugAddAction");
		
		String dr_product = request.getParameter("dr_product");
		String dr_enterprise = request.getParameter("dr_enterprise");
		Long dr_statement_id = Long.parseLong(request.getParameter("dr_statement_id"));
		String dr_expiration_date = request.getParameter("dr_expiration_date");
		String dr_sungsang = request.getParameter("dr_sungsang");
		String dr_serve_use = request.getParameter("dr_serve_use");
		String dr_intake_hint = request.getParameter("dr_intake_hint");
		String dr_main_function = request.getParameter("dr_main_function");
		String dr_preservation = request.getParameter("dr_preservation");
		String dr_base_standard = request.getParameter("dr_base_standard");
		
		AdminDrugDetailDTO dto = new AdminDrugDetailDTO();
		
		int insertCnt = 0;
		
		dto.setDr_product(dr_product);
		dto.setDr_enterprise(dr_enterprise);
		dto.setDr_statement_id(dr_statement_id);
		dto.setDr_expiration_date(dr_expiration_date);
		dto.setDr_sungsang(dr_sungsang);
		dto.setDr_serve_use(dr_serve_use);
		dto.setDr_intake_hint(dr_intake_hint);
		dto.setDr_main_function(dr_main_function);
		dto.setDr_preservation(dr_preservation);
		dto.setDr_base_standard(dr_base_standard);
		try {
			insertCnt = dao.drugInsert(dto);
			
        } catch (Exception e) {
            logger.error("Failed to fetch review_modifyAction", e);
            throw new ServletException("등록 로직 실패", e);
        }
		
		model.addAttribute("insertCnt", insertCnt);
		
	}

	@Override
	public void drugDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("AdminDrugServiceImpl - drugDetail");
		int dr_id = Integer.parseInt(request.getParameter("dr_id"));
		AdminDrugDetailDTO dto;
		try {
			dto = dao.drugSelectOne(dr_id);
        } catch (Exception e) {
            logger.error("Failed to fetch review detail", e);
            throw new ServletException("영양제 상세 조회 실패", e);
        }
		
		model.addAttribute("dto", dto);
	}

	@Override
	public void drugModify(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("AdminDrugServiceImpl - drugModify");
		
		int dr_id = Integer.parseInt(request.getParameter("dr_id"));
		String dr_product = request.getParameter("dr_product");
		String dr_enterprise = request.getParameter("dr_enterprise");
		Long dr_statement_id = Long.parseLong(request.getParameter("dr_statement_id"));
		String dr_expiration_date = request.getParameter("dr_expiration_date");
		String dr_sungsang = request.getParameter("dr_sungsang");
		String dr_serve_use = request.getParameter("dr_serve_use");
		String dr_intake_hint = request.getParameter("dr_intake_hint");
		String dr_main_function = request.getParameter("dr_main_function");
		String dr_preservation = request.getParameter("dr_preservation");
		String dr_base_standard = request.getParameter("dr_base_standard");
		
		AdminDrugDetailDTO dto = new AdminDrugDetailDTO();
		
		int updateCnt = 0;
		
		dto.setDr_id(dr_id);
		dto.setDr_product(dr_product);
		dto.setDr_enterprise(dr_enterprise);
		dto.setDr_statement_id(dr_statement_id);
		dto.setDr_expiration_date(dr_expiration_date);
		dto.setDr_sungsang(dr_sungsang);
		dto.setDr_serve_use(dr_serve_use);
		dto.setDr_intake_hint(dr_intake_hint);
		dto.setDr_main_function(dr_main_function);
		dto.setDr_preservation(dr_preservation);
		dto.setDr_base_standard(dr_base_standard);
		try {
			updateCnt = dao.drugUpdate(dto);
			
        } catch (Exception e) {
            logger.error("Failed to fetch review_modifyAction", e);
            throw new ServletException("수정 로직 실패", e);
        }
		
		model.addAttribute("updateCnt", updateCnt);
	}

	@Override
	public void drugDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("AdminDrugServiceImpl - drugDelete");
		
	}

}
