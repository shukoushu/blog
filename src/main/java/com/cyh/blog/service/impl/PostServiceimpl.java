package com.cyh.blog.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HtmlUtil;
import com.cyh.blog.model.domain.Post;
import com.cyh.blog.model.dto.Archive;
import com.cyh.blog.repository.PostRepository;
import com.cyh.blog.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;
import static org.springframework.data.domain.Sort.Direction.ASC;
import static org.springframework.data.domain.Sort.Direction.DESC;

@Service
public class PostServiceimpl implements PostService{

    @Autowired
    PostRepository  postRepository;

    @Override
    public List<Post> findPostLatest() {
        return postRepository.findTopFive();
    }

    @Override
    public void postSave(Post post){
        Date datename = new Date();
        java.sql.Date sqldate = new java.sql.Date(datename.getTime());
        post.setPostDate(sqldate);
        postRepository.save(post);
    }

    public Page<Post>  post(Pageable pageable){
        final Page<Post> posts = postRepository.findAll(pageable);
        if(OPTIONS.get("post_summary")!=null){
            for(Post post:posts){
                String summarytext= StrUtil.cleanBlank(HtmlUtil.removeHtmlTag((post.getPostContent()),"img"));
                if(HtmlUtil.cleanHtmlTag(summarytext).length() > Integer.parseInt(OPTIONS.get("post_summary"))){
                    post.setPostSummary(HtmlUtil.cleanHtmlTag(post.getPostContent()).substring(0,Integer.parseInt(OPTIONS.get("post_summary"))));
                }else{
                    post.setPostSummary(HtmlUtil.cleanHtmlTag(post.getPostContent()));
                }
            }
        }
        return posts ;
    }

    @Override
    public List<Archive> findAllByYearAndMonth() {
        final List<Object[]> objects = postRepository.findPostGroupByYearAndMonth();
        List<Archive> archives = new ArrayList<>();
        Archive archive = null;
        for(Object[] obj : objects){
            archive = new Archive();
            archive.setYear(obj[0].toString());
            archive.setMonth(obj[1].toString());
            archive.setCount(obj[2].toString());
            archive.setPosts(this.findPostByYearAndMonth(obj[0].toString(),obj[1].toString()));
            archives.add(archive);
        }
        return archives;
    }
    @Override
    public List<Post> findPostByYearAndMonth(String year, String month) {
        return postRepository.findPostByYearAndMonth(year,month);
    }

    @Override
    public Post findPostByPostUrl(String url) {
        return postRepository.findPostByPostUrl(url);
    }

    @Override
    public Optional<Post> findPostById(Long id) {
        Optional<Post> post = postRepository.findById(id);
        return post;
    }

    @Override
    public void removeById(Long id) {
        postRepository.deleteById(id);
    }

    @Override
    public Optional<Post> getNextPost(Date postDate) {
        final List<Post> post = postRepository.findAllByPostDateBefore(postDate,
                PageRequest.of(0, 1, Sort.by(DESC, "postDate"))).getContent();
        return CollectionUtils.isEmpty(post) ? Optional.empty() : Optional.of(post.get(0));
    }

    @Override
    public Optional<Post> getPrePost(Date postDate) {
        final List<Post> post = postRepository.findAllByPostDateAfter(postDate,
                PageRequest.of(0, 1, Sort.by(ASC, "postDate"))).getContent();
        return CollectionUtils.isEmpty(post) ? Optional.empty() : Optional.of(post.get(0));
    }

    @Override
    public Page<Post> findByTagId(Long id, Pageable pageable) {
        return postRepository.findAllByTagId(id,pageable);
    }

}
