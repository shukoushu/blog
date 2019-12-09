package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TagRepository extends JpaRepository<Tag,Long>, JpaSpecificationExecutor<Tag> {

    Tag findByTagUrlOrTagName(String tagUrl ,String tagName);

    Tag findByTagName(String tagName);

    Tag findByTagUrl(String tagUrl);
}
