package com.middlepj.ict05.domain.qna.dto;

import java.sql.Date;

public class QnaAnswer {

    private Integer qa_id;
    private Integer mb_id;
    private String qa_answer;
    private Date qa_answer_date;

    public QnaAnswer() {
    }

    public QnaAnswer(Integer qa_id, Integer mb_id, String qa_answer, Date qa_answer_date) {
        this.qa_id = qa_id;
        this.mb_id = mb_id;
        this.qa_answer = qa_answer;
        this.qa_answer_date = qa_answer_date;
    }

    public Integer getQa_id() {
        return qa_id;
    }

    public void setQa_id(Integer qa_id) {
        this.qa_id = qa_id;
    }

    public Integer getMb_id() {
        return mb_id;
    }

    public void setMb_id(Integer mb_id) {
        this.mb_id = mb_id;
    }

    public String getQa_answer() {
        return qa_answer;
    }

    public void setQa_answer(String qa_answer) {
        this.qa_answer = qa_answer;
    }

    public Date getQa_answer_date() {
        return qa_answer_date;
    }

    public void setQa_answer_date(Date qa_answer_date) {
        this.qa_answer_date = qa_answer_date;
    }

    @Override
    public String toString() {
        return "QnaAnswer{" +
                "qa_id=" + qa_id +
                ", mb_id=" + mb_id +
                ", qa_answer='" + qa_answer + '\'' +
                ", qa_answer_date=" + qa_answer_date +
                '}';
    }

}
