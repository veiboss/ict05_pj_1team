package com.middlepj.ict05.domain.drug.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.middlepj.ict05.domain.drug.service.DrugServiceImpl;

@Controller
public class DrugController {
	
	private static final Logger logger = LoggerFactory.getLogger(DrugController.class);
	
	@Autowired
	private DrugServiceImpl service;
	
	// 영양제 검색
	@RequestMapping("/drug_search.do")
	public String drug_search(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_search.do");

		return "drug/drug_search";
	}
	@RequestMapping("/drug_search_next.do")
	public String drug_search_next(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_search_next.do");
		
		service.drugSearchAction(request, response, model);
		
		return "drug/drug_search_next";
		
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
	@RequestMapping("/drug_addAction.do")
	public String drug_addAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> drug_addAction.do >>>");
		
		return "";
		
	}
	
	// 영양제 상세 처리
	@RequestMapping("/drug_detailAction.do")
	public String drug_detailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		service.drugDetailAction(request, response, model);
		
		return "drug/drug_detailAction";
	}
	
	// 후기 목록 
	@RequestMapping("/drug_reviewList.do")
	public String drug_reviewList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		service.reviewListAction(request, response, model);
		
		return "drug/drug_reviewList";
	}
	
	// 후기 등록 화면
	@RequestMapping("/drug_reviewInsert.do")
	public String drug_reviewInsert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		return "drug/drug_reviewInsert";
	}
	
	// 후기 등록 처리
	@RequestMapping("/drug_reviewInsertAction.do")
	public String drug_reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		service.reviewInsertAction(request, response, model);
		
		String viewPage = request.getContextPath() + "/drug_reviewList.do";
		response.sendRedirect(viewPage);
		return null;
	}
}
