package com.kaspitask.service.implementation;


import com.google.common.collect.Lists;
import com.kaspitask.model.Question;
import com.kaspitask.service.QuestionService;
import com.kaspitask.springdata.abstractrepository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@Service("questionService")
public class QuestionServiceImpl implements QuestionService {

    @Autowired
    QuestionRepository questionRepository;

    @Transactional(readOnly = true)
    @Override
    public List<Question> findAll() {
        return Lists.newArrayList(questionRepository.findAll());
    }

    @Override
    public List<Question> findAllWithDetails() {
        return questionRepository.findAllWithDetails();
    }

    @Override
    public Question save(Question question) {
        return questionRepository.save(question);
    }

    @Override
    public Question findById(Long id) {
        return questionRepository.findOne(id);
    }
}
