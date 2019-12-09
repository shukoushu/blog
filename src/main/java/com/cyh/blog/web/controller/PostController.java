package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.extra.servlet.ServletUtil;
import cn.hutool.http.HtmlUtil;
import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.domain.Tag;
import com.cyh.blog.service.LogsService;
import com.cyh.blog.service.PostService;
import com.cyh.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.cyh.blog.model.enums.LogsRecordEnum.PUSH_POST;
import static com.cyh.blog.model.enums.LogsRecordEnum.REMOVE_POST;
import static org.springframework.data.domain.Sort.Direction.DESC;

@Controller
@RequestMapping(value = "/admin/posts")
public class PostController {

    @Autowired
    PostService postService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    LogsService logsService;

    @Autowired
    TagService tagService;

    @GetMapping
    public String posts(Model model,
                        @PageableDefault(sort = "postDate", direction = DESC) Pageable pageable){
        Page<Post> posts=postService.post(pageable);
        model.addAttribute("posts",posts);

        return "/admin/admin_post";
    }
    @GetMapping (value ="/write")
    public String postadd(){
        return "admin/admin_post_new";
    }

    @PostMapping
    @ResponseBody
    public Map<String, String> save(@ModelAttribute Post post,@RequestParam("tags[]") List<String> tags){
        String url="";
        int postSummary=50;
//        StrBuilder postUrl=new StrBuilder(url);
//        postUrl.append(post.getPostTitle());
//        post.setPostUrl(postUrl.toString());
        post.setPostUrl(post.getPostUrl().substring(0,post.getPostUrl().length()-1));
        String summaryText = StrUtil.cleanBlank(HtmlUtil.cleanHtmlTag(post.getPostContent()));
        if (summaryText.length() > postSummary) {
            String summary = summaryText.substring(0, postSummary);
            post.setPostSummary(summary);
        } else {
            post.setPostSummary(summaryText);
        }
        final List<Tag> tag = tagService.findTagsByTagName(tags);
        post.setPostTag(tag);
        postService.postSave(post);
        Logs log= new Logs(PUSH_POST.getRecord(),post.getPostTitle(), ServletUtil.getClientIP(request), DateUtil.date());
        logsService.saveLog(log);
        Map<String,String> map = new HashMap<>(1);
        map.put("succes","1");
        return map;
    }

    @GetMapping(value = "{postId}")
    public String getPost(Model model,@PathVariable(value = "postId") Long id){
        Optional<Post> post = postService.findPostById(id);
        model.addAttribute("post",post.get());
        return "/admin/admin_post_new";
    }

    @DeleteMapping(value = "remove/{id}")
    @ResponseBody
    public String removePage(@PathVariable("id") Long id){
        Logs log= new Logs(REMOVE_POST.getRecord(),postService.findPostById(id).get().getPostTitle(), ServletUtil.getClientIP(request), DateUtil.date());
        logsService.saveLog(log);
        postService.removeById(id);
        return "/admin/post";
    }

}
