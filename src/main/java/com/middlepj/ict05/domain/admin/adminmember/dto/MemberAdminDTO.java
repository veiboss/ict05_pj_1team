package com.middlepj.ict05.domain.admin.adminmember.dto;

import java.sql.Date;

// DTO(Data Transfer Object) = VO(Value Object)
public class MemberAdminDTO {

	private int mb_id;
	private String mb_name;
	private String mb_email;
	private String mb_password;
	private String mb_grade;
	private Date mb_reg_date;

	public MemberAdminDTO() {
		super();
	}

	public MemberAdminDTO(int mb_id, String mb_name, String mb_email, String mb_password, String mb_grade, Date mb_reg_date) {
		super();
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_password = mb_password;
		this.mb_grade = mb_grade;
		this.mb_reg_date = mb_reg_date;
	}

	public int getMb_id() {
		return mb_id;
	}

	public void setMb_id(int mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_name() {
		return mb_name;
	}

	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getMb_email() {
		return mb_email;
	}

	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}

	public String getMb_password() {
		return mb_password;
	}

	public void setMb_password(String mb_password) {
		this.mb_password = mb_password;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	public Date getMb_reg_date() {
		return mb_reg_date;
	}

	public void setMb_reg_date(Date mb_reg_date) {
		this.mb_reg_date = mb_reg_date;
	}

	@Override
	public String toString() {
		return "MemberDTO [mb_id=" + mb_id + ", mb_name=" + mb_name + ", mb_email=" + mb_email + ", mb_password="
				+ mb_password + ", mb_grade=" + mb_grade + ", mb_reg_date=" + mb_reg_date + "]";
	}



}
