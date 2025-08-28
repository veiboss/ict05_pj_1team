package com.middlepj.ict05.domain.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.middlepj.ict05.common.ApiResponse;

@RestController
@RequestMapping("/API")
public class QnaRestController {

	@PostMapping("/qna/write")
	public ResponseEntity<ApiResponse> writeAction(HttpServletRequest request, HttpServletResponse response, Model model) {
		String message = "";
		
		if(request.getParameter("qa_title") == null) {
			message = "제목을 입력해주세요";
		}
		
		if(request.getParameter("qa_content") == null) {
			message = "내용을 입력해주세요";
		}
		
		if(message != "") {
			return ResponseEntity
					.badRequest()
					.body(ApiResponse.error(message, 400));
		}
		
		return ResponseEntity.ok(ApiResponse.success(message, "Q&A 정상등록 되었습니다."));
	}
}
