package com.middlepj.ict05.domain.faq.dto;

import java.util.List;

import com.middlepj.ict05.common.Paging;

public class FaqList {

	private List<FaqDTO> faqList;
	private List<FaqUserDTO> faqUserList;
	private Paging paging;

	public FaqList() {
		super();
	}

	public FaqList(List<FaqDTO> faqList, List<FaqUserDTO> faqUserList, Paging paging) {
		super();
		this.faqList = faqList;
		this.faqUserList = faqUserList;
		this.paging = paging;
	}

	public List<FaqDTO> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<FaqDTO> faqList) {
		this.faqList = faqList;
	}

	public List<FaqUserDTO> getFaqUserList() {
		return faqUserList;
	}

	public void setFaqUserList(List<FaqUserDTO> faqUserList) {
		this.faqUserList = faqUserList;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	@Override
	public String toString() {
		return "FaqList [faqList=" + faqList + ", faqUserList=" + faqUserList + ", paging=" + paging + "]";
	}

}
