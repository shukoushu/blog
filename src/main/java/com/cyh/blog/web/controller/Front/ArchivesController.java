package com.cyh.blog.web.controller.Front;

import com.cyh.blog.model.domain.Post;
import com.cyh.blog.service.CommentService;
import com.cyh.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;

@Controller
@RequestMapping("archives")
public class ArchivesController {

    @Autowired
    PostService postService;

    @Autowired
    CommentService commentService;

    @GetMapping
    public String archives(Model model){
        model.addAttribute("is_archives",true);
        return this.archives(model,1);
    }

    @GetMapping(value = "page/{page}")
    public String archives(Model model,
                           @PathVariable(value = "page") Integer page){
        //所有文章数据，分页
        Sort sort = new Sort(Sort.Direction.DESC,"postDate");
        Pageable pageable = new PageRequest(page-1,5,sort);
        Page<Post> posts = postService.post(pageable);
        model.addAttribute("posts",posts);
        return "front/simple/archives";
    }
    @GetMapping(value = "{posturl}")
    public String getPost(Model model,@PathVariable(value = "posturl") String posturl,
                          @RequestParam(defaultValue="0")int page){
        int size=10;
        if(OPTIONS.get("index_comments")!=null){
            size=Integer.parseInt(OPTIONS.get("index_comments"));
        }
        Pageable pageable =PageRequest.of(page,size,Sort.Direction.DESC,"commentDate");
        final Post post = postService.findPostByPostUrl(posturl);
        model.addAttribute("post",post);
        postService.getPrePost(post.getPostDate()).ifPresent(prePost -> model.addAttribute("prePost",prePost));
        postService.getNextPost(post.getPostDate()).ifPresent(nextPost ->model.addAttribute("nextPost",nextPost));
        model.addAttribute("comments", commentService.findCommentByPost(post, pageable));

        return "front/simple/post";
    }

}
