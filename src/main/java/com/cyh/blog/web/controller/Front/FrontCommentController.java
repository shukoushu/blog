package com.cyh.blog.web.controller.Front;

import cn.hutool.core.date.DateUtil;
import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.service.CommentService;
import com.cyh.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

@Controller
public class FrontCommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    PostService postService;

    @PostMapping("newComment")
    @ResponseBody
    public Boolean newComment(Long postId,
                              String commentContent,
                              String commentAuthor,
                              Long commentParent) {
        try {
            Optional<Post> postById = postService.findPostById(postId);
            Comment comment = new Comment();
            comment.setCommentDate(DateUtil.date());
            comment.setIsAdmin(0);
            comment.setCommentAuthor(commentAuthor);
            comment.setCommentParent(commentParent);
            comment.setPost(postById.get());
            Comment lastComment = commentService.findCommentById(comment.getCommentParent());
            if (lastComment != null) {
                String lastContent = " //<a href='#comment-id-" + lastComment.getCommentId() + "'>@" + lastComment.getCommentAuthor() + "</a>:" + lastComment.getCommentContent();
                String commentContent1 = commentContent.substring(commentContent.indexOf(":") + 1);
                comment.setCommentContent(commentContent1 + lastContent);
            } else {
                comment.setCommentContent(commentContent);
            }
            commentService.save(comment);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

}
