package com.cyh.blog.service;

import com.cyh.blog.model.domain.Page;

import java.util.List;

public interface PageService {
    List<Page> findAll();
    void save(Page page);
    Page findPageById(Long id);
    void removePage(Long id);
    Page findByUrl(String url);
}
