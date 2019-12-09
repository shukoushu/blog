package com.cyh.blog.model.domain;

import javax.persistence.*;
import java.util.Date;

/**
 * 页面
 *
 */

@Entity
@Table(name = "blog_page")
public class Page {
    @Id
    @GeneratedValue
    @Column(name="page_id")
    private long pageId;

    @Column(name = "page_title")
    private String pageTitle;

    @Column(name = "page_url",unique = true)
    private String pageUrl;

    @Lob
    @Column(name = "page_content_md")
    private String pageContentMd;

    @Lob
    @Column(name = "page_content")
    private String pageContent;

    @Column(name = "page_date")
    private Date pageDate;

    public long getPageId() {
        return pageId;
    }

    public void setPageId(long pageId) {
        this.pageId = pageId;
    }

    public String getPageTitle() {
        return pageTitle;
    }

    public void setPageTitle(String pageTitle) {
        this.pageTitle = pageTitle;
    }

    public String getPageUrl() {
        return pageUrl;
    }

    public void setPageUrl(String pageUrl) {
        this.pageUrl = pageUrl;
    }

    public String getPageContentMd() {
        return pageContentMd;
    }

    public void setPageContentMd(String pageContentMd) {
        this.pageContentMd = pageContentMd;
    }

    public String getPageContent() {
        return pageContent;
    }

    public void setPageContent(String pageContent) {
        this.pageContent = pageContent;
    }

    public Date getPageDate() {
        return pageDate;
    }

    public void setPageDate(Date pageDate) {
        this.pageDate = pageDate;
    }
}
