package com.middlepj.ict05.domain.mypage.myprofile.dto;

public class MyProfileDTO {
	private String mbp_email; // 회원 이메일
	private String mbp_name; // 회원 이름
	private String mbp_gender; // 회원 성별
	private int mbp_height; // 회원 키
	private int mbp_weight; // 회원 몸무게
	private int mbp_age; // 회원 나이

	public MyProfileDTO(String mbp_email, String mbp_name, String mbp_gender, int mbp_height, int mbp_weight,
			int mbp_age) {
		super();
		this.mbp_email = mbp_email;
		this.mbp_name = mbp_name;
		this.mbp_gender = mbp_gender;
		this.mbp_height = mbp_height;
		this.mbp_weight = mbp_weight;
		this.mbp_age = mbp_age;
	}

	public MyProfileDTO() {
		super();
	}

	public String getMbp_email() {
		return mbp_email;
	}

	public void setMbp_email(String mbp_email) {
		this.mbp_email = mbp_email;
	}

	public String getMbp_name() {
		return mbp_name;
	}

	public void setMbp_name(String mbp_name) {
		this.mbp_name = mbp_name;
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

	public int getMbp_weight() {
		return mbp_weight;
	}

	public void setMbp_weight(int mbp_weight) {
		this.mbp_weight = mbp_weight;
	}

	public int getMbp_age() {
		return mbp_age;
	}

	public void setMbp_age(int mbp_age) {
		this.mbp_age = mbp_age;
	}

	@Override
	public String toString() {
		return "MyProfileDTO [mbp_email=" + mbp_email + ", mbp_name=" + mbp_name + ", mbp_gender=" + mbp_gender
				+ ", mbp_height=" + mbp_height + ", mbp_weight=" + mbp_weight + ", mbp_age=" + mbp_age + "]";
	}

}
