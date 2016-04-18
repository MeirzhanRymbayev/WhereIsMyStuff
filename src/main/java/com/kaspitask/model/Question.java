package com.kaspitask.model;

import java.util.Date;

public class Question {
    private long id;
    private String title;
    private String description;
    private Date dateOfQuestion;
    private User user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDateOfQuestion() {
        return dateOfQuestion;
    }

    public void setDateOfQuestion(Date dateOfQuestion) {
        this.dateOfQuestion = dateOfQuestion;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Question question = (Question) o;

        if (id != question.id) return false;
        if (title != null ? !title.equals(question.title) : question.title != null) return false;
        if (description != null ? !description.equals(question.description) : question.description != null)
            return false;
        return dateOfQuestion != null ? dateOfQuestion.equals(question.dateOfQuestion) : question.dateOfQuestion == null;

    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (dateOfQuestion != null ? dateOfQuestion.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Question{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", dateOfQuestion=" + dateOfQuestion +
                '}';
    }
}
