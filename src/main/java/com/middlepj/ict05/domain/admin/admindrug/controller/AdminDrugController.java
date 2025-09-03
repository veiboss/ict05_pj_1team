package com.middlepj.ict05.domain.admin.admindrug.controller;

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

import com.middlepj.ict05.domain.admin.admindrug.service.AdminDrugService;

@Controller
public class AdminDrugController {

	@Autowired
	private AdminDrugService service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDrugController.class);
	
	/* 후기 리스트 이동 */
	@RequestMapping("/drug.ad")
	public String drug(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /drug.ad >>>");

		String grade = (String)request.getSession().getAttribute("sessionGrade");
		if("ADMIN".equals(grade)) {
			// 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
			try {
				service.drugList(request, response, model);
			} catch (Exception e) {
				// 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
				logger.error("Error while preparing review list page", e);
				throw new ServletException("영양제 목록을 불러오는 중 오류가 발생했습니다.", e);
			}
			
			return "admindrug/drugList";
		}
		else {
			request.getSession().invalidate();
			return "admin_login/login";
		}
	}
	
    @RequestMapping(value = "/adminDrugAjax.ad", produces = "text/html; charset=UTF-8")
    public String reviewAjax(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url ==> /adminDrugAjax.ad >>>");

        try {
            // 같은 service.reviewList를 재사용 -> model에 list, paging, keyword 세팅됨
            service.drugList(request, response, model);
        } catch (Exception e) {
            logger.error("Error while preparing adminDrugAjax fragment", e);
            // AJAX 호출 시 클라이언트에서 에러 확인할 수 있게 상태코드 설정 (선택)
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // 에러 처리를 위한 별도 JSP를 만들면 거기를 반환해도 됨
        }

        // AJAX 전용 JSP (부분 HTML만 리턴하도록 구현)
        return "admindrug/druglistAjax";
    
    }
    
    
    @RequestMapping("/drugAdd.ad")
    public String drugAdd(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	logger.info("<<< url ==> /drugAdd.ad >>>");
    	return "admindrug/drugAdd";
    }
    
    @RequestMapping("/drugAddAction.ad")
    public String drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	logger.info("<<< url ==> /drug_modify.ad >>>");
    	
    	service.drugAddAction(request, response, model);
    	
    	return "admindrug/drugAddAction";
    }
  
    @RequestMapping("/drugDetail.ad")
    public String drugDetail(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	logger.info("<<< url ==> /drugDetail.ad >>>");
    	
    	service.drugDetail(request, response, model);
    	
    	return "admindrug/drugDetail";
    }
    
    @RequestMapping("/drugModify.ad")
    public String drugModify(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	logger.info("<<< url ==> /drugModify.ad >>>");
    	
    	
    	
    	return "admindrug/drugModify";
    }
    
    @RequestMapping("/drugDelete.ad")
    public String drugDelete(HttpServletRequest request, HttpServletResponse response, Model model)
    		throws ServletException, IOException {
    	logger.info("<<< url ==> /drugDelete.ad >>>");
    	
    	
    	
    	return "admindrug/drugDelete";
    }
    
    
}
