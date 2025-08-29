package com.middlepj.ict05.domain.mypage.mypagesurvey.dto;

import java.sql.Date;

// 경욱
// 2025.08.25 MypageSurveyDTO 클래스 작성
// 2025.08.25 MypageSurveyDTO 클래스 작성완료

//MBS_ID
//MB_ID
//MBS_SCORE
//MBS_SERVEY_DATE
//MBS_WRITER_ID
//MBS_REG_DATE
//MBS_MODIFY_ID
//MBS_MODIFY_DATE
public class MypageSurveyDTO {

	private int mbs_id;
	private int mb_id;
	private int mbs_score;
	private Date mbs_servey_date;
	private int mbs_writer_id;
	private Date mbs_reg_date;
	private int mbs_modify_id;
	private Date mbs_modify_date;
	
	public MypageSurveyDTO() {
		super();
	}

	public MypageSurveyDTO(int mbs_id, int mb_id, int mbs_score, Date mbs_servey_date, int mbs_writer_id,
			Date mbs_reg_date, int mbs_modify_id, Date mbs_modify_date) {
		super();
		this.mbs_id = mbs_id;
		this.mb_id = mb_id;
		this.mbs_score = mbs_score;
		this.mbs_servey_date = mbs_servey_date;
		this.mbs_writer_id = mbs_writer_id;
		this.mbs_reg_date = mbs_reg_date;
		this.mbs_modify_id = mbs_modify_id;
		this.mbs_modify_date = mbs_modify_date;
	}

	public int getMbs_id() {
		return mbs_id;
	}

	public void setMbs_id(int mbs_id) {
		this.mbs_id = mbs_id;
	}

	public int getMb_id() {
		return mb_id;
	}

	public void setMb_id(int mb_id) {
		this.mb_id = mb_id;
	}

	public int getMbs_score() {
		return mbs_score;
	}

	public void setMbs_score(int mbs_score) {
		this.mbs_score = mbs_score;
	}

	public Date getMbs_servey_date() {
		return mbs_servey_date;
	}

	public void setMbs_servey_date(Date mbs_servey_date) {
		this.mbs_servey_date = mbs_servey_date;
	}

	public int getMbs_writer_id() {
		return mbs_writer_id;
	}

	public void setMbs_writer_id(int mbs_writer_id) {
		this.mbs_writer_id = mbs_writer_id;
	}

	public Date getMbs_reg_date() {
		return mbs_reg_date;
	}

	public void setMbs_reg_date(Date mbs_reg_date) {
		this.mbs_reg_date = mbs_reg_date;
	}

	public int getMbs_modify_id() {
		return mbs_modify_id;
	}

	public void setMbs_modify_id(int mbs_modify_id) {
		this.mbs_modify_id = mbs_modify_id;
	}

	public Date getMbs_modify_date() {
		return mbs_modify_date;
	}

	public void setMbs_modify_date(Date mbs_modify_date) {
		this.mbs_modify_date = mbs_modify_date;
	}

	@Override
	public String toString() {
		return "MypageSurveyDTO [mbs_id=" + mbs_id + ", mb_id=" + mb_id + ", mbs_score=" + mbs_score
				+ ", mbs_servey_date=" + mbs_servey_date + ", mbs_writer_id=" + mbs_writer_id + ", mbs_reg_date="
				+ mbs_reg_date + ", mbs_modify_id=" + mbs_modify_id + ", mbs_modify_date=" + mbs_modify_date + "]";
	}
	
	
	
}
