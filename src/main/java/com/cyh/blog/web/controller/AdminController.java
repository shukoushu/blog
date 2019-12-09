package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.cyh.blog.model.domain.Comment;
import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.domain.User;
import com.cyh.blog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.cyh.blog.model.enums.LogsRecordEnum.*;

@Controller
@RequestMapping(value="admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    @Autowired
    CommentService commentService;

    @Autowired
    PostService postService;

    @Autowired
    ImgService imgService;

    @Autowired
    LogsService logsService;

    @Autowired
    HttpServletRequest request;


    @GetMapping
    public String index(Model model){
        model.addAttribute("postCount",adminService.postCount());
        model.addAttribute("commentCount",commentService.commentCount());
        model.addAttribute("imageCount",imgService.imgCount());
        final List<Post> posts = postService.findPostLatest();
        final List<Comment> commentLatest = commentService.findCommentLatest();
        final List<Logs> logsLatest = logsService.findLogsLatest();
        model.addAttribute("comments",commentLatest);
        model.addAttribute("postTopFive",posts);
        model.addAttribute("logs",logsLatest);
        return "admin/admin_index";
    }

    @GetMapping(value = "login")
    public String login(){
        return "admin/admin_login";
    }

    @PostMapping(value = "login")
    @ResponseBody
    public String getlogin(String userName, String passWord, HttpSession session){
        final User user = userService.findUser();
        final String PassWord = user.getPassWord();
        String status=null;
        passWord= DigestUtil.md5Hex(passWord);
        if(passWord.equals(PassWord)){
            session.setAttribute("userSession",user);
            session.setMaxInactiveInterval(7*24*60*60);
            Logs log= new Logs(LOGIN.getRecord(),LOGIN_SUCCESS.getRecord(), ServletUtil.getClientIP(request), DateUtil.date());
            logsService.saveLog(log);
            status="true";
        }else{
            status="false";
        }
        return status;
    }

    @GetMapping(value = "loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("userSession");
        Logs log= new Logs(LOGOUT.getRecord(), LOGOUT.getRecord(), ServletUtil.getClientIP(request), DateUtil.date());
        logsService.saveLog(log);
        return "Redirect:admin";
    }
}
