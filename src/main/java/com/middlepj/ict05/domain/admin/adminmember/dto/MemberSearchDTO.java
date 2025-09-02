package com.middlepj.ict05.domain.admin.adminmember.dto;

// DTO(Data Transfer Object) = VO(Value Object)
public class MemberSearchDTO {
	private String s_grade;		// 회원 등급
	private String s_keyword;	// 검색어
	private int start;			// 페이징 시작
	private int end;			// 페이징 끝
	
	// getter/setter
	public String getS_grade() {
		return s_grade;
	}
	public void setS_grade(String s_grade) {
		this.s_grade = s_grade;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	@Override
	public String toString() {
		return "MemberSearchDTO [s_grade=" + s_grade + ", s_keyword=" + s_keyword + ", start=" + start + ", end=" + end
				+ "]";
	}
	
}
