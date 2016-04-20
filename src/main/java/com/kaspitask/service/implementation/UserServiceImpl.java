package com.kaspitask.service.implementation;

import com.kaspitask.service.UserService;
import com.kaspitask.springdata.abstractrepository.UserRepository;
import com.kaspitask.springsecurity.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Transactional(readOnly = true)
    @Override
    public User findByUserName(String userName) {
        return userRepository.findByUserName(userName);
    }

    @Transactional(readOnly = true)
    @Override
    public User findById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public User save(User user) {
        return userRepository.save(user);
    }
}
