package com.cyh.blog.model.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blog_gallery")
public class Gallery {

    @Id
    @GeneratedValue
    private Long galleryId;

    private String galleryName;

    private String galleryUrl;

    private String galleryDesc;

    private String galleryDate;

    public Long getGalleryId() {
        return galleryId;
    }

    public void setGalleryId(Long galleryId) {
        this.galleryId = galleryId;
    }

    public String getGalleryName() {
        return galleryName;
    }

    public void setGalleryName(String galleryName) {
        this.galleryName = galleryName;
    }

    public String getGalleryUrl() {
        return galleryUrl;
    }

    public void setGalleryUrl(String galleryUrl) {
        this.galleryUrl = galleryUrl;
    }

    public String getGalleryDesc() {
        return galleryDesc;
    }

    public void setGalleryDesc(String galleryDesc) {
        this.galleryDesc = galleryDesc;
    }

    public String getGalleryDate() {
        return galleryDate;
    }

    public void setGalleryDate(String galleryDate) {
        this.galleryDate = galleryDate;
    }
}
