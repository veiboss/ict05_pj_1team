package com.middlepj.ict05.domain.mypage.mypagedrug.controller;

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

import com.middlepj.ict05.domain.mypage.mypagedrug.service.MyPageDrugService;






@Controller
public class MyPageDrugController {
	
private static final Logger logger = LoggerFactory.getLogger(MyPageDrugController.class);	
	
	@Autowired
	private MyPageDrugService service;
	
	@RequestMapping("/myPageDrugList.do")
	public String myPageDrugList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> myPageDrugList.do >>>");
		
		service.myPageDrugList(request, response, model);
		
		return "myPage/myPageDrug/myPageDrugList";
	}
	
	@RequestMapping("/myPageDrugDelete.do")
	public String myPageDrugDelete(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> myPageDrugDelete.do >>>");
		
		service.myPageDrugDelete(request, response, model);
	
//		Object deleteCntObj = request.getSession().getAttribute("deleteCnt");
//	    if (deleteCntObj != null) {
//	        model.addAttribute("deleteCnt", deleteCntObj);
//	        request.getSession().removeAttribute("deleteCnt"); // 1회성으로만 사용
//	    }
	    
		return "myPage/myPageDrug/myPageDrugDelete";
	}
	
}
