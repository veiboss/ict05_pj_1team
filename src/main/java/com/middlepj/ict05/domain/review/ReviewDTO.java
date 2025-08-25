package com.middlepj.ict05.domain.review;

import java.util.Date;

public class ReviewDTO {

	private int rv_id;				// 후시 시퀀스(PK)
	private int mb_id;				// 회원 시퀀스(FK)
	private String dr_id;			// 약 시퀀스(FK)
	private String mb_name;			// 회원 이름
	private String rv_content;		// 후기 내용
	private int rv_rating;			// 후기 별점
	private char rv_show;			// 노출 여부
	private int rv_readcount;		// 조회수
	private int rv_writer_id;		// 작성자
	private Date rv_reg_date;		// 작성일
	private int rv_modify_id;		// 수정자
	private Date rv_modify_date;	// 수정일
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int rv_id, int mb_id, String dr_id, String mb_name, String rv_content, int rv_rating,
			char rv_show, int rv_readcount, int rv_writer_id, Date rv_reg_date, int rv_modify_id,
			Date rv_modify_date) {
		super();
		this.rv_id = rv_id;
		this.mb_id = mb_id;
		this.dr_id = dr_id;
		this.mb_name = mb_name;
		this.rv_content = rv_content;
		this.rv_rating = rv_rating;
		this.rv_show = rv_show;
		this.rv_readcount = rv_readcount;
		this.rv_writer_id = rv_writer_id;
		this.rv_reg_date = rv_reg_date;
		this.rv_modify_id = rv_modify_id;
		this.rv_modify_date = rv_modify_date;
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

	public String getDr_id() {
		return dr_id;
	}

	public void setDr_id(String dr_id) {
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

	public int getRv_readcount() {
		return rv_readcount;
	}

	public void setRv_readcount(int rv_readcount) {
		this.rv_readcount = rv_readcount;
	}

	public int getRv_writer_id() {
		return rv_writer_id;
	}

	public void setRv_writer_id(int rv_writer_id) {
		this.rv_writer_id = rv_writer_id;
	}

	public Date getRv_reg_date() {
		return rv_reg_date;
	}

	public void setRv_reg_date(Date rv_reg_date) {
		this.rv_reg_date = rv_reg_date;
	}

	public int getRv_modify_id() {
		return rv_modify_id;
	}

	public void setRv_modify_id(int rv_modify_id) {
		this.rv_modify_id = rv_modify_id;
	}

	public Date getRv_modify_date() {
		return rv_modify_date;
	}

	public void setRv_modify_date(Date rv_modify_date) {
		this.rv_modify_date = rv_modify_date;
	}

	@Override
	public String toString() {
		return "MyReviewDTO [rv_id=" + rv_id + ", mb_id=" + mb_id + ", dr_id=" + dr_id + ", mb_name=" + mb_name
				+ ", rv_content=" + rv_content + ", rv_rating=" + rv_rating + ", rv_show=" + rv_show + ", rv_readcount="
				+ rv_readcount + ", rv_writer_id=" + rv_writer_id + ", rv_reg_date=" + rv_reg_date + ", rv_modify_id="
				+ rv_modify_id + ", rv_modify_date=" + rv_modify_date + "]";
	}
	
}


