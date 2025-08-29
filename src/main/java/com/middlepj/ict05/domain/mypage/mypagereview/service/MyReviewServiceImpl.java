package com.middlepj.ict05.domain.mypage.mypagereview.service;

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
import com.middlepj.ict05.domain.mypage.mypagereview.dao.MyReviewDAOImpl;
import com.middlepj.ict05.domain.mypage.mypagereview.dto.MyReviewDTO;

@Service
public class MyReviewServiceImpl implements MyReviewService{
	
	@Autowired
	private MyReviewDAOImpl dao;

	// 1. 게시글 목록
	@Override
	public void reviewListAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewListAction()");
		
		String pageNum = request.getParameter("pageNum");
		int mbId = (Integer)request.getSession().getAttribute("sessionID");
		
	     
	    // 갯수 카운트
		Paging paging = new Paging(pageNum);
	    int total = dao.listCnt(mbId);
	    
	    paging.setTotalCount(total);
	    
	    
	    // 5-2단계. 게시글 목록 조회
        int start = paging.getStartRow();
        int end = paging.getEndRow();
      
        Map<String, Object> map =  new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);
        map.put("mbId", mbId);
	      
	      
	    // 후기 목록 조회
	    List<MyReviewDTO> list = dao.reviewList(map);
		
	    // 6단계. jsp로 처리결과 전달
	    model.addAttribute("list", list);
	    model.addAttribute("paging", paging);
	}

	// 2. 수정버튼 클릭시 - 수정 페이지로 이동
	@Override
	public void reviewDetailAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewDetailAction()");
		
		int rvId = Integer.parseInt(request.getParameter("rv_id"));
		
		MyReviewDTO dto = dao.reviewDetail(rvId);
			
		model.addAttribute("dto", dto);
	}

		// 2-1. 게시글 수정 (내용, 별점, 노출/비노출)
	@Override
	public void reviewUpdateAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
			throws ServletException, IOException {
		System.out.println("ReviewServiceImpl - reviewUpdateAction()");
		
		MyReviewDTO dto = new MyReviewDTO();
		
		dto.setRv_content(request.getParameter("rv_content"));
		dto.setRv_show((String)request.getParameter("rv_show"));
		dto.setRv_rating(Integer.parseInt(request.getParameter("rv_rating")));
		
		
		dao.updateReview(dto);
	}

//	// 3. 게시글 삭제 버튼 클릭시 - 삭제 (안보임처리)
//	@Override
//	public void reviewDeleteAction(HttpServletRequest request, HttpServletResponse reqResponse, Model model)
//			throws ServletException, IOException {
//		System.out.println("ReviewServiceImpl - reviewDeleteAction()");
//		
//	}
	
}
