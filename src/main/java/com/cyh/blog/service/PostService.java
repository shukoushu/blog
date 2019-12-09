package com.cyh.blog.service;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.dto.Archive;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;
import java.util.Optional;

public interface PostService {

    List<Post> findPostLatest();

    void postSave(Post post);

    Page<Post> post(Pageable pageable);

    List<Archive> findAllByYearAndMonth();

    List<Post> findPostByYearAndMonth(String year, String month);

    Post findPostByPostUrl(String url);

    Optional<Post> findPostById(Long Id);

    void removeById(Long id);

    Optional<Post> getNextPost(Date postDate);

    Optional<Post> getPrePost(Date postDate);

    Page<Post> findByTagId(Long id,Pageable pageable);
}



