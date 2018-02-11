package org.java.pojo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SecurityInfo implements Serializable {
    private Integer sid;

    private String question;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question == null ? null : question.trim();
    }
}