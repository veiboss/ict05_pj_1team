package com.middlepj.ict05.domain.drug.dto;

import java.sql.Date;

public class DrugReviewDTO {

	private int rv_id;				// 후기 시퀀스
	private int mb_id;				// 회원 시퀀스
	private int dr_id;				// 제약 시퀀스
	private String mb_name;			// 회원 이름
	private String rv_content;		// 후기 내용
	private int rv_rating;			// 후기 별점
	private char rv_show;			// 노출여부	
	private int rv_readCnt;			// 조회수
	private int rv_writerId;		// 후기 작성자 시퀀스
	private Date rv_regDate;		// 후기 작성일
	private int rv_modifyId;		// 후기 수정자 시퀀스
	private Date rv_modifyDate;		// 후기 수정일
	
	public DrugReviewDTO() {
		super();
	}

	public DrugReviewDTO(int rv_id, int mb_id, int dr_id, String mb_name, String rv_content, int rv_rating,
			char rv_show, int rv_readCnt, int rv_writerId, Date rv_regDate, int rv_modifyId, Date rv_modifyDate) {
		super();
		this.rv_id = rv_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.mb_name = mb_name;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_show = rv_show;
		this.rv_readCnt = rv_readCnt;
		this.rv_writerId = rv_writerId;
		this.rv_regDate = rv_regDate;
		this.rv_modifyId = rv_modifyId;
		this.rv_modifyDate = rv_modifyDate;
	}

	public int getRv_id() {
		return rv_id;
	}
	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
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

	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}

	public String getRv_content() {
		return rv_content;
	}
	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}

	public int getRv_rating() {
		return rv_rating;
	}
	public void setRv_rating(int rv_rating) {
		this.rv_rating = rv_rating;
	}

	public char getRv_show() {
		return rv_show;
	}
	public void setRv_show(char rv_show) {
		this.rv_show = rv_show;
	}

	public int getRv_readCnt() {
		return rv_readCnt;
	}
	public void setRv_readCnt(int rv_readCnt) {
		this.rv_readCnt = rv_readCnt;
	}

	public int getRv_writerId() {
		return rv_writerId;
	}
	public void setRv_writerId(int rv_writerId) {
		this.rv_writerId = rv_writerId;
	}

	public Date getRv_regDate() {
		return rv_regDate;
	}
	public void setRv_regDate(Date rv_regDate) {
		this.rv_regDate = rv_regDate;
	}

	public int getRv_modifyId() {
		return rv_modifyId;
	}
	public void setRv_modifyId(int rv_modifyId) {
		this.rv_modifyId = rv_modifyId;
	}

	public Date getRv_modifyDate() {
		return rv_modifyDate;
	}
	public void setRv_modifyDate(Date rv_modifyDate) {
		this.rv_modifyDate = rv_modifyDate;
	}

	@Override
	public String toString() {
		return "DrugReviewDTO [rv_id=" + rv_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", mb_name=" + mb_name
				+ ", rv_content=" + rv_content + ", rv_rating=" + rv_rating + ", rv_show=" + rv_show + ", rv_readCnt="
				+ rv_readCnt + ", rv_writerId=" + rv_writerId + ", rv_regDate=" + rv_regDate + ", rv_modifyId="
				+ rv_modifyId + ", rv_modifyDate=" + rv_modifyDate + "]";
	}
	
}

