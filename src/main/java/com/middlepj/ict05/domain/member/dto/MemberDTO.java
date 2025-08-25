package com.middlepj.ict05.domain.user;

import java.sql.Date;		// java.sql

// DTO(Data Transfer Object) = VO(Value Object)
public class userDTO {

	private String mb_id;
	private String mb_name;
	private String mb_email;
	private Date mb_password;
	private String mb_grade;

	public userDTO() {
		super();
	}

	public userDTO(String mb_id, String mb_name, String mb_email, Date mb_password, String mb_grade) {
		super();
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mb_password = mb_password;
		this.mb_grade = mb_grade;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
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

	public Date getMb_password() {
		return mb_password;
	}

	public void setMb_password(Date mb_password) {
		this.mb_password = mb_password;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	@Override
	public String toString() {
		return "userDTO [mb_id=" + mb_id + ", mb_name=" + mb_name + ", mb_email=" + mb_email + ", mb_password="
				+ mb_password + ", mb_grade=" + mb_grade + "]";
	}



}
