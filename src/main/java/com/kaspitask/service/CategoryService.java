package com.kaspitask.service;

import com.kaspitask.model.Category;

import java.util.List;

public interface CategoryService {
    Category findByName(String name);

    List<Category> findAll();
}
