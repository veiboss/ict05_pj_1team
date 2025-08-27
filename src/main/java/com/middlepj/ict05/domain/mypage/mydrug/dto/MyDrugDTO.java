package com.middlepj.ict05.domain.mypage.mydrug.dto;

public class MyDrugDTO {
	private String mbp_int_pill;	// 회원 관심약

	public MyDrugDTO() {
		super();
	}

	public MyDrugDTO(String mbp_int_pill) {
		super();
		this.mbp_int_pill = mbp_int_pill;
	}

	public String getMbp_int_pill() {
		return mbp_int_pill;
	}

	public void setMbp_int_pill(String mbp_int_pill) {
		this.mbp_int_pill = mbp_int_pill;
	}

	@Override
	public String toString() {
		return "MyDrugDTO [mbp_int_pill=" + mbp_int_pill + "]";
	}

}
