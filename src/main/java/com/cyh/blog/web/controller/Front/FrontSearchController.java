package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;

@Controller
@RequestMapping("search")
public class FrontSearchController {

    @Autowired
    SearchService searchService;

    @GetMapping
    public String search(Model model,String keyword){
        return this.search(model,keyword,1);

    }

    @GetMapping("page/{page}")
    public String search(Model model,String keyword,@PathVariable("page") Integer page){
        final Pageable pageable = PageRequest.of(page-1, Integer.parseInt(OPTIONS.get("index_comments")));
        final Page<Post> posts = searchService.findPostByKeyword("%"+keyword+"%", pageable);
        model.addAttribute("posts",posts);
        model.addAttribute("rainbow",posts.getTotalPages());
        model.addAttribute("keyword",keyword);
        model.addAttribute("is_search",true);
        return "front/simple/search";
    }

}
