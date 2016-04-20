package com.kaspitask.service;

import com.kaspitask.springsecurity.model.User;

public interface UserService {

    User findById(Long id);

    User findByUserName(String UserName);

    User save(User user);
}
