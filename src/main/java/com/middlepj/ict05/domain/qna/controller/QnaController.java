package com.middlepj.ict05.domain.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.middlepj.ict05.domain.qna.dto.QnaDto;
import com.middlepj.ict05.domain.qna.dto.QnaForm;
import com.middlepj.ict05.domain.qna.dto.QnaList;
import com.middlepj.ict05.domain.qna.service.QnaService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/list")
    public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		QnaList qnaList = qnaService.qnaList(request);
        
		model.addAttribute("qnaList", qnaList.getQnaList());
		model.addAttribute("paging", qnaList.getPaging());
		
        return "qna/list";
    }
	
	@GetMapping("/write")
	public String writeForm(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		HttpSession session = request.getSession();
		Object sessionIdObj = session.getAttribute("sessionID");
		String sessionID = sessionIdObj != null ? sessionIdObj.toString():null;
		
		if(sessionID == null || sessionID.isEmpty()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인후 작성해주세요'); location.href='"
					+ request.getContextPath() + "/login.do?redirect=/ict05/qna/write';</script>");
			out.flush();
			return null; // 더 이상 뷰 리턴하지 않음
		}
		
		return "qna/write";
	}

	@PostMapping("/write")
	public String writeAction(QnaForm form, HttpServletRequest request, Model model) {
		
		int insertCnt = qnaService.insertQna(form, request);
		
		return "redirect:/qna/list";
	}
	
	@GetMapping("/write-api")
	public String writeFormApi(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "qna/write_api";
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

		return "qna/detail";
	}
	

	@PostMapping("/answer")
	public String answer(HttpServletRequest request, HttpServletResponse response, Model model) {
		int qa_id = Integer.parseInt(request.getParameter("qa_id"));
		QnaDto dto = qnaService.answerQna(request);

		return "redirect:/qna/detail/" + qa_id;
	}
	
	@GetMapping("/modify/{qa_id}")
	public String qnaModify(@PathVariable("qa_id") Integer qa_id, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		HttpSession session = request.getSession();
		Object sessionIdObj = session.getAttribute("sessionID");
		String sessionID = sessionIdObj != null ? sessionIdObj.toString():null;
		
		QnaDto dto = qnaService.detailQna(qa_id);

		if(dto == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용이 없습니다.'); location.href='"
					+ request.getContextPath() + "/qna/list';</script>");
			out.flush();
			return null;
		}

		if(dto.getQa_private().equals("Y")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀글 입니다.'); location.href='"
					+ request.getContextPath() + "/qna/list';</script>");
			out.flush();
			return null;
		}

		if(dto.getQa_writer_id() != Integer.parseInt(sessionID)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다른 사람이 작성한 글입니다.'); location.href='"
					+ request.getContextPath() + "/qna/list';</script>");
			out.flush();
			return null;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("qa_id", qa_id);
		
		return "qna/modify";
	}

}
