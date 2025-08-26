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
import com.middlepj.ict05.domain.member.controller.MemberController;

@Controller
public class DrugController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private DrugServiceImpl service;

	// 영양제 검색


	// 영양제 목록
	@RequestMapping("/drug_list.do")
	public String board_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /drug_list.do");

		return "drug/drug_list";
	}

	// 영양제 추가 클릭 시 - 내 영양제에 추가


	// 영양 상세 처리


	// 후기 목록


	// 후기 등록 처리

}
