package com.middlepj.ict05.domain.drug.service;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.drug.dao.DrugDAO;
import com.middlepj.ict05.domain.drug.dto.DrugDTO;
import com.middlepj.ict05.domain.drug.dto.DrugReviewDTO;

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
		
		int currentPage = (pageNum == null || pageNum.equals("0")) ? 1 : Integer.parseInt(pageNum);
	    
		Paging paging = new Paging(String.valueOf(currentPage));
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
	public Map<String, String> drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
				throws ServletException, IOException {
	    Map<String, String> messageMap = new HashMap<>();

	    // 1. 세션 체크
	    HttpSession session = request.getSession(false); // 세션 없으면 null
	    if (session == null || session.getAttribute("sessionID") == null) {
	        messageMap.put("msg", "로그인이 필요합니다.");
	        return messageMap;
	    }
	    int mb_id = (int) session.getAttribute("sessionID");

	    // 2. dr_id 가져오기 & 유효성 체크
	    String drIdStr = request.getParameter("dr_id");
	    int dr_id = 0;
	    try {
	        dr_id = Integer.parseInt(drIdStr);
	    } catch (NumberFormatException e) {
	        messageMap.put("msg", "잘못된 영양제 ID입니다.");
	        return messageMap;
	    }

	    // 3. 기존 등록 여부 체크
	    Map<String, Object> map = new HashMap<>();
	    map.put("dr_id", dr_id);
	    map.put("mb_id", mb_id);
	    int chkCnt = dao.existCnt(map);
	    if (chkCnt > 0) {
	        messageMap.put("msg", "이미 등록된 영양제입니다.");
	        return messageMap;
	    }

	    // 4. 영양제 정보 조회
	    DrugDTO dto = dao.getDrugById(dr_id);
	    if (dto == null) {
	        messageMap.put("msg", "영양제 정보를 찾을 수 없습니다.");
	        return messageMap;
	    }

	    // 5. DB 등록
	    Map<String, Object> insertMap = new HashMap<>();
	    insertMap.put("mb_id", mb_id);
	    insertMap.put("dr_id", dr_id);
	    insertMap.put("mbd_drug_name", dto.getDr_product());
	    insertMap.put("mbd_drug_effect", dto.getDr_main_function());
	    insertMap.put("mbd_write_id", mb_id);

	    int result = dao.addDrug(insertMap);
	    messageMap.put("msg", result > 0 ? "마이페이지에 약이 추가되었습니다."
	                                     : "약 추가에 실패했습니다. 다시 시도해주세요.");

	    return messageMap;
	}

	// 영양제 상세 처리
	@Override
	public void drugDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - drugDetailAction() ===");
		
		String drIdStr = request.getParameter("dr_id");

		if (drIdStr == null || drIdStr.isEmpty()) {
		    throw new IllegalArgumentException("dr_id 파라미터가 없습니다.");
		}

		int dr_id = Integer.parseInt(drIdStr);
		
		DrugDTO dto = dao.getDrugDetail(dr_id);
		
		model.addAttribute("dto", dto);
	}

	// 후기 목록
	@Override
	public void reviewListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - reviewListAction() ===");
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = (pageNum == null || pageNum.equals("0")) ? 1 : Integer.parseInt(pageNum);
	    
		Paging paging = new Paging(String.valueOf(currentPage));
		int total = dao.reviewCnt();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<DrugReviewDTO> list = dao.drugReviewList(map);
		System.out.println("list :" + list);
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}

	// 후기 등록 처리 
	@Override
	public void reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("=== drugService - reviewAddAction() ===");
		
	}

}

