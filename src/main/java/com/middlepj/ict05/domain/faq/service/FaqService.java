package com.middlepj.ict05.domain.faq.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.middlepj.ict05.domain.faq.dto.FaqList;

public interface FaqService {

	// FAQ 회원 목록
	public FaqList faqUserListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// FAQ 목록
	public FaqList faqListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// FAQ 등록(노출/비노출)
	public void faqInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// FAQ 상세
	public void faqDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;

	// FAQ 수정(노출/비노출)
	public void faqUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
