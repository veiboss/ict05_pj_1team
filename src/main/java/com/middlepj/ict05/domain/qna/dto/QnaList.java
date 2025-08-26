package com.middlepj.ict05.domain.qna.dto;

import com.middlepj.ict05.common.Paging;

import java.util.List;

public class QnaList {
    private List<QnaDto> qnaList;
    private Paging paging;

    public QnaList() {
    }

    public QnaList(List<QnaDto> qnaList, Paging paging) {
        this.qnaList = qnaList;
        this.paging = paging;
    }

    public List<QnaDto> getQnaList() {
        return qnaList;
    }

    public void setQnaList(List<QnaDto> qnaList) {
        this.qnaList = qnaList;
    }

    public Paging getPaging() {
        return paging;
    }

    public void setPaging(Paging paging) {
        this.paging = paging;
    }

    @Override
    public String toString() {
        return "QnaList{" +
                "qnaList=" + qnaList +
                ", paging=" + paging +
                '}';
    }
}
