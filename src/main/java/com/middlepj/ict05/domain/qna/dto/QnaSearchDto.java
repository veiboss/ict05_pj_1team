package com.middlepj.ict05.domain.qna.dto;


public class QnaSearchDto {
    private String mode;
    private String s;
    private int start;
    private int end;

    public QnaSearchDto() {

    }

    public QnaSearchDto(String mode, String s, int start, int end) {
        this.mode = mode;
        this.s = s;
        this.start = start;
        this.end = end;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getS() {
        return s;
    }

    public void setS(String s) {
        this.s = s;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "QnaSearchDto{" +
                "mode='" + mode + '\'' +
                ", s='" + s + '\'' +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}
