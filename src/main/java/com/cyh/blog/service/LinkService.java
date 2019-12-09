package com.cyh.blog.service;

import com.cyh.blog.model.domain.Link;

import java.util.List;

public interface LinkService {

    List<Link> findAll();
    Link findByLinkId(Integer linkId);
    void saveLink(Link link);
    void removeLink(Integer linkId);
}
