package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.User;
import com.cyh.blog.repository.UserRepository;
import com.cyh.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceimpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Override
    public void saveUser(User user) {
            userRepository.save(user);
        }

        @Override

        public User findUser() {
            final List<User> users = userRepository.findAll();
            if (!users.isEmpty()){
                User user=users.get(0);
                return user;
            }else {
                return new User();
            }

        }

    @Override
    public void changePass(User user) {

    }

}
