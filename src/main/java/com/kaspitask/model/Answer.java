package com.kaspitask.model;

import java.util.Date;

public class Answer {
    private long id;
    private String text;
    private Date dateOfAnswer;
    private User user;
    private Question question;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getDateOfAnswer() {
        return dateOfAnswer;
    }

    public void setDateOfAnswer(Date dateOfAnswer) {
        this.dateOfAnswer = dateOfAnswer;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Answer answer = (Answer) o;

        if (id != answer.id) return false;
        if (text != null ? !text.equals(answer.text) : answer.text != null) return false;
        if (dateOfAnswer != null ? !dateOfAnswer.equals(answer.dateOfAnswer) : answer.dateOfAnswer != null)
            return false;
        if (user != null ? !user.equals(answer.user) : answer.user != null) return false;
        return question != null ? question.equals(answer.question) : answer.question == null;

    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (text != null ? text.hashCode() : 0);
        result = 31 * result + (dateOfAnswer != null ? dateOfAnswer.hashCode() : 0);
        result = 31 * result + (user != null ? user.hashCode() : 0);
        result = 31 * result + (question != null ? question.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", dateOfAnswer=" + dateOfAnswer +
                ", user=" + user +
                ", question=" + question +
                '}';
    }
}
