package com.middlepj.ict05.domain.qna.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.middlepj.ict05.common.ApiResponse;
import com.middlepj.ict05.domain.qna.dto.QnaDto;
import com.middlepj.ict05.domain.qna.dto.QnaForm;
import com.middlepj.ict05.domain.qna.service.QnaService;

@RestController
@RequestMapping("/API")
public class QnaRestController {
	
	@Autowired
	private QnaService qnaService;

	@PostMapping("/qna/write")
	public ResponseEntity<ApiResponse<QnaDto>> writeAction(QnaForm form) {
		List<String> errors = new ArrayList<>();
		
		if (form.getQa_title() == null || form.getQa_title().isEmpty()) {
			errors.add("제목을 입력해주세요");
		}
		
		if (form.getQa_content() == null || form.getQa_content().isEmpty()) {
			errors.add("내용을 입력해주세요");
		}

		QnaDto dto = new QnaDto();

		
		if(errors.size() > 0) {
			String message = String.join(", ", errors);
			return ResponseEntity
					.badRequest()
					.body(ApiResponse.error(message, 400));
		}
		
		int insertCnt = qnaService.insertQna(form);
		
		
		return ResponseEntity.ok(ApiResponse.success(dto, "Q&A 정상등록 되었습니다."));
	}
	
	@PostMapping("/qna/modify")
	public ResponseEntity<ApiResponse<QnaDto>> modifyAction(QnaForm form, HttpServletRequest request) {
		List<String> errors = new ArrayList<>();
		
		if (form.getQa_title() == null || form.getQa_title().isEmpty()) {
			errors.add("제목을 입력해주세요");
		}
		
		if (form.getQa_content() == null || form.getQa_content().isEmpty()) {
			errors.add("내용을 입력해주세요");
		}

		QnaDto dto = new QnaDto();

		
		if(errors.size() > 0) {
			String message = String.join(", ", errors);
			return ResponseEntity
					.badRequest()
					.body(ApiResponse.error(message, 400));
		}
		
		int updateCnt = qnaService.modifyQna(form, request);
		
		
		return ResponseEntity.ok(ApiResponse.success(dto, "Q&A 정상수정 되었습니다."));
	}
}
