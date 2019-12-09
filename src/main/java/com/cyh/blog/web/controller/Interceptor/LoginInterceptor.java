package com.cyh.blog.web.controller.Interceptor;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class LoginInterceptor implements HandlerInterceptor {
     public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
         Object obj=request.getSession().getAttribute("userSession");
         if(null!=obj){
             return true;
         }else{
             response.sendRedirect("/admin/login");
             return false;
         }
    }

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    }

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }
}
