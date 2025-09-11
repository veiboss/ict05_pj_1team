package com.middlepj.ict05.domain.mypage.mypageqna.dto;

import java.util.Date;

public class MyQnaDTO {

	private int qa_id;				// qna글 시퀀스(PK)
	private int mb_id;				// 전문가 시퀀스(FK)
	private String qa_title;		// 제목
	private String qa_content;		// 내용
	private String qa_private;		// 비밀글 여부
	private String qa_answer;		// 답변
	private String qa_show;			// 노출여부
	private int qa_writer_id;		// 작성자
	private String mb_grade;
	private Date qa_reg_date;  // 작성일 
	private Date qa_answer_date;  // 작성일 
	
	public MyQnaDTO() {
		super();
	}

	public MyQnaDTO(int qa_id, int mb_id, String qa_title, String qa_content, String qa_private, String qa_answer,
			String qa_show, int qa_writer_id, String mb_grade, Date qa_reg_date, Date qa_answer_date) {
		super();
		this.qa_id = qa_id;
		this.mb_id = mb_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_private = qa_private;
		this.qa_answer = qa_answer;
		this.qa_show = qa_show;
		this.qa_writer_id = qa_writer_id;
		this.mb_grade = mb_grade;
		this.qa_reg_date = qa_reg_date;
		this.qa_answer_date = qa_answer_date;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public int getMb_id() {
		return mb_id;
	}

	public void setMb_id(int mb_id) {
		this.mb_id = mb_id;
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

	public String getQa_show() {
		return qa_show;
	}

	public void setQa_show(String qa_show) {
		this.qa_show = qa_show;
	}

	public int getQa_writer_id() {
		return qa_writer_id;
	}

	public void setQa_writer_id(int qa_writer_id) {
		this.qa_writer_id = qa_writer_id;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	public Date getQa_reg_date() {
		return qa_reg_date;
	}

	public void setQa_reg_date(Date qa_reg_date) {
		this.qa_reg_date = qa_reg_date;
	}

	public Date getQa_answer_date() {
		return qa_answer_date;
	}

	public void setQa_answer_date(Date qa_answer_date) {
		this.qa_answer_date = qa_answer_date;
	}

	@Override
	public String toString() {
		return "MyQnaDTO [qa_id=" + qa_id + ", mb_id=" + mb_id + ", qa_title=" + qa_title + ", qa_content=" + qa_content
				+ ", qa_private=" + qa_private + ", qa_answer=" + qa_answer + ", qa_show=" + qa_show + ", qa_writer_id="
				+ qa_writer_id + ", mb_grade=" + mb_grade + ", qa_reg_date=" + qa_reg_date + ", qa_answer_date="
				+ qa_answer_date + "]";
	}

}


