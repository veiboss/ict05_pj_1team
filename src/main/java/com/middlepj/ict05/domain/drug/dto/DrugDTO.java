package com.middlepj.ict05.domain.drug.dto;

import java.sql.Date;

public class DrugDTO {
	private int dr_id;					// 제약 시퀀스
	private String dr_enterprise;		// 제약 업체명
	private String dr_product;			// 제약 제품명
	private int dr_statement_id;		// 제약 품목번호
	private Date dr_regist_date;		// 제약 등록일자
	private String dr_expiration_date;	// 제약 유통기한
	private String dr_sungsang;			// 제약 성상
	private String dr_serve_use;		// 제약 용도
	private String dr_intake_hint;		// 제약 주의사항
	private String dr_main_function;	// 제약 기능
	private String dr_preservation;		// 제약 보관법
	private String dr_base_standard;	// 제약 규격
	private String dr_show;				// 노출여부
	
	public DrugDTO() {
		super();
	}

	public DrugDTO(int dr_id, String dr_enterprise, String dr_product, int dr_statement_id, Date dr_regist_date,
			String dr_expiration_date, String dr_sungsang, String dr_serve_use, String dr_intake_hint,
			String dr_main_function, String dr_preservation, String dr_base_standard, String dr_show) {
		super();
		this.dr_id = dr_id;
		this.dr_enterprise = dr_enterprise;
		this.dr_product = dr_product;
		this.dr_statement_id = dr_statement_id;
		this.dr_regist_date = dr_regist_date;
		this.dr_expiration_date = dr_expiration_date;
		this.dr_sungsang = dr_sungsang;
		this.dr_serve_use = dr_serve_use;
		this.dr_intake_hint = dr_intake_hint;
		this.dr_main_function = dr_main_function;
		this.dr_preservation = dr_preservation;
		this.dr_base_standard = dr_base_standard;
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

	public int getDr_statement_id() {
		return dr_statement_id;
	}

	public void setDr_statement_id(int dr_statement_id) {
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

	public String getDr_sungsang() {
		return dr_sungsang;
	}

	public void setDr_sungsang(String dr_sungsang) {
		this.dr_sungsang = dr_sungsang;
	}

	public String getDr_serve_use() {
		return dr_serve_use;
	}

	public void setDr_serve_use(String dr_serve_use) {
		this.dr_serve_use = dr_serve_use;
	}

	public String getDr_intake_hint() {
		return dr_intake_hint;
	}

	public void setDr_intake_hint(String dr_intake_hint) {
		this.dr_intake_hint = dr_intake_hint;
	}

	public String getDr_main_function() {
		return dr_main_function;
	}

	public void setDr_main_function(String dr_main_function) {
		this.dr_main_function = dr_main_function;
	}

	public String getDr_preservation() {
		return dr_preservation;
	}

	public void setDr_preservation(String dr_preservation) {
		this.dr_preservation = dr_preservation;
	}

	public String getDr_base_standard() {
		return dr_base_standard;
	}

	public void setDr_base_standard(String dr_base_standard) {
		this.dr_base_standard = dr_base_standard;
	}

	public String getDr_show() {
		return dr_show;
	}

	public void setDr_show(String dr_show) {
		this.dr_show = dr_show;
	}

	@Override
	public String toString() {
		return "drugDTO [dr_id=" + dr_id + ", dr_enterprise=" + dr_enterprise + ", dr_product=" + dr_product
				+ ", dr_statement_id=" + dr_statement_id + ", dr_regist_date=" + dr_regist_date
				+ ", dr_expiration_date=" + dr_expiration_date + ", dr_sungsang=" + dr_sungsang + ", dr_serve_use="
				+ dr_serve_use + ", dr_intake_hint=" + dr_intake_hint + ", dr_main_function=" + dr_main_function
				+ ", dr_preservation=" + dr_preservation + ", dr_base_standard=" + dr_base_standard + ", dr_show="
				+ dr_show + "]";
	}
	
	
}
