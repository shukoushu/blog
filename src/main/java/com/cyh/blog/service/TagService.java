package com.cyh.blog.service;

import com.cyh.blog.model.domain.Tag;

import java.util.List;

public interface TagService {

    List<Tag> getTag();
    Tag findByUrl(String tagUrl);
    void saveTag(Tag tag);
    Tag findById(Long id);
    void remove(Long id);
    Tag findByUrlOrName(String url,String name);
    List<Tag> findTagsByTagName(List<String> tagName);


}
