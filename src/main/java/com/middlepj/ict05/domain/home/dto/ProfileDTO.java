package com.middlepj.ict05.domain.home.dto;

import java.sql.Date;

// 경욱
// 2025.08.25 MemberDTO 클래스 작성
// 2025.08.25 MemberDTO 클래스 작성 완료

//MBP_ID
//MB_ID
//MBS_ID
//MBP_HEIGHT
//MBP_WEIGHT
//MBP_AGE
//MBP_DISEASE
//MBP_INT_PILL
//MBP_WRITER_ID
//MBP_REG_DATE
//MBP_MODIFY_ID
//MBP_MODIFY_DATE
//MBP_GENDER
//MBP_PILL_SCORE
public class ProfileDTO {
	
	private int mbp_id;
	private int mb_id;
	private int mbs_id;
	private int mbp_height;
	private int mbp_weight;
	private int mbp_age;
	private String mbp_disease;
	private String mbp_int_pill;
	private int mbp_writer_id;
	private Date mbp_reg_date;
	private int mbp_modify_id;
	private Date mbp_modify_date;
	private String mbp_gender;
	private int mbp_pill_score;
	
	public ProfileDTO() {
		super();
	}

	public ProfileDTO(int mbp_id, int mb_id, int mbs_id, int mbp_height, int mbp_weight, int mbp_age, String mbp_disease,
			String mbp_int_pill, int mbp_writer_id, Date mbp_reg_date, int mbp_modify_id, Date mbp_modify_date,
			String mbp_gender, int mbp_pill_score) {
		super();
		this.mbp_id = mbp_id;
		this.mb_id = mb_id;
		this.mbs_id = mbs_id;
		this.mbp_height = mbp_height;
		this.mbp_weight = mbp_weight;
		this.mbp_age = mbp_age;
		this.mbp_disease = mbp_disease;
		this.mbp_int_pill = mbp_int_pill;
		this.mbp_writer_id = mbp_writer_id;
		this.mbp_reg_date = mbp_reg_date;
		this.mbp_modify_id = mbp_modify_id;
		this.mbp_modify_date = mbp_modify_date;
		this.mbp_gender = mbp_gender;
		this.mbp_pill_score = mbp_pill_score;
	}

	public int getMbp_id() {
		return mbp_id;
	}

	public void setMbp_id(int mbp_id) {
		this.mbp_id = mbp_id;
	}

	public int getMb_id() {
		return mb_id;
	}

	public void setMb_id(int mb_id) {
		this.mb_id = mb_id;
	}

	public int getMbs_id() {
		return mbs_id;
	}

	public void setMbs_id(int mbs_id) {
		this.mbs_id = mbs_id;
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

	public String getMbp_disease() {
		return mbp_disease;
	}

	public void setMbp_disease(String mbp_disease) {
		this.mbp_disease = mbp_disease;
	}

	public String getMbp_int_pill() {
		return mbp_int_pill;
	}

	public void setMbp_int_pill(String mbp_int_pill) {
		this.mbp_int_pill = mbp_int_pill;
	}

	public int getMbp_writer_id() {
		return mbp_writer_id;
	}

	public void setMbp_writer_id(int mbp_writer_id) {
		this.mbp_writer_id = mbp_writer_id;
	}

	public Date getMbp_reg_date() {
		return mbp_reg_date;
	}

	public void setMbp_reg_date(Date mbp_reg_date) {
		this.mbp_reg_date = mbp_reg_date;
	}

	public int getMbp_modify_id() {
		return mbp_modify_id;
	}

	public void setMbp_modify_id(int mbp_modify_id) {
		this.mbp_modify_id = mbp_modify_id;
	}

	public Date getMbp_modify_date() {
		return mbp_modify_date;
	}

	public void setMbp_modify_date(Date mbp_modify_date) {
		this.mbp_modify_date = mbp_modify_date;
	}

	public String getMbp_gender() {
		return mbp_gender;
	}

	public void setMbp_gender(String mbp_gender) {
		this.mbp_gender = mbp_gender;
	}

	public int getMbp_pill_score() {
		return mbp_pill_score;
	}

	public void setMbp_pill_score(int mbp_pill_score) {
		this.mbp_pill_score = mbp_pill_score;
	}

	@Override
	public String toString() {
		return "MemberDTO [mbp_id=" + mbp_id + ", mb_id=" + mb_id + ", mbs_id=" + mbs_id + ", mbp_height=" + mbp_height
				+ ", mbp_weight=" + mbp_weight + ", mbp_age=" + mbp_age + ", mbp_disease=" + mbp_disease
				+ ", mbp_int_pill=" + mbp_int_pill + ", mbp_writer_id=" + mbp_writer_id + ", mbp_reg_date="
				+ mbp_reg_date + ", mbp_modify_id=" + mbp_modify_id + ", mbp_modify_date=" + mbp_modify_date
				+ ", mbp_gender=" + mbp_gender + ", mbp_pill_score=" + mbp_pill_score + "]";
	}
	
	
	
}
