package com.middlepj.ict05.domain.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.middlepj.ict05.domain.qna.dto.QnaDto;
import com.middlepj.ict05.domain.qna.dto.QnaList;
import com.middlepj.ict05.domain.qna.service.QnaService;

@Controller
@RequestMapping("/admin/qna")
public class QnaAdminController {
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		QnaList qnaList = qnaService.qnaList(request);
        
		model.addAttribute("qnaList", qnaList.getQnaList());
		model.addAttribute("paging", qnaList.getPaging());
		
        return "admin_qna/list";
    }
	
	@GetMapping("/detail/{qa_id}")
	public String detail(@PathVariable("qa_id") Integer qa_id, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

		QnaDto dto = qnaService.detailQna(qa_id);

		if(dto == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용이 없습니다.'); location.href='"
					+ request.getContextPath() + "/qna/list';</script>");
			out.flush();
			return null; // 더 이상 뷰 리턴하지 않음
		}

		if(dto.getQa_private().equals("Y")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀글 입니다.'); location.href='"
					+ request.getContextPath() + "/qna/list';</script>");
			out.flush();
			return null; // 더 이상 뷰 리턴하지 않음
		}

		System.out.println(dto);

		model.addAttribute("dto", dto);
		model.addAttribute("qa_id", qa_id);

		return "admin_qna/detail";
	}
}
