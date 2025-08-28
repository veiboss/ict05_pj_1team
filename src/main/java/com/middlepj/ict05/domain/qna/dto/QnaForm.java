package com.middlepj.ict05.domain.qna.dto;

public class QnaForm {
	private String qa_title;
	private String qa_content;
	private String qa_private;
	private String qa_show;
	
	public QnaForm() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaForm(String qa_title, String qa_content, String qa_private, String qa_show) {
		super();
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_private = qa_private;
		this.qa_show = qa_show;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public String getQa_private() {
		return qa_private;
	}

	public void setQa_private(String qa_private) {
		this.qa_private = qa_private;
	}

	public String getQa_show() {
		return qa_show;
	}

	public void setQa_show(String qa_show) {
		this.qa_show = qa_show;
	}

	@Override
	public String toString() {
		return "QnaForm [qa_title=" + qa_title + ", qa_content=" + qa_content + ", qa_private=" + qa_private
				+ ", qa_show=" + qa_show + "]";
	}
	
	
}
