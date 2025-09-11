package com.middlepj.ict05.domain.mypage.mypagedrug.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.mypage.mypagedrug.dto.MyPageDrugDTO;

public interface MyPageDrugDAO {
	
	public List<MyPageDrugDTO> myPageDrugList(int mb_id);

	public int myPageDrugDelete(int dr_id);
	
	// 약별 복용 회원수 TOP5
    public List<Map<String, Object>> selectTop5Drugs();
}
