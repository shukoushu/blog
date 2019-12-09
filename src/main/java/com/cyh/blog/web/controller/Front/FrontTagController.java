package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.domain.Tag;

import com.cyh.blog.service.PostService;
import com.cyh.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;
import static org.springframework.data.domain.Sort.Direction.DESC;

@Controller
@RequestMapping("tags")
public class FrontTagController {

    @Autowired
    TagService tagService;

    @Autowired
    PostService postService;

    @GetMapping
    public String tags(Model model){
        model.addAttribute("is_tags",true);
        return "front/simple/tags";
    }

    @GetMapping("{tagUrl}")
    public String tagById(Model model,@PathVariable("tagUrl") String tagUrl){
        final Tag tag = tagService.findByUrl(tagUrl);
        model.addAttribute("tag",tag);
        model.addAttribute("is_tag",true);
        final Page<Post> posts = postService.findByTagId(tag.getTagId(), PageRequest.of(0, Integer.valueOf(OPTIONS.get("index_posts"))));
        model.addAttribute("posts",posts);
        model.addAttribute("rainbow",posts.getTotalPages());
        return "front/simple/tag";
    }

    @GetMapping("{tagUrl}/page/{page}")
    public String tags(Model model,@PathVariable("tagUrl") String tagUrl,
                       @PathVariable("page") Integer page,
                       @SortDefault(sort = "postDate", direction = DESC) Sort sort){
        final Pageable pageable = PageRequest.of(page - 1,Integer.valueOf(OPTIONS.get("index_posts")));
        final Tag tag = tagService.findByUrl(tagUrl);
        final Page<Post> posts = postService.findByTagId(tag.getTagId(), pageable);
        model.addAttribute("tag",tag);
        model.addAttribute("posts",posts);
        model.addAttribute("is_tag",true);
        model.addAttribute("rainbow",posts.getTotalPages());
        return "front/simple/tag";
    }


}
