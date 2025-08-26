package com.middlepj.ict05.domain.admin.adminreview.dto;

public class ReviewDTO {
	private int rv_id;
	private int mb_id;
	private int dr_id;
	private String rv_contnt;
	private int rv_rating;
	private char rv_show;
	
	private String dr_product;
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rv_id, int mb_id, int dr_id, String rv_contnt, int rv_rating, char rv_show,
			String dr_product) {
		super();
		this.rv_id = rv_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.rv_contnt = rv_contnt;
		this.rv_rating = rv_rating;
		this.rv_show = rv_show;
		this.dr_product = dr_product;
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

	public String getRv_contnt() {
		return rv_contnt;
	}

	public void setRv_contnt(String rv_contnt) {
		this.rv_contnt = rv_contnt;
	}

	public int getRv_rating() {
		return rv_rating;
	}

	public void setRv_rating(int rv_rating) {
		this.rv_rating = rv_rating;
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
		return "ReviewDTO [rv_id=" + rv_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", rv_contnt=" + rv_contnt
				+ ", rv_rating=" + rv_rating + ", rv_show=" + rv_show + ", dr_product=" + dr_product + "]";
	}

	
	
	
}
