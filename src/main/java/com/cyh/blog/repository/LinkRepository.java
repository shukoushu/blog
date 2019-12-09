package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Link;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface LinkRepository extends JpaRepository<Link,Integer>, JpaSpecificationExecutor<Link>{

    Link findByLinkId(Integer id);
}
