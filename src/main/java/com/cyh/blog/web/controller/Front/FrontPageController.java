package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Page;
import com.cyh.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class FrontPageController {

    @Autowired
    PageService pageService;

    @GetMapping(value = "/p/{pageUrl}")
    public  String getPage(@PathVariable(value = "pageUrl") String pageUrl, Model model){
        final Page page =pageService.findByUrl(pageUrl);
        model.addAttribute("sheet",page);
        model.addAttribute("is_sheet",true);
        return "front/simple/sheet";
    }
}
