package com.middlepj.ict05.domain.faq.dto;

import java.sql.Date;

public class FaqUserDTO {
	
	private int fa_id;  		   // FAQ 시퀀스(PK)
	private String fa_title;       // FAQ 제목
	private String fa_content;     // FAQ 내용
	private String fa_show;        // FAQ 노출여부
	private Date fa_reg_date;      // FAQ 작성일

	public FaqUserDTO() {
		super();
	}

	public FaqUserDTO(int fa_id, String fa_title, String fa_content, String fa_show, Date fa_reg_date) {
		super();
		this.fa_id = fa_id;
		this.fa_title = fa_title;
		this.fa_content = fa_content;
		this.fa_show = fa_show;
		this.fa_reg_date = fa_reg_date;
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

	public Date getFa_reg_date() {
		return fa_reg_date;
	}

	public void setFa_reg_date(Date fa_reg_date) {
		this.fa_reg_date = fa_reg_date;
	}

	@Override
	public String toString() {
		return "FaqUserDTO [fa_id=" + fa_id + ", fa_title=" + fa_title + ", fa_content=" + fa_content + ", fa_show="
				+ fa_show + ", fa_reg_date=" + fa_reg_date + "]";
	}
	

	
}
