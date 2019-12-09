package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.repository.PostRepository;
import com.cyh.blog.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class SearchServiceimpl implements SearchService {

    @Autowired
    PostRepository postRepository;

    @Override
    public Page<Post> findPostByKeyword(String keyword, Pageable pageable) {
        return postRepository.findByPostTitleLikeOrPostContentLike(keyword,keyword,pageable);
    }
}
