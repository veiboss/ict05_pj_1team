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

	// 영양제 목록
	@Override
	public void drugListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugListAction() ===");
		
		String pageNum = request.getParameter("pageNum");
		String keyword = request.getParameter("keyword");  // 검색어
		
		Map<String, Object> map = new HashMap<String, Object>();
		String safeKeyword = (keyword == null) ? "" : keyword.trim();
		map.put("keyword", safeKeyword);
		
		int total;
		if (safeKeyword.isEmpty()) {
            total = dao.drugCnt();
        } else {
            total = dao.drugSearchCnt(map);
        }
		System.out.println("total : " + total);
		
		Paging paging = new Paging(pageNum);
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		map.put("start", start);
		map.put("end", end);
		
		List<DrugDTO> list;
		if (safeKeyword.isEmpty()) {
            list = dao.drugList(map);
        } else {
            list = dao.drugSearchList(map);
        }
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("total", total);
	}

	// 영양제 추가 클릭 시 - 내 영양제에 추가
	@Override
	public void drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugInsertAction() ===");
		
		//Map<String, Object> map = new HashMap<String, Object>();
	}
	
	// 내 영양제 확인
	@Override
	public int countMyDrug(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {

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

