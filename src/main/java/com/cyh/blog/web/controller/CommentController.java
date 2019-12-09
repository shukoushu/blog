package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.domain.User;
import com.cyh.blog.service.CommentService;
import com.cyh.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

import static org.springframework.data.domain.Sort.Direction.DESC;


@Controller
@RequestMapping("admin/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @Autowired
    PostService postService;

    @GetMapping
    public String comment(Model model,
                          @PageableDefault(direction = DESC) Pageable pageable){
        commentService.updateUnreadToHaveRead();
        final Page<Comment> comment = commentService.findComment(pageable);
        model.addAttribute("comments",comment);
        return "admin/admin_comment";
    }

    @PostMapping(value = "reply")
    @ResponseBody
    public boolean replyComment(@RequestParam("commentId") Long commentId,
                             @RequestParam("postId") Long postId,
                             @RequestParam("commentContent") String commentContent,
//                             @RequestParam("userAgent") String userAgent,
                             HttpServletRequest request,
                             HttpSession session){
        Post post = postService.findPostById(postId).orElse(new Post());

        User user = (User) session.getAttribute("userSession");

        Comment lastComment = commentService.findCommentById(commentId);

        Comment comment = new Comment();
        comment.setPost(post);
        comment.setCommentAuthor(user.getUserDisplayName());
        comment.setCommentDate(DateUtil.date());
        String lastContent = " //<a href='#comment-id-" + lastComment.getCommentId() + "'>@" + lastComment.getCommentAuthor() + "</a>:" + lastComment.getCommentContent();
        comment.setCommentContent(commentContent + lastContent);
//        comment.setCommentAgent(userAgent);
        comment.setCommentParent(commentId);
        comment.setIsAdmin(1);
        commentService.save(comment);

        return true;
    }

    @DeleteMapping("remove/{id}")
    @ResponseBody
    public boolean removeComment(@PathVariable("id") Long id ){
        commentService.removeComment(id);
        return true;
    }

    @GetMapping("read")
    @ResponseBody
    public int getNoRead(){
        return commentService.getNoReadNum().size();
    }

    @PostMapping("read")
    @ResponseBody
    public List<Comment> getNoReadComment(){
        return commentService.getNoReadNum();
    }
}
