package com.middlepj.ict05.domain.mypage.mypagedrug.dto;

import java.sql.Date;

import com.middlepj.ict05.domain.drug.dto.DrugDTO;

public class MyPageDrugDTO {

	private int mbd_id; // 회원약 시퀀스
	private int mb_id; // 회원 시퀀스
	private int dr_id; // 회원약 번호
	private String mbd_drug_name; // 회원약 이름
	private String mbd_drug_effect; // 회원약 효과
	private int mbd_writer_id; // 회원약 작성자
	private Date mbd_reg_date; // 회원약 작성일
	private String dr_sungsang;
	
//	private DrugDTO drug; // DrugDTO 전체를 포함

	public MyPageDrugDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MyPageDrugDTO(int mbd_id, int mb_id, int dr_id, String mbd_drug_name, String mbd_drug_effect,
			int mbd_writer_id, Date mbd_reg_date, String dr_sungsang) {
		super();
		this.mbd_id = mbd_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.mbd_drug_name = mbd_drug_name;
		this.mbd_drug_effect = mbd_drug_effect;
		this.mbd_writer_id = mbd_writer_id;
		this.mbd_reg_date = mbd_reg_date;
		this.dr_sungsang = dr_sungsang;
	}

	public int getMbd_id() {
		return mbd_id;
	}

	public void setMbd_id(int mbd_id) {
		this.mbd_id = mbd_id;
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

	public String getMbd_drug_name() {
		return mbd_drug_name;
	}

	public void setMbd_drug_name(String mbd_drug_name) {
		this.mbd_drug_name = mbd_drug_name;
	}

	public String getMbd_drug_effect() {
		return mbd_drug_effect;
	}

	public void setMbd_drug_effect(String mbd_drug_effect) {
		this.mbd_drug_effect = mbd_drug_effect;
	}

	public int getMbd_writer_id() {
		return mbd_writer_id;
	}

	public void setMbd_writer_id(int mbd_writer_id) {
		this.mbd_writer_id = mbd_writer_id;
	}

	public Date getMbd_reg_date() {
		return mbd_reg_date;
	}

	public void setMbd_reg_date(Date mbd_reg_date) {
		this.mbd_reg_date = mbd_reg_date;
	}

	public String getDr_sungsang() {
		return dr_sungsang;
	}

	public void setDr_sungsang(String dr_sungsang) {
		this.dr_sungsang = dr_sungsang;
	}

	@Override
	public String toString() {
		return "MyPageDrugDTO [mbd_id=" + mbd_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", mbd_drug_name="
				+ mbd_drug_name + ", mbd_drug_effect=" + mbd_drug_effect + ", mbd_writer_id=" + mbd_writer_id
				+ ", mbd_reg_date=" + mbd_reg_date + ", dr_sungsang=" + dr_sungsang + "]";
	}

}
