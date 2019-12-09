package com.cyh.blog.service;

import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CommentService {

    long commentCount();

    Page<Comment> findComment(Pageable pageable);

    void save(Comment comment);
    Comment findCommentById(Long id);

    void removeComment(Long id);

    Page<Comment> findCommentByPost(Post post,Pageable pageable);

    List<Comment> findCommentLatest();

    List<Comment> getNoReadNum();

    void updateUnreadToHaveRead();
}
