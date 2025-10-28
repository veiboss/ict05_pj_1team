package com.middlepj.ict05.domain.mypage.mypageqna.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.middlepj.ict05.common.Paging;
import com.middlepj.ict05.domain.mypage.mypageqna.dao.MyQnaDAOImpl;
import com.middlepj.ict05.domain.mypage.mypageqna.dto.MyQnaDTO;

@Service
public class MyQnaServiceImpl implements MyQnaService{

	@Autowired
	private MyQnaDAOImpl dao;
	
	// 1. qna 상세 목록 
	@Override
	public void qnaListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - qnaListAction()");
		
		String pageNum = request.getParameter("pageNum");
		Object id = request.getSession().getAttribute("sessionID");
		String mbGrade = (String)request.getSession().getAttribute("sessionGrade");
		
		int mbId = 0;                     
		if (id != null) {
		    try {
		        mbId = Integer.parseInt(String.valueOf(id).trim());
		    } catch (NumberFormatException ignore) {
		        mbId = 0;                 // 숫자 아니면 0 유지
		    }
		}
		boolean isExpert = "expert".equalsIgnoreCase(mbGrade);
	    
	    // 갯수 카운트
		int currentPage = (pageNum == null || pageNum.equals("0")) ? 1 : Integer.parseInt(pageNum);
	    Paging paging = new Paging(String.valueOf(currentPage));

		Map<String,Object> mapCnt = new HashMap<>();
		mapCnt.put("mbId", mbId);
		mapCnt.put("isExpert", isExpert ? 1 : 0); 
		
	    int total = dao.listCnt(mapCnt);
	    
	    paging.setTotalCount(total);
	    
	    // 게시글 목록 조회
        int start = paging.getStartRow();
        int end = paging.getEndRow();
      
        Map<String, Object> map =  new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("mbId", mbId);
        map.put("mbGrade",mbGrade);
        map.put("isExpert", isExpert ? 1 : 0);   // 1 = 전문가, 0 = 일반회원
	      
	    // qna 목록 조회
	    List<MyQnaDTO> list = dao.qnaList(map);
	    
	    // 6단계. jsp로 처리결과 전달
	    model.addAttribute("list", list);
	    model.addAttribute("paging", paging);
	    model.addAttribute("total", total);
	}

	// 2. 수정버튼 클릭시 수정 페이지 이동
	@Override
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
		System.out.println("MyQnaServiceImpl - qnaListAction()");
		
		int qaId = Integer.parseInt(request.getParameter("qa_id"));
		
		MyQnaDTO dto = dao.qnaDetail(qaId);
			
		model.addAttribute("dto", dto);
		
	}
	
 
	// 3. qna 수정
	@Override
	public void qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - qnaUpdateAction()");
		
		MyQnaDTO dto = new MyQnaDTO();
		
		dto.setQa_id(Integer.parseInt(request.getParameter("qa_id")));
		dto.setQa_title(request.getParameter("qa_title"));
		dto.setQa_content(request.getParameter("qa_content"));
		dto.setQa_show((String)request.getParameter("qa_show"));
		dto.setQa_private(request.getParameter("qa_private"));
		
		dao.updateQna(dto);
		model.addAttribute("dto", dto);
		
	}

	// qna 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
	@Override
	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - qnaDeleteAction()");
		
		int num = Integer.parseInt(request.getParameter("qa_id"));
		
		int deleteCnt = dao.deleteQna(num);
		
		model.addAttribute("num", num);
		model.addAttribute("deleteCnt", deleteCnt);	
	}
	
	// 답변 수정
	@Override
	public int updateAnswer(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - updateAnswer()");
		
		MyQnaDTO dto = new MyQnaDTO();
		
		dto.setQa_id(Integer.parseInt(request.getParameter("qa_id")));
		dto.setQa_answer(request.getParameter("qa_answer"));
	   
		model.addAttribute("dto", dto);
	    
	    return dao.updateAnswer(dto);
	}
	
	// 답변 삭제
	@Override
	public int deleteAnswer(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("MyQnaServiceImpl - deleteAnswer()");
		
		int qaId = Integer.parseInt(request.getParameter("qa_id"));
		
	    return dao.deleteAnswer(qaId);
	}

	// 삭제 후 빈페이지 보정 
	@Override
	public String recalcPageAfterDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
				throws ServletException, IOException {
	    String pageNum = request.getParameter("pageNum");
	    int currentPage = (pageNum == null || pageNum.isBlank()) ? 1 : Integer.parseInt(pageNum);

	    Object id = request.getSession().getAttribute("sessionID");
	    String mbGrade = (String) request.getSession().getAttribute("sessionGrade");
	    int mbId = 0;
	    if (id != null) {
	        try { mbId = Integer.parseInt(String.valueOf(id).trim()); } catch (NumberFormatException ignored) {}
	    }
	    boolean isExpert = "expert".equalsIgnoreCase(mbGrade);

	    Map<String,Object> cntMap = new HashMap<>();
	    cntMap.put("mbId", mbId);
	    cntMap.put("isExpert", isExpert ? 1 : 0);

	    int total = dao.listCnt(cntMap);

	    int pageSize = new Paging("1").getPageSize(); 
	    int maxPage = Math.max(1, (int) Math.ceil(total / (double) pageSize));

	    if (currentPage > maxPage) currentPage = maxPage;

	    return String.valueOf(currentPage);
	}


}
