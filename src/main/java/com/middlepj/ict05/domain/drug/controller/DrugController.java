package com.middlepj.ict05.domain.drug.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.middlepj.ict05.domain.drug.dto.DrugReviewDTO;
import com.middlepj.ict05.domain.drug.service.DrugServiceImpl;

@Controller
public class DrugController {
	
	private static final Logger logger = LoggerFactory.getLogger(DrugController.class);
	
	@Autowired
	private DrugServiceImpl service;
	
	// 영양제 검색
	@RequestMapping("/drugSearchAjax.do")
	public String drugSearchAjax(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drugSearchAjax.do");

		service.drugListAction(request, response, model);
		
		return "drug/drugListAjax";
	}
	
	// 영양제 목록
	@RequestMapping("/drug_list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_list.do >>>");
		
		service.drugListAction(request, response, model);
		
		return "drug/drug_list";
	}
	
	// 영양제 추가 클릭 시 - 내 영양제에 추가
	@RequestMapping(value = "/drug_addAction.do", method = RequestMethod.POST)
	@ResponseBody // JSON을 바로 반환
	public Map<String, String> drug_addAction(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException, ServletException {
		logger.info("<<< url ==> drug_addAction.do");
		
		Map<String, String> messageMap = service.drugAddAction(request, null, null);
	    
		return messageMap; // {"msg":"..."}
	}
	
	// 영양제 상세 처리 & 후기 목록
	@RequestMapping("/drug_detailAction.do")
	public String drug_detailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_detailAction.do");
		
		service.drugDetailAction(request, response, model);
		
		service.reviewListAction(request, response, model);
		
		return "drug/drug_detailAction";
	}
	
	// 후기 등록 화면
	@RequestMapping("/drug_reviewInsert.do")
	public String drug_reviewInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_reviewInsert.do");
	
		DrugReviewDTO dto = service.reviewInsertAction(request, response, model);
		model.addAttribute("dto", dto);
		
		return "drug/drug_reviewInsert";
	}
	
	// 후기 등록 처리
	@RequestMapping("/drug_reviewInsertAction.do")
	public String drug_reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_reviewInsertAction.do");
		
		DrugReviewDTO dto = service.reviewInsertAction(request, response, model);
		model.addAttribute("dto", dto);
		
		return "drug/drug_reviewInsertAction";		
	}
	
}
