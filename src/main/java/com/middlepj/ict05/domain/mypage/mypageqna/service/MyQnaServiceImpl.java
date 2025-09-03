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
		int mbId = (int) request.getSession().getAttribute("sessionID");
		
	     
	    // 갯수 카운트
		int currentPage = (pageNum == null || pageNum.equals("0")) ? 1 : Integer.parseInt(pageNum);
	      Paging paging = new Paging(String.valueOf(currentPage));

		Map<String,Object> mapCnt = new HashMap<>();
		mapCnt.put("mbId", mbId); 
		
	    int total = dao.listCnt(mapCnt);
	    
	    paging.setTotalCount(total);
	    
	    
	    // 5-2단계. 게시글 목록 조회
        int start = paging.getStartRow();
        int end = paging.getEndRow();
      
        Map<String, Object> map =  new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("mbId", mbId);
	      
	    // qna 목록 조회
	    List<MyQnaDTO> list = dao.qnaList(map);
		
	    System.out.println(list);
	    
	    // 6단계. jsp로 처리결과 전달
	    model.addAttribute("list", list);
	    model.addAttribute("paging", paging);
		
	}

	// 2. 수정버튼 클릭시 - 전문가 댓글 없을 시에 수정 페이지 이동
	@Override
	public void qnaDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		
	}

//	// 3. qna 수정
//	@Override
//	public void qnaUpdateAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		
//	}
//
//	// qna 삭제 버튼 클릭시 - 전문가 댓글 없을 시에/ 삭제 (안보임처리)
//	@Override
//	public void qnaDeleteAction(HttpServletRequest request, HttpServletResponse response, Model model)
//			throws ServletException, IOException {
//		
//	}

}
