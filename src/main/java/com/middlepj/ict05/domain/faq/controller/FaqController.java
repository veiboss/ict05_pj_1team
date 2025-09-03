package com.middlepj.ict05.domain.faq.controller;

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

import com.middlepj.ict05.HomeController;
import com.middlepj.ict05.domain.faq.dto.FaqList;
import com.middlepj.ict05.domain.faq.service.FaqServiceImpl;

@Controller
public class FaqController {

	@Autowired
	private FaqServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// FAQ 회원 목록
	@RequestMapping("/faq_user_list.fc")
	public String faq_user_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_user_list.fc >>>");

   // service.faqUserListAction(request, response, model);
		
		FaqList faqList = service.faqUserListAction(request, response, model);
		
		model.addAttribute("list", faqList.getFaqUserList());
		model.addAttribute("paging", faqList.getPaging());

		return "faq/faq_user_list";
	}
	
	// FAQ 관리자 목록
	@RequestMapping("/faq_admin_list.fc")
	public String faq_admin_list(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_admin_list.fc >>>");
		
		FaqList faqList = service.faqListAction(request, response, model);
		
		model.addAttribute("list", faqList.getFaqList());
		model.addAttribute("paging", faqList.getPaging());
		
		return "faq/faq_admin_list";
	}
	
	// FAQ 등록 페이지(노출/비노출)
	@RequestMapping("/faq_insert.fc")
	public String faq_insert(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_insert.fc >>>");
		
		return "faq/faq_insert";
	}
	
	// FAQ 등록 처리
	@RequestMapping("/faq_insertAction.fc")
	public String faq_insertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_insertAction.fc >>>");
		
		service.faqInsertAction(request, response, model);

		return "faq/faq_insertAction";
	}
	
	// FAQ 수정 처리
	@RequestMapping("/faq_update.fc")
	public String faq_update(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_update.fc >>>");
		
		try {
            // 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
			service.faqUpdateAction(request, response, model);
        } catch (Exception e) {
            // 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
            logger.error("Error while preparing faq_update page", e);
            throw new ServletException("FAQ 수정 중 오류가 발생했습니다.", e);
        }
		return "faq/faq_update";
	}
		
	
	// FAQ 상세페이지 이동
	@RequestMapping("/faq_detail.fc")
	public String faq_detail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_detail.fc >>>");
		
		try {
			// 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
			service.faqDetailAction(request, response, model);
		} catch (Exception e) {
			// 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
			logger.error("Error while preparing review_detailAction page", e);
			throw new ServletException("FAQ 상세를 불러오는 중 오류가 발생했습니다.", e);
		}
		return "faq/faq_detailAction";
	}
	
	// FAQ ADMIN Ajax
	@RequestMapping("/faq_admin_ajax.fc")
	public String faq_admin_ajax(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /faq_admin_list.fc >>>");
		
		FaqList faqList = service.faqListAction(request, response, model);
		
		model.addAttribute("list", faqList.getFaqList());
		model.addAttribute("paging", faqList.getPaging());
		
		return "faq/faq_admin_ajax";
	}
	
}