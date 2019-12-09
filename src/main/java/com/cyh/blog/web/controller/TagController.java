package com.cyh.blog.web.controller;

import com.cyh.blog.model.domain.Tag;
import com.cyh.blog.service.TagService;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("admin/tag")
public class TagController {

    @Autowired
    TagService tagService;

    @Autowired
    Configuration configuration;

    @GetMapping()
    public String tag(){
        return "admin/admin_tag";
    }

    @PostMapping("save")
    public String saveTag(Tag tag){
        tagService.saveTag(tag);
        return "redirect:/admin/tag";
    }

    @GetMapping("edit")
    public String editTag(Model model,Long tagId){
        final Tag update = tagService.findById(tagId);
        model.addAttribute("updateTag",update);
        return "admin/admin_tag";
    }

    @GetMapping("checkUrl")
    @ResponseBody
    public Boolean checkUrl(String tagUrl, String tagName){
        final Tag tag = tagService.findByUrlOrName(tagUrl,tagName);
        if(tag != null){
            return false;
        }
        return true;
    }

    @PostMapping("remove")
    @ResponseBody
    public Boolean removeTag(Long tagId){
        try {
            tagService.remove(tagId);
        }catch (Exception e){
            return  false;
        }
        return true;
    }
}
