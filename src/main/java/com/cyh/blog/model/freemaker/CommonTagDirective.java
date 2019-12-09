package com.cyh.blog.model.freemaker;

import com.cyh.blog.service.ImgService;
import com.cyh.blog.service.MenuService;
import com.cyh.blog.service.PostService;
import com.cyh.blog.service.TagService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;


@Component
public class CommonTagDirective implements TemplateDirectiveModel {

    private static final String METHOD_KEY = "method";

    @Autowired
    MenuService menuService;
    @Autowired
    PostService postService;
    @Autowired
    ImgService imgService;
    @Autowired
    TagService tagService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        final DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        env.setVariable("menus", builder.build().wrap(menuService.findAllMenu()));
        env.setVariable("archives", builder.build().wrap(postService.findAllByYearAndMonth()));
        env.setVariable("img", builder.build().wrap(imgService.findAll()));
        env.setVariable("tags", builder.build().wrap(tagService.getTag()));
        body.render(env.getOut());
    }
}
