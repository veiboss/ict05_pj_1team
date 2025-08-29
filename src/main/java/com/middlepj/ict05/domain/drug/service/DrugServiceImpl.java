package com.middlepj.ict05.domain.drug.service;

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

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.drug.dao.DrugDAO;
import com.middlepj.ict05.domain.drug.dto.DrugDTO;

@Service
public class DrugServiceImpl implements DrugService{

	@Autowired 
	private DrugDAO dao;

	// 영양제 검색
	@Override
	public void drugSearchAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugSearchAction() ===");
	
		/*
		 * String keyword = request.getParameter("keyword");
		 * 
		 * List<DrugSearchDTO> list = dao.drugSearch(keyword);
		 * 
		 * request.setAttribute("list", list);
		 */
		
	}

	// 영양제 목록
	@Override
	public void drugListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugListAction() ===");
		
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");  // 검색어
		
		int total = dao.drugCnt();
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		// 검색 조건 반영해서 총 개수 카운트
		Map<String, Object> map_search = new HashMap<>();
		String safeKeyword = (keyword == null) ? "" : keyword.trim();
		map_search.put("keyword", safeKeyword);
		
		
		List<DrugDTO> list = dao.drugList(map);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
	}

	// 영양제 추가 클릭 시 - 내 영양제에 추가
	@Override
	public void drugAddAction(DrugDTO drug) {
		System.out.println("=== drugService - drugInsertAction() ===");
		
		/*
		 * String mbId = (String)session.getAttribute("mb_id"); 
		 * member.setMb_id(mbId);
		 * 
		 * if(mbId == null) { 
		 * 		return "user/login/login"; 
		 * } 
		 * else { 
		 * 		int count = service.countDrug(mbId, drug.getDr_id()); 
		 * 		if(count == 0) {
		 * 			service.drugAddAction(drug); } else { // 있으면 alert창으로 } 
		 * 		}
		 * 
		 * return "";
		 */
	}
	
	// 영양제 확인
	@Override
	public int countDrug(String mbId, int drId) {

		return 0;
	}

	// 영양 상세 처리
	@Override
	public void drugDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugDetailAction() ===");
		
	}

	// 후기 목록
	@Override
	public void reviewListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - reviewListAction() ===");
		
	}

	// 후기 등록 처리 
	@Override
	public void reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - reviewAddAction() ===");
		
	}

}

