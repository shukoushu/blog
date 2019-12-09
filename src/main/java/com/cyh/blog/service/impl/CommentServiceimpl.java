package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.repository.CommentRepository;
import com.cyh.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CommentServiceimpl implements CommentService {

    @Autowired
    CommentRepository commentRepository;

    @Override
    public long commentCount() { return  commentRepository.count(); }

    @Override
    public Page<Comment> findComment(Pageable pageable){
        final Page<Comment> comments = commentRepository.findAll(pageable);
        return comments;
    }

    @Override
    public void save(Comment comment) {
            commentRepository.save(comment);

    }

    @Override
    public Comment findCommentById(Long id) {
        return commentRepository.findCommentByCommentId(id);
    }

    @Override
    public void removeComment(Long id) {
        commentRepository.deleteById(id);
    }

    @Override
    public Page<Comment> findCommentByPost(Post post, Pageable pageable) {
        return commentRepository.findCommentsByPost(post,pageable);
    }

    @Override
    public List<Comment> findCommentLatest() {
        return commentRepository.findTopFive();
    }

    @Override
    public List<Comment> getNoReadNum() {
        return commentRepository.findNoReadNum();
    }

    @Override
    @Transactional
    public void updateUnreadToHaveRead() {
        commentRepository.updateUnreadtoHaveRead();
    }

}
