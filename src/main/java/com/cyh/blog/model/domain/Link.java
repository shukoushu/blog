package com.cyh.blog.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name = "blog_link")
public class Link {
    @Id
    @GeneratedValue
    private int linkId;

    /**
     * 友情链接名称
     */
    @NotEmpty(message = "友情链接名称不能为空！")
    private String linkName;

    /**
     * 友情链接地址
     */
    @NotEmpty(message = "友情链接地址不能为空！")
    private String linkUrl;

    /**
     * 友情链接描述
     */
    private String linkDesc;

    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkDesc() {
        return linkDesc;
    }

    public void setLinkDesc(String linkDesc) {
        this.linkDesc = linkDesc;
    }
}
