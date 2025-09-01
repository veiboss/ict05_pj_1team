package com.middlepj.ict05.domain.admin.adminreview.controller;

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

import com.middlepj.ict05.domain.admin.adminreview.service.ReviewService;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	/* 후기 리스트 이동 */
	@RequestMapping("/review.ad")
	public String review(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /review.ad >>>");

        try {
            // 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
            service.reviewList(request, response, model);
        } catch (Exception e) {
            // 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
            logger.error("Error while preparing review list page", e);
            throw new ServletException("후기 목록을 불러오는 중 오류가 발생했습니다.", e);
        }
        
		return "adminreview/reviewlist";
	}
	
    @RequestMapping(value = "/reviewAjax.ad", produces = "text/html; charset=UTF-8")
    public String reviewAjax(HttpServletRequest request, HttpServletResponse response, Model model)
            throws ServletException, IOException {
        logger.info("<<< url ==> /reviewAjax.ad >>>");

        try {
            // 같은 service.reviewList를 재사용 -> model에 list, paging, keyword 세팅됨
            service.reviewList(request, response, model);
        } catch (Exception e) {
            logger.error("Error while preparing review AJAX fragment", e);
            // AJAX 호출 시 클라이언트에서 에러 확인할 수 있게 상태코드 설정 (선택)
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            // 에러 처리를 위한 별도 JSP를 만들면 거기를 반환해도 됨
            // model.addAttribute("errorMessage", "후기 목록 로딩 실패");
            // return "adminreview/reviewlist_ajax_error";
        }

        // AJAX 전용 JSP (부분 HTML만 리턴하도록 구현)
        return "adminreview/reviewlistAjax";
    }
	
	// 후기 상세페이지 이동
	@RequestMapping("/review_detailAction.ad")
	public String review_detailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /review_detailAction.ad >>>");
	
		try {
            // 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
            service.review_detailAction(request, response, model);
        } catch (Exception e) {
            // 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
            logger.error("Error while preparing review_detailAction page", e);
            throw new ServletException("후기 상세를 불러오는 중 오류가 발생했습니다.", e);
        }
		return "adminreview/review_detailAction";
	}
	
	@RequestMapping("/review_modify.ad")
	public String review_modify(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==>  /review_modify.ad >>>");
	
		try {
            // 서비스에서 model을 채워서 JSP로 넘김 (기존 구조 유지)
			service.review_modifyAction(request, response, model);
        } catch (Exception e) {
            // 에러 로깅 후 예외 전파 (원래 동작을 유지하면서 문제 원인 로그 남김)
            logger.error("Error while preparing review_modify page", e);
            throw new ServletException("후기 수정 중 오류가 발생했습니다.", e);
        }
		return "adminreview/review_modify";
	}
}
