package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Menu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface MenuRepository  extends JpaSpecificationExecutor<Menu>, JpaRepository<Menu,Long> {

}
