package com.middlepj.ict05.domain.drug.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;

public interface DrugService {

	// 영양제 목록
	public void drugListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 영양제 추가 클릭 시 - 내 영양제에 추가
	public void drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 영양제 확인
	public int countMyDrug(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 영양 상세 처리
	public void drugDetailAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 후기 목록 
	public void reviewListAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	// 후기 등록 처리 
	public void reviewInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
}
