package com.cyh.blog.service;

import com.cyh.blog.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SearchService {

    Page<Post> findPostByKeyword(String keyword, Pageable pageable);
}
