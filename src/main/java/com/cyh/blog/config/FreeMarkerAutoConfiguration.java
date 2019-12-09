package com.cyh.blog.config;

import com.cyh.blog.model.freemaker.CommonTagDirective;
import com.cyh.blog.model.freemaker.UserImgTagDirective;
import com.cyh.blog.service.*;
import freemarker.template.TemplateModelException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class FreeMarkerAutoConfiguration {

    @Autowired
    freemarker.template.Configuration configuration;

    @Autowired
    UserImgTagDirective userImgTagDirective;

    @Autowired
    CommonTagDirective commonTagDirective;

    @Autowired
    UserService userService;

    @Autowired
    PageService pageService;

    @Autowired
    ImgService imgService;

    @Autowired
    OptionsService optionsService;

    @Autowired
    CommentService commentService;

    @PostConstruct
    public void setSharedVariable() {
        configuration.setSharedVariable("commonTag",commonTagDirective);
        configuration.setSharedVariable("userTag", userImgTagDirective);
        try {
            configuration.setSharedVariable("newComments",commentService.getNoReadNum());
            configuration.setSharedVariable("options",optionsService.findAllOptions());
            configuration.setSharedVariable("user",userService.findUser());

        } catch (TemplateModelException e) {
            e.printStackTrace();
        }

    }
}
