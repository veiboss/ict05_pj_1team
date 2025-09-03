package com.middlepj.ict05.domain.admin.admindrug.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugDetailDTO;

public interface AdminDrugService {
	
	public void drugList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	public void drugAddAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
}
