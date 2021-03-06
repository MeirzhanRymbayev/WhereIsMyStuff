package com.kaspitask.springdata.abstractrepository;

import com.kaspitask.springsecurity.model.User;
import org.springframework.data.repository.CrudRepository;


public interface UserRepository extends CrudRepository<User, Long> {

    User findById(Long id);

    User findByUserName(String userName);

}
