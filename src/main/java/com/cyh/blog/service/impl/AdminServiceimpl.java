package com.cyh.blog.service.impl;

import com.cyh.blog.repository.PostRepository;
import com.cyh.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceimpl implements AdminService {

    @Autowired
    PostRepository  postRepository;

    @Override
    public long postCount() {
        return postRepository.count();
    }
}
