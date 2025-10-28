package com.middlepj.ict05.chatbot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.middlepj.ict05.chatbot.dto.MemberDrug;

@Mapper
public interface MemberDrugMapper {
    List<MemberDrug> findByMemberId(@Param("memberId") Long memberId);
}
