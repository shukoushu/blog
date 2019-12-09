package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Page;
import com.cyh.blog.repository.PageRepository;
import com.cyh.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public class PageServiceimpl implements PageService {

    @Autowired
    PageRepository pageRepository;
    @Override
    public List<Page> findAll() {
        return pageRepository.findAll();
    }

    @Override
    public void save(Page page) {
        Date datename = new Date();
        java.sql.Date sqldate = new java.sql.Date(datename.getTime());
        page.setPageDate(sqldate);
        pageRepository.save(page);
    }

    @Override
    public Page findPageById(Long id) {
        Page page = pageRepository.findAllByPageId(id);
        return page;
    }

    @Override
    public void removePage(Long id) {
        pageRepository.deleteById(id);
    }

    @Override
    public Page findByUrl(String url) {
        final Page page = pageRepository.findAllByPageUrl(url);
        return page;
    }

}
