package com.kaspitask.service;

import com.kaspitask.model.Question;

import java.util.List;

public interface QuestionService {
    List<Question> findAll();

    List<Question> findAllWithDetails();

    Question save(Question question);

    Question findById(Long id);
}
