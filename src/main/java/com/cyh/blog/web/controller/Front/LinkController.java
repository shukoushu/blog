package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Link;
import com.cyh.blog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("links")
public class LinkController {

    @Autowired
    LinkService linkService;

    @GetMapping
    public String getLink(Model model){
        final List<Link> links = linkService.findAll();
        model.addAttribute("links",links);
        return "front/simple/links";
    }
}
