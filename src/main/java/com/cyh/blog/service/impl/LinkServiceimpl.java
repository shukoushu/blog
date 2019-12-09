package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Link;
import com.cyh.blog.repository.LinkRepository;
import com.cyh.blog.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 查询Link
 *
 */

@Service
public class LinkServiceimpl implements LinkService {

    @Autowired
    LinkRepository linkRepository;

    @Override
    public List<Link> findAll() {
        return linkRepository.findAll();
    }

    @Override
    public Link findByLinkId(Integer linkId) {
        return linkRepository.findByLinkId(linkId);
    }

    @Override
    public void saveLink(Link link) {
        linkRepository.save(link);
    }

    @Override
    public void removeLink(Integer linkId) {
        linkRepository.deleteById(linkId);
    }
}
