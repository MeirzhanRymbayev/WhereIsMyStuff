package com.kaspitask.model;

import com.kaspitask.springsecurity.model.User;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "answer")
public class Answer {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "TEXT")
    private String text;

    @Column(name = "DATE_OF_ANSWER")
    private Date dateOfAnswer;

    @ManyToOne
    @JoinColumn(name = "USER_ID")
    private User user;

    @ManyToOne
    @JoinColumn(name = "QUESTION_ID")
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
