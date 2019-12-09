package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Gallery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface GalleryRepository extends JpaRepository<Gallery,Long>, JpaSpecificationExecutor<Long> {
}
