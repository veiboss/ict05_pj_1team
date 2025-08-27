package com.middlepj.ict05.domain.faq.dto;

import java.util.List;

import com.middlepj.ict05.common.Paging;

public class FaqList {
	
	private List<FaqDTO> faqList;
	private Paging paging;
	
	public FaqList() {
		super();
	}

	public FaqList(List<FaqDTO> faqList, Paging paging) {
		super();
		this.faqList = faqList;
		this.paging = paging;
	}

	public List<FaqDTO> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<FaqDTO> faqList) {
		this.faqList = faqList;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	@Override
	public String toString() {
		return "FaqList [faqList=" + faqList + ", paging=" + paging + "]";
	}
	
	

}
