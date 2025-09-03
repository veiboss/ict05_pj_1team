package com.middlepj.ict05.domain.mypage.myprofile.dto;

public class MyProfileDTO {

	// MBP_ID
	// MB_ID
	// MBS_ID
	// MBP_HEIGHT
	// MBP_WEIGHT
	// MBP_AGE
	// MBP_DISEASE
	// MBP_INT_PILL
	// MBP_WRITER_ID
	// MBP_REG_DATE
	// MBP_MODIFY_ID
	// MBP_MODIFY_DATE
	// MBP_GENDER
	// MBP_PILL_SCORE
	private int mb_id;
	private String mb_name; // session
	private String mb_email; // session
	private String mbp_gender;
	private int mbp_height;
	private int mbp_age;
	private int mbp_weight;
	private String mb_grade; // session

	public MyProfileDTO() {
		super();
	}

	public MyProfileDTO(int mb_id, String mb_name, String mb_email, String mbp_gender, int mbp_height, int mbp_age,
			int mbp_weight, String mb_grade) {
		super();
		this.mb_id = mb_id;
		this.mb_name = mb_name;
		this.mb_email = mb_email;
		this.mbp_gender = mbp_gender;
		this.mbp_height = mbp_height;
		this.mbp_age = mbp_age;
		this.mbp_weight = mbp_weight;
		this.mb_grade = mb_grade;
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

	public String getMbp_gender() {
		return mbp_gender;
	}

	public void setMbp_gender(String mbp_gender) {
		this.mbp_gender = mbp_gender;
	}

	public int getMbp_height() {
		return mbp_height;
	}

	public void setMbp_height(int mbp_height) {
		this.mbp_height = mbp_height;
	}

	public int getMbp_age() {
		return mbp_age;
	}

	public void setMbp_age(int mbp_age) {
		this.mbp_age = mbp_age;
	}

	public int getMbp_weight() {
		return mbp_weight;
	}

	public void setMbp_weight(int mbp_weight) {
		this.mbp_weight = mbp_weight;
	}

	public String getMb_grade() {
		return mb_grade;
	}

	public void setMb_grade(String mb_grade) {
		this.mb_grade = mb_grade;
	}

	@Override
	public String toString() {
		return "MyProfileDTO [mb_id=" + mb_id + ", mb_name=" + mb_name + ", mb_email=" + mb_email + ", mbp_gender="
				+ mbp_gender + ", mbp_height=" + mbp_height + ", mbp_age=" + mbp_age + ", mbp_weight=" + mbp_weight
				+ ", mb_grade=" + mb_grade + "]";
	}

}
