package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.crypto.digest.DigestUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.cyh.blog.model.domain.*;
import com.cyh.blog.service.*;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;
import static com.cyh.blog.model.enums.LogsRecordEnum.REGISTER;

@Controller
@RequestMapping("admin")
public class RegisterController {

    @Autowired
    UserService userService;

    @Autowired
    MenuService menuService;

    @Autowired
    PostService postService;

    @Autowired
    Configuration configuration;

    @Autowired
    CommentService commentService;

    @Autowired
    OptionsService optionsService;

    @Autowired
    LogsService logsService;


    @GetMapping("register")
    public String register(){
        if(StrUtil.equals("true", OPTIONS.get("is_install"))){
            return "Redirect:admin";
        }
        return "admin/admin_register";
    }

    @PostMapping("register/save")
    @ResponseBody
    public boolean saveRegister(User user, HttpServletRequest request){

        try {
            if(user!=null) {
                user.setPassWord(DigestUtil.md5Hex(user.getPassWord()));
                userService.saveUser(user);
                final Menu menuIndex = new Menu();
                menuIndex.setMenuName("首页");
                menuIndex.setMenuUrl("/");
                menuIndex.setMenuSort(1);
                menuService.saveMenu(menuIndex);

                final Menu menuArchive = new Menu();
                menuArchive.setMenuName("归档");
                menuArchive.setMenuUrl("/archives");
                menuArchive.setMenuSort(2);
                menuService.saveMenu(menuArchive);

                Post firstpost = new Post();
                Date datename = new Date();
                java.sql.Date sqldate = new java.sql.Date(datename.getTime());
                firstpost.setPostDate(sqldate);
                firstpost.setPostUrl("First Blog");
                firstpost.setPostContent("<p>第一篇blog</p>");
                firstpost.setPostContentMd("第一篇blog");
                firstpost.setPostTitle("First Blog");
                firstpost.setPostSummary("第一篇blog");
                postService.postSave(firstpost);


                Comment firstcomment = new Comment();
                firstcomment.setCommentAuthor("admin");
                firstcomment.setCommentContent("第一条评论");
                firstcomment.setCommentDate(sqldate);
                firstcomment.setPost(firstpost);
                firstcomment.setIsAdmin(0);
                commentService.save(firstcomment);


                final Map<String,String> options = new HashMap<>();
                options.put("is_install","true");
                optionsService.saveOptions(options);
                configuration.setSharedVariable("user",userService.findUser());
                if (options != null && !options.isEmpty()) {
                    OPTIONS = options;
                }
                }
            Logs logs = new Logs(REGISTER.getRecord(),"注册成功", ServletUtil.getClientIP(request), DateUtil.date());
            logsService.saveLog(logs);
            }catch(Exception e){
                return false;
            }
            return true;
        }
    }
