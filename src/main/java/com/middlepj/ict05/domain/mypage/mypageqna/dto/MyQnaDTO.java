package com.middlepj.ict05.domain.mypage.mypageqna.dto;

import java.util.Date;

public class MyQnaDTO {

	private int qa_id;				// 전문가 시퀀스(PK)
	private int dr_id;				// 회원(전문가) 시퀀스(FK)
	private String qa_title;		// 제목
	private String qa_content;		// 내용
	private String qa_private;		// 비밀글 여부
	private String qa_answer;		// 답변
	
	public MyQnaDTO() {
		super();
	}

	public MyQnaDTO(int qa_id, int dr_id, String qa_title, String qa_content, String qa_private,
			String qa_answer) {
		super();
		this.qa_id = qa_id;
		this.dr_id = dr_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_private = qa_private;
		this.qa_answer = qa_answer;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public int getDr_id() {
		return dr_id;
	}

	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_private() {
		return qa_private;
	}

	public void setQa_private(String qa_private) {
		this.qa_private = qa_private;
	}

	public String getQa_answer() {
		return qa_answer;
	}

	public void setQa_answer(String qa_answer) {
		this.qa_answer = qa_answer;
	}

	@Override
	public String toString() {
		return "MyQnaDTO [qa_id=" + qa_id + ", dr_id=" + dr_id + ", qa_title=" + qa_title
				+ ", qa_content=" + qa_content + ", qa_private=" + qa_private + ", qa_answer=" + qa_answer + "]";
	}

	
	
}


