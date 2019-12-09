package com.cyh.blog.web.controller;

import cn.hutool.crypto.digest.DigestUtil;
import com.cyh.blog.model.domain.User;
import com.cyh.blog.service.UserService;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin/profile")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    Configuration configuration;

    @GetMapping
    public String profile() {
        return "admin/admin_profile";
    }

    @PostMapping("save")
    @ResponseBody
    public boolean updateProfile(User user, HttpSession session) {
        try {
            userService.saveUser(user);
            configuration.setSharedVariable("user",userService.findUser());
            session.invalidate();
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @PostMapping("changePass")
    @ResponseBody
    public boolean changePass(@ModelAttribute("beforePass") String beforePass,
                              @ModelAttribute("newPass") String newPass,
                              HttpSession session){
        try {
            final User user = userService.findUser();
            if (user.getPassWord().equals(DigestUtil.md5Hex(beforePass))){
                user.setPassWord(DigestUtil.md5Hex(newPass));
                configuration.setSharedVariable("user",userService.findUser());
                session.invalidate();
            }else {
                return false;
            }
        }catch (Exception e){
            return false;
        }
        return true;
    }
}


