package com.kaspitask.service.implementation;

import com.google.common.collect.Lists;
import com.kaspitask.model.Category;
import com.kaspitask.service.CategoryService;
import com.kaspitask.springdata.abstractrepository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    @Transactional(readOnly = true)
    @Override
    public Category findByName(String name) {
        return categoryRepository.findByName(name);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Category> findAll() {
        return Lists.newArrayList(categoryRepository.findAll());
    }
}
