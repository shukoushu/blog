package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PageRepository extends JpaSpecificationExecutor<Page>,
        JpaRepository<Page,Long> {
    Page findAllByPageId(Long id);
    Page findAllByPageUrl(String url);

}
