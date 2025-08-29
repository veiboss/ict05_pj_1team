package com.middlepj.ict05.domain.home.dto;

// 경욱
// 2025.08.25 RuleDTO 클래스 작성
// 2025.08.25 RuleDTO 클래스 작성완료

//RULE_ID
//RULE_AGE
//RULE_INTEREST
//RULE_DISEASE
//RULE_RECOMMEND
//RULE_PILL_SCORE
public class RuleDTO {

	private int rule_id;
	private int rule_age;
	private String rule_interest;
	private String rule_disease;
	private String rule_recommend;
	private int rule_pill_score;
	
	public RuleDTO() {
		super();
	}

	public RuleDTO(int rule_id, int rule_age, String rule_interest, String rule_disease, String rule_recommend,
			int rule_pill_score) {
		super();
		this.rule_id = rule_id;
		this.rule_age = rule_age;
		this.rule_interest = rule_interest;
		this.rule_disease = rule_disease;
		this.rule_recommend = rule_recommend;
		this.rule_pill_score = rule_pill_score;
	}

	public int getRule_id() {
		return rule_id;
	}

	public void setRule_id(int rule_id) {
		this.rule_id = rule_id;
	}

	public int getRule_age() {
		return rule_age;
	}

	public void setRule_age(int rule_age) {
		this.rule_age = rule_age;
	}

	public String getRule_interest() {
		return rule_interest;
	}

	public void setRule_interest(String rule_interest) {
		this.rule_interest = rule_interest;
	}

	public String getRule_disease() {
		return rule_disease;
	}

	public void setRule_disease(String rule_disease) {
		this.rule_disease = rule_disease;
	}

	public String getRule_recommend() {
		return rule_recommend;
	}

	public void setRule_recommend(String rule_recommend) {
		this.rule_recommend = rule_recommend;
	}

	public int getRule_pill_score() {
		return rule_pill_score;
	}

	public void setRule_pill_score(int rule_pill_score) {
		this.rule_pill_score = rule_pill_score;
	}

	@Override
	public String toString() {
		return "RuleDTO [rule_id=" + rule_id + ", rule_age=" + rule_age + ", rule_interest=" + rule_interest
				+ ", rule_disease=" + rule_disease + ", rule_recommend=" + rule_recommend + ", rule_pill_score="
				+ rule_pill_score + "]";
	}
	
	
}
