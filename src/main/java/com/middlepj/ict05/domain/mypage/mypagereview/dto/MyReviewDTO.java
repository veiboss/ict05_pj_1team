package com.middlepj.ict05.domain.mypage.mypagereview.dto;

import java.util.Date;

public class MyReviewDTO {

	private int rv_id;				// 후기 시퀀스(PK)
	private int mb_id;				// 회원 시퀀스(FK)
	private int dr_id;			// 약 시퀀스(FK)
	private String rv_content;		// 후기 내용
	private int rv_rating;			// 후기 별점
	private String rv_show;			// 노출 여부
	private String dr_product;
	private String dr_sungsang;
	private Date rv_reg_date;  // 작성일 
	
	public MyReviewDTO() {
		super();
	}

	public MyReviewDTO(int rv_id, int mb_id, int dr_id, String rv_content, int rv_rating, String rv_show,
			String dr_product, String dr_sungsang, Date rv_reg_date) {
		super();
		this.rv_id = rv_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_show = rv_show;
		this.dr_product = dr_product;
		this.dr_sungsang = dr_sungsang;
		this.rv_reg_date = rv_reg_date;
	}

	public int getRv_id() {
		return rv_id;
	}

	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
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

	public String getRv_show() {
		return rv_show;
	}

	public void setRv_show(String rv_show) {
		this.rv_show = rv_show;
	}

	public String getDr_product() {
		return dr_product;
	}

	public void setDr_product(String dr_product) {
		this.dr_product = dr_product;
	}

	public String getDr_sungsang() {
		return dr_sungsang;
	}

	public void setDr_sungsang(String dr_sungsang) {
		this.dr_sungsang = dr_sungsang;
	}

	public Date getRv_reg_date() {
		return rv_reg_date;
	}

	public void setRv_reg_date(Date rv_reg_date) {
		this.rv_reg_date = rv_reg_date;
	}

	@Override
	public String toString() {
		return "MyReviewDTO [rv_id=" + rv_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", rv_content=" + rv_content
				+ ", rv_rating=" + rv_rating + ", rv_show=" + rv_show + ", dr_product=" + dr_product + ", dr_sungsang="
				+ dr_sungsang + ", rv_reg_date=" + rv_reg_date + "]";
	}

	
}


