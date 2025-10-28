package com.middlepj.ict05.domain.home.dao;

import com.middlepj.ict05.domain.home.dto.ProfileDTO;

public interface ProfileDAO {

	// 프로필 등록여부 체크
	public int checkProfile(int checkNo);
	
	// 프로필 등록
	public int insertProfile(ProfileDTO dto);
}
