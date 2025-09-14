package com.middlepj.ict05.domain.mypage.mypageqna.controller;

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

import com.middlepj.ict05.domain.mypage.mypageqna.dto.MyQnaDTO;
import com.middlepj.ict05.domain.mypage.mypageqna.service.MyQnaServiceImpl;

@Controller
public class MyQnaController {

private static final Logger logger = LoggerFactory.getLogger(MyQnaController.class);	
	
	@Autowired
	private MyQnaServiceImpl service;
	
	 // qna 상세 목록
	 @RequestMapping("/myQnaList.do")
	 public String myQnaList(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaList.do >>>");
		 
		 service.qnaListAction(request, response, model);
		 
		 return "myPage/myPageQna/myQnaList"; 
	 
	 }
	
	 // 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	 @RequestMapping("/myQnaDetail.do")
	 public String myQnaDetail(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaDetail.do >>>");
	
		// 답변 여부 확인
		 MyQnaDTO qna = service.getQnaById(Integer.parseInt(request.getParameter("qa_id")));
		 if (qna.getQa_answer() != null && !qna.getQa_answer().isEmpty()) {
		     // 답변이 이미 있는 경우
		     return "myPage/myPageQna/myQnaUpdateBack";
		     
		 } else {
		     // 답변이 없는 경우 → 디테일 페이지 이동
		     model.addAttribute("dto", qna);
		     return "myPage/myPageQna/myQnaDetail";
		 }
	 
	 } 
	
	 // qna 수정 
	 @RequestMapping("/myQnaUpdate.do")
	 public String myQnaUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaUpdate.do >>>");
	
		 service.qnaUpdateAction(request, response, model);
		 
		 String pageNum = request.getParameter("pageNum");
		 String pn = (pageNum == null || pageNum.isBlank()) ? "1" : pageNum;

		 // 저장 후 목록으로
		 return "redirect:/myQnaList.do?pageNum=" + pn;
	 
	 } 
	
	 // qna 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
	 @RequestMapping("/myQnaDelete.do")
	 public String myQnaDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaDelete.do >>>");
	
		 service.qnaDeleteAction(request, response, model);
		  
		 return "myPage/myPageQna/myQnaDelete";
		 
		 
	 } 
	 
	 // 답변 수정
	 @RequestMapping("/myQnaAnswerUpdate.do")
	 public String myQnaAnswerUpdate(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaAnswerUpdate.do >>>");
	
		 service.updateAnswer(request, response, model);
		 
		 // 현재 페이지 번호 & 포커스용 id 유지
	    String pageNum = request.getParameter("pageNum");
	    String qaId    = request.getParameter("qa_id");
	    if (pageNum == null || pageNum.isBlank()) pageNum = "1";
		 
	    return "redirect:/myQnaList.do?pageNum=" + pageNum + "&focusId=" + qaId;
	 
	 } 
	 
	 // 답변 삭제
	 @RequestMapping("/myQnaAnswerDelete.do")
	 public String myQnaAnswerDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
			 throws ServletException, IOException { 
		 logger.info("<<< url ==> /myQnaAnswerDelete.do >>>");
	
		 service.deleteAnswer(request, response, model);
		 
		// 현재 페이지/포커스 유지
	    String pageNum = request.getParameter("pageNum");
	    String qaId    = request.getParameter("qa_id");
	    if (pageNum == null || pageNum.isBlank()) pageNum = "1";
	    
	    return "redirect:/myQnaList.do?pageNum=" + pageNum + "&focusId=" + qaId + "&deleted=1"; 
	 
	 } 
	 
	 
	 
	 
}
