package com.middlepj.ict05.domain.qna.dto;

import java.sql.Date;

public class QnaDto {

	private int qa_id;
	private int mb_id;
	private int dr_id;
	private String qa_title;
	private String qa_content;
	private char qa_private;
	private String qa_answer;
	private Date qa_answer_date;
	private int qa_readcount;
	private char qa_show;
	private int qa_writer_id;
	private Date qa_reg_date;
	private int qa_modify_id;
	private Date qa_modify_date;
	
	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaDto(int qa_id, int mb_id, int dr_id, String qa_title, String qa_content, char qa_private,
			String qa_answer, Date qa_answer_date, int qa_readcount, char qa_show, int qa_writer_id, Date qa_reg_date,
			int qa_modify_id, Date qa_modify_date) {
		super();
		this.qa_id = qa_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_private = qa_private;
		this.qa_answer = qa_answer;
		this.qa_answer_date = qa_answer_date;
		this.qa_readcount = qa_readcount;
		this.qa_show = qa_show;
		this.qa_writer_id = qa_writer_id;
		this.qa_reg_date = qa_reg_date;
		this.qa_modify_id = qa_modify_id;
		this.qa_modify_date = qa_modify_date;
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

	public char getQa_private() {
		return qa_private;
	}

	public void setQa_private(char qa_private) {
		this.qa_private = qa_private;
	}

	public String getQa_answer() {
		return qa_answer;
	}

	public void setQa_answer(String qa_answer) {
		this.qa_answer = qa_answer;
	}

	public Date getQa_answer_date() {
		return qa_answer_date;
	}

	public void setQa_answer_date(Date qa_answer_date) {
		this.qa_answer_date = qa_answer_date;
	}

	public int getQa_readcount() {
		return qa_readcount;
	}

	public void setQa_readcount(int qa_readcount) {
		this.qa_readcount = qa_readcount;
	}

	public char getQa_show() {
		return qa_show;
	}

	public void setQa_show(char qa_show) {
		this.qa_show = qa_show;
	}

	public int getQa_writer_id() {
		return qa_writer_id;
	}

	public void setQa_writer_id(int qa_writer_id) {
		this.qa_writer_id = qa_writer_id;
	}

	public Date getQa_reg_date() {
		return qa_reg_date;
	}

	public void setQa_reg_date(Date qa_reg_date) {
		this.qa_reg_date = qa_reg_date;
	}

	public int getQa_modify_id() {
		return qa_modify_id;
	}

	public void setQa_modify_id(int qa_modify_id) {
		this.qa_modify_id = qa_modify_id;
	}

	public Date getQa_modify_date() {
		return qa_modify_date;
	}

	public void setQa_modify_date(Date qa_modify_date) {
		this.qa_modify_date = qa_modify_date;
	}

	@Override
	public String toString() {
		return "QnaDto [qa_id=" + qa_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", qa_title=" + qa_title
				+ ", qa_content=" + qa_content + ", qa_private=" + qa_private + ", qa_answer=" + qa_answer
				+ ", qa_answer_date=" + qa_answer_date + ", qa_readcount=" + qa_readcount + ", qa_show=" + qa_show
				+ ", qa_writer_id=" + qa_writer_id + ", qa_reg_date=" + qa_reg_date + ", qa_modify_id=" + qa_modify_id
				+ ", qa_modify_date=" + qa_modify_date + "]";
	}
	
	
	
}
