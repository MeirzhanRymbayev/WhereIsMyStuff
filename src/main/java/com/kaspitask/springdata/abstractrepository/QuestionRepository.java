package com.kaspitask.springdata.abstractrepository;

import com.kaspitask.model.Question;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuestionRepository extends CrudRepository<Question, Long> {

    @Query("select q from Question q")
    List<Question> findAllWithDetails();


}
