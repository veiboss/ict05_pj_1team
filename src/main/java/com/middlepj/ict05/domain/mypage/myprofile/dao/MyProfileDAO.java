package com.middlepj.ict05.domain.mypage.myprofile.dao;

import com.middlepj.ict05.domain.mypage.myprofile.dto.MyProfileDTO;

public interface MyProfileDAO {

	public MyProfileDTO myProfileDetail(int name);
	
	public int myProfileUpdate(MyProfileDTO dto);
	
	public int myProfileDelete(int id);
	
}
