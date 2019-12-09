package com.cyh.blog.model.freemaker;

import com.cyh.blog.model.domain.User;
import com.cyh.blog.service.UserService;
import freemarker.core.Environment;
import freemarker.template.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

@Component
public class UserImgTagDirective implements TemplateDirectiveModel {


    private static final String METHOD_KEY = "method";


    @Autowired
    UserService userService;

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        final DefaultObjectWrapperBuilder builder = new DefaultObjectWrapperBuilder(Configuration.VERSION_2_3_25);
        final User user = userService.findUser();
        env.setVariable("user", builder.build().wrap(user));
        body.render(env.getOut());
    }
}
