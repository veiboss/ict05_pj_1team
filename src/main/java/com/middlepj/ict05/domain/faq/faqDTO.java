package com.middlepj.ict05.domain.faq;

import java.sql.Date;

public class faqDTO {
	
	private int fa_id;             // FAQ 시퀀스(PK)
	private String fa_title;       // FAQ 제목
	private String fa_content;     // FAQ 내용
	private String fa_show;        // FAQ 노출여부
	private int fa_writer_id;      // FAQ 작성자 시퀀스
	private Date fa_reg_date;      // FAQ 작성일
	private int fa_modify_id;      // FAQ 수정자 시퀀스
	private Date fa_modify_date;   // FAQ 수정일
	
	public faqDTO() {
		super();
	}

	public faqDTO(int fa_id, String fa_title, String fa_content, String fa_show, int fa_writer_id, Date fa_reg_date,
			      int fa_modify_id, Date fa_modify_date) {
		super();
		this.fa_id = fa_id;
		this.fa_title = fa_title;
		this.fa_content = fa_content;
		this.fa_show = fa_show;
		this.fa_writer_id = fa_writer_id;
		this.fa_reg_date = fa_reg_date;
		this.fa_modify_id = fa_modify_id;
		this.fa_modify_date = fa_modify_date;
	}

	public int getFa_id() {
		return fa_id;
	}

	public void setFa_id(int fa_id) {
		this.fa_id = fa_id;
	}

	public String getFa_title() {
		return fa_title;
	}

	public void setFa_title(String fa_title) {
		this.fa_title = fa_title;
	}

	public String getFa_content() {
		return fa_content;
	}

	public void setFa_content(String fa_content) {
		this.fa_content = fa_content;
	}

	public String getFa_show() {
		return fa_show;
	}

	public void setFa_show(String fa_show) {
		this.fa_show = fa_show;
	}

	public int getFa_writer_id() {
		return fa_writer_id;
	}

	public void setFa_writer_id(int fa_writer_id) {
		this.fa_writer_id = fa_writer_id;
	}

	public Date getFa_reg_date() {
		return fa_reg_date;
	}

	public void setFa_reg_date(Date fa_reg_date) {
		this.fa_reg_date = fa_reg_date;
	}

	public int getFa_modify_id() {
		return fa_modify_id;
	}

	public void setFa_modify_id(int fa_modify_id) {
		this.fa_modify_id = fa_modify_id;
	}

	public Date getFa_modify_date() {
		return fa_modify_date;
	}

	public void setFa_modify_date(Date fa_modify_date) {
		this.fa_modify_date = fa_modify_date;
	}

	@Override
	public String toString() {
		return "faqDTO [fa_id=" + fa_id + ", fa_title=" + fa_title + ", fa_content=" + fa_content + ", fa_show="
				+ fa_show + ", fa_writer_id=" + fa_writer_id + ", fa_reg_date=" + fa_reg_date + ", fa_modify_id="
				+ fa_modify_id + ", fa_modify_date=" + fa_modify_date + "]";
	}
	
}
