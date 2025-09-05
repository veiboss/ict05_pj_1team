package com.middlepj.ict05.domain.mypage.mypagedrug.dao;

import java.util.List;

import com.middlepj.ict05.domain.mypage.mypagedrug.dto.MyPageDrugDTO;

public interface MyPageDrugDAO {
	
	public List<MyPageDrugDTO> myPageDrugList(int mb_id);

	public int myPageDrugDelete(int dr_id);
}
