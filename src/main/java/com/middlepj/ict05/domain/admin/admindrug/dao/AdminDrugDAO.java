package com.middlepj.ict05.domain.admin.admindrug.dao;

import java.util.List;
import java.util.Map;

import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugDetailDTO;
import com.middlepj.ict05.domain.admin.admindrug.dto.AdminDrugListDTO;

public interface AdminDrugDAO {
	
	public int boardCnt();
	
	public int boardSearchCnt(Map<String, Object> map);
	
	public List<AdminDrugListDTO> drugList(Map<String, Object> map);

	public List<AdminDrugListDTO> drugSearchList(Map<String, Object> map);
	
	public int drugInsert(AdminDrugDetailDTO dto);
	
	public AdminDrugDetailDTO drugSelectOne(int dr_id);
	
	public int drugUpdate(AdminDrugDetailDTO dto);

	public int drugDelete(int dr_id);
}
