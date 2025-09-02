package com.middlepj.ict05.domain.admin.admindrug.dto;

import java.sql.Date;

public class AdminDrugListDTO {

	private int dr_id;	// 제약시퀀스
	private String dr_enterprise;	// 업체명
	private String dr_product;	// 제품명
	private Long dr_statement_id;	// 품목번호
	private Date dr_regist_date;	// 등록일자
	private String dr_expiration_date;	// 유통기한
	private String dr_show;	// 노출여부
	
	public AdminDrugListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminDrugListDTO(int dr_id, String dr_enterprise, String dr_product, Long dr_statement_id,
			Date dr_regist_date, String dr_expiration_date, String dr_show) {
		super();
		this.dr_id = dr_id;
		this.dr_enterprise = dr_enterprise;
		this.dr_product = dr_product;
		this.dr_statement_id = dr_statement_id;
		this.dr_regist_date = dr_regist_date;
		this.dr_expiration_date = dr_expiration_date;
		this.dr_show = dr_show;
	}

	public int getDr_id() {
		return dr_id;
	}

	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
	}

	public String getDr_enterprise() {
		return dr_enterprise;
	}

	public void setDr_enterprise(String dr_enterprise) {
		this.dr_enterprise = dr_enterprise;
	}

	public String getDr_product() {
		return dr_product;
	}

	public void setDr_product(String dr_product) {
		this.dr_product = dr_product;
	}

	public Long getDr_statement_id() {
		return dr_statement_id;
	}

	public void setDr_statement_id(Long dr_statement_id) {
		this.dr_statement_id = dr_statement_id;
	}

	public Date getDr_regist_date() {
		return dr_regist_date;
	}

	public void setDr_regist_date(Date dr_regist_date) {
		this.dr_regist_date = dr_regist_date;
	}

	public String getDr_expiration_date() {
		return dr_expiration_date;
	}

	public void setDr_expiration_date(String dr_expiration_date) {
		this.dr_expiration_date = dr_expiration_date;
	}

	public String getDr_show() {
		return dr_show;
	}

	public void setDr_show(String dr_show) {
		this.dr_show = dr_show;
	}

	@Override
	public String toString() {
		return "AdminDrugListDTO [dr_id=" + dr_id + ", dr_enterprise=" + dr_enterprise + ", dr_product=" + dr_product
				+ ", dr_statement_id=" + dr_statement_id + ", dr_regist_date=" + dr_regist_date
				+ ", dr_expiration_date=" + dr_expiration_date + ", dr_show=" + dr_show + "]";
	}

	
	
	
}
