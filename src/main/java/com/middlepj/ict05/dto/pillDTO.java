package com.middlepj.ict05.dto;

import java.sql.Date;

public class pillDTO {

	private int DR_ID;					// 제약 시퀀스
	private String DR_ENTERPRISE;		// 제약 업체명
	private String DR_PRODUCT;			// 제약 제품명
	private int DR_STATEMENT_ID;		// 제약 품목번호
	private Date DR_REGIST_DATE;		// 제약 등록일자
	private String DR_EXPIRATION_DATE;	// 제약 유통기한
	private String DR_SUNGSANG;			// 제약 성상
	private String DR_SERVE_USE;		// 제약 용도
	private String DR_INTAKE_HINT;		// 제약 주의사항
	private String DR_MAIN_FUNCTION;	// 제약 기능
	private String DR_PRESERVATION;		// 제약 보관법
	private String DR_BASE_STANDARD;	// 제약 규격
	private String DR_SHOW;				// 노출여부
	
	public pillDTO() {
		super();
	}

	public pillDTO(int dR_ID, String dR_ENTERPRISE, String dR_PRODUCT, int dR_STATEMENT_ID, Date dR_REGIST_DATE,
			String dR_EXPIRATION_DATE, String dR_SUNGSANG, String dR_SERVE_USE, String dR_INTAKE_HINT,
			String dR_MAIN_FUNCTION, String dR_PRESERVATION, String dR_BASE_STANDARD, String dR_SHOW) {
		super();
		DR_ID = dR_ID;
		DR_ENTERPRISE = dR_ENTERPRISE;
		DR_PRODUCT = dR_PRODUCT;
		DR_STATEMENT_ID = dR_STATEMENT_ID;
		DR_REGIST_DATE = dR_REGIST_DATE;
		DR_EXPIRATION_DATE = dR_EXPIRATION_DATE;
		DR_SUNGSANG = dR_SUNGSANG;
		DR_SERVE_USE = dR_SERVE_USE;
		DR_INTAKE_HINT = dR_INTAKE_HINT;
		DR_MAIN_FUNCTION = dR_MAIN_FUNCTION;
		DR_PRESERVATION = dR_PRESERVATION;
		DR_BASE_STANDARD = dR_BASE_STANDARD;
		DR_SHOW = dR_SHOW;
	}

	public int getDR_ID() {
		return DR_ID;
	}
	public void setDR_ID(int dR_ID) {
		DR_ID = dR_ID;
	}

	public String getDR_ENTERPRISE() {
		return DR_ENTERPRISE;
	}
	public void setDR_ENTERPRISE(String dR_ENTERPRISE) {
		DR_ENTERPRISE = dR_ENTERPRISE;
	}

	public String getDR_PRODUCT() {
		return DR_PRODUCT;
	}
	public void setDR_PRODUCT(String dR_PRODUCT) {
		DR_PRODUCT = dR_PRODUCT;
	}

	public int getDR_STATEMENT_ID() {
		return DR_STATEMENT_ID;
	}
	public void setDR_STATEMENT_ID(int dR_STATEMENT_ID) {
		DR_STATEMENT_ID = dR_STATEMENT_ID;
	}

	public Date getDR_REGIST_DATE() {
		return DR_REGIST_DATE;
	}
	public void setDR_REGIST_DATE(Date dR_REGIST_DATE) {
		DR_REGIST_DATE = dR_REGIST_DATE;
	}

	public String getDR_EXPIRATION_DATE() {
		return DR_EXPIRATION_DATE;
	}
	public void setDR_EXPIRATION_DATE(String dR_EXPIRATION_DATE) {
		DR_EXPIRATION_DATE = dR_EXPIRATION_DATE;
	}

	public String getDR_SUNGSANG() {
		return DR_SUNGSANG;
	}
	public void setDR_SUNGSANG(String dR_SUNGSANG) {
		DR_SUNGSANG = dR_SUNGSANG;
	}

	public String getDR_SERVE_USE() {
		return DR_SERVE_USE;
	}
	public void setDR_SERVE_USE(String dR_SERVE_USE) {
		DR_SERVE_USE = dR_SERVE_USE;
	}

	public String getDR_INTAKE_HINT() {
		return DR_INTAKE_HINT;
	}
	public void setDR_INTAKE_HINT(String dR_INTAKE_HINT) {
		DR_INTAKE_HINT = dR_INTAKE_HINT;
	}

	public String getDR_MAIN_FUNCTION() {
		return DR_MAIN_FUNCTION;
	}
	public void setDR_MAIN_FUNCTION(String dR_MAIN_FUNCTION) {
		DR_MAIN_FUNCTION = dR_MAIN_FUNCTION;
	}

	public String getDR_PRESERVATION() {
		return DR_PRESERVATION;
	}
	public void setDR_PRESERVATION(String dR_PRESERVATION) {
		DR_PRESERVATION = dR_PRESERVATION;
	}

	public String getDR_BASE_STANDARD() {
		return DR_BASE_STANDARD;
	}
	public void setDR_BASE_STANDARD(String dR_BASE_STANDARD) {
		DR_BASE_STANDARD = dR_BASE_STANDARD;
	}

	public String getDR_SHOW() {
		return DR_SHOW;
	}
	public void setDR_SHOW(String dR_SHOW) {
		DR_SHOW = dR_SHOW;
	}

	@Override
	public String toString() {
		return "pillDTO [DR_ID=" + DR_ID + ", DR_ENTERPRISE=" + DR_ENTERPRISE + ", DR_PRODUCT=" + DR_PRODUCT
				+ ", DR_STATEMENT_ID=" + DR_STATEMENT_ID + ", DR_REGIST_DATE=" + DR_REGIST_DATE
				+ ", DR_EXPIRATION_DATE=" + DR_EXPIRATION_DATE + ", DR_SUNGSANG=" + DR_SUNGSANG + ", DR_SERVE_USE="
				+ DR_SERVE_USE + ", DR_INTAKE_HINT=" + DR_INTAKE_HINT + ", DR_MAIN_FUNCTION=" + DR_MAIN_FUNCTION
				+ ", DR_PRESERVATION=" + DR_PRESERVATION + ", DR_BASE_STANDARD=" + DR_BASE_STANDARD + ", DR_SHOW="
				+ DR_SHOW + "]";
	}
	
}
