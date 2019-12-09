package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Img;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ImgRepository extends JpaRepository<Img,Long>, JpaSpecificationExecutor<Img> {
}
