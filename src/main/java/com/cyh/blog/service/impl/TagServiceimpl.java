package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Tag;
import com.cyh.blog.repository.TagRepository;
import com.cyh.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TagServiceimpl implements TagService {

    @Autowired
    TagRepository tagRepository;

    @Override
    public List<Tag> getTag() {
        final List<Tag> tags = tagRepository.findAll();
        return tags;
    }

    @Override
    public Tag findByUrl(String tagUrl) {
        return tagRepository.findByTagUrl(tagUrl);
    }

    @Override
    public void saveTag(Tag tag) {
        tagRepository.save(tag);
    }

    @Override
    public Tag findById(Long id) {
        return tagRepository.findById(id).get();
    }

    @Override
    public void remove(Long id) {
        tagRepository.deleteById(id);
    }

    @Override
    public Tag findByUrlOrName(String url,String name) {
        return tagRepository.findByTagUrlOrTagName(url,name);
    }

    @Override
    public List<Tag> findTagsByTagName(List<String> tagName) {
        List<Tag> listTag = new ArrayList<>();
        tagName.forEach(name -> listTag.add(tagRepository.findByTagName(name)));
        return listTag;
    }
}
