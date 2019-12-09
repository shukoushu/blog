package com.cyh.blog.service;

import com.cyh.blog.model.domain.User;

public interface UserService {

    void saveUser(User user);
    User findUser();
    void changePass(User user);
}
