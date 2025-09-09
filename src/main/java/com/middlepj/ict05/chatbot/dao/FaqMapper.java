package com.middlepj.ict05.chatbot.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FaqMapper {
    // 추천용 제목 리스트 (노출 Y, 최신순 상위 N)
    List<String> listTitles(@Param("limit") int limit);

    // 제목 "완전 일치"로 답변 1개 (대소문자/양끝공백 무시)
    String findContentByExactTitle(@Param("title") String title);
}
