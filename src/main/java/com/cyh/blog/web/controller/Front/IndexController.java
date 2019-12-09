package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.service.PostService;
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
@RequestMapping(value = {"/", "index"})
public class IndexController {

    @Autowired
    PostService postService;

    @GetMapping
    public String index(Model model){
        return this.index(model, 1, Sort.by(DESC, "postDate"));
    }

    @GetMapping(value = "page/{page}")
    public String index(Model model,
                        @PathVariable(value = "page")Integer page,
                        @SortDefault(sort = "postDate", direction = DESC) Sort sort){
        int size=10;
        if(OPTIONS.get("index_posts")!=null){
            size=Integer.parseInt(OPTIONS.get("index_posts"));}
        Pageable pageable = PageRequest.of(page-1,size,sort);
        Page<Post> posts = postService.post(pageable);
        model.addAttribute("posts",posts);
        model.addAttribute("rainbow",posts.getTotalPages());
        model.addAttribute("is_index",true);

        return "front/simple/index";
    }
}
