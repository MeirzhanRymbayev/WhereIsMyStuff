package com.kaspitask.springdata.abstractrepository;

import com.kaspitask.model.Category;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepository extends CrudRepository<Category, Long> {
    Category findByName(String name);
}
