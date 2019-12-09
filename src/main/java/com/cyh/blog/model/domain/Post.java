package com.cyh.blog.model.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "blog_post")
public class Post {

    @Id
    @GeneratedValue
    @Column(name = "post_id")
    private long postId;

    @Column(name = "post_title")
    private String postTitle;

    @Column(name = "post_url")
    private String postUrl;

    @Lob
    @Column(name = "post_content_md")
    private String postContentMd;

    @Lob
    @Column(name = "post_content")
    private String postContent;

    private String postSummary;

    @Column(name = "post_date")
    private Date postDate;

    @ManyToMany
    @JoinTable(name = "posts_tags",
            joinColumns = {@JoinColumn(name = "post_id", nullable = false)},
            inverseJoinColumns = {@JoinColumn(name = "tag_id", nullable = false)})
    private List<Tag> postTag = new ArrayList<>();

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostUrl() {
        return postUrl;
    }

    public void setPostUrl(String postUrl) {
        this.postUrl = postUrl;
    }

    public String getPostContentMd() {
        return postContentMd;
    }

    public void setPostContentMd(String postContentMd) {
        this.postContentMd = postContentMd;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public long getPostId() {
        return postId;
    }

    public void setPostId(long postId) {
        this.postId = postId;
    }

    public String getPostSummary() {
        return postSummary;
    }

    public void setPostSummary(String postSummary) {
        this.postSummary = postSummary;
    }

    public List<Tag> getPostTag() {
        return postTag;
    }

    public void setPostTag(List<Tag> postTag) {
        this.postTag = postTag;
    }
}
