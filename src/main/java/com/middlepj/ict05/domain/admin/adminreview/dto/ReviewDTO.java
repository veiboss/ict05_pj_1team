package com.middlepj.ict05.domain.admin.adminreview.dto;

import java.sql.Date;

public class ReviewDTO {
	private int rv_id;
	private String mb_name;
	private String rv_content;
	private int rv_rating;
	private int rv_readcount;
	private Date rv_reg_date;
	private char rv_show;
	
	private String dr_product;
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rv_id, String mb_name, String rv_content, int rv_rating, int rv_readcount, Date rv_reg_date,
			char rv_show, String dr_product) {
		super();
		this.rv_id = rv_id;
		this.mb_name = mb_name;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_readcount = rv_readcount;
		this.rv_reg_date = rv_reg_date;
		this.rv_show = rv_show;
		this.dr_product = dr_product;
	}

	public int getRv_id() {
		return rv_id;
	}

	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getRv_content() {
		return rv_content;
	}

	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_rating() {
		return rv_rating;
	}

	public void setRv_rating(int rv_rating) {
		this.rv_rating = rv_rating;
	}

	public int getRv_readcount() {
		return rv_readcount;
	}

	public void setRv_readcount(int rv_readcount) {
		this.rv_readcount = rv_readcount;
	}

	public Date getRv_reg_date() {
		return rv_reg_date;
	}

	public void setRv_reg_date(Date rv_reg_date) {
		this.rv_reg_date = rv_reg_date;
	}

	public char getRv_show() {
		return rv_show;
	}

	public void setRv_show(char rv_show) {
		this.rv_show = rv_show;
	}

	public String getDr_product() {
		return dr_product;
	}

	public void setDr_product(String dr_product) {
		this.dr_product = dr_product;
	}

	@Override
	public String toString() {
		return "ReviewDTO [rv_id=" + rv_id + ", mb_name=" + mb_name + ", rv_content=" + rv_content + ", rv_rating="
				+ rv_rating + ", rv_readcount=" + rv_readcount + ", rv_reg_date=" + rv_reg_date + ", rv_show=" + rv_show
				+ ", dr_product=" + dr_product + "]";
	}

	
	

	
	
	
}
