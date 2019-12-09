package com.cyh.blog.service;

import com.cyh.blog.model.domain.Gallery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface GalleryService {

    void saveGallery(Gallery gallery);

    Page<Gallery> findAll(Pageable pageable);

    void deleteGallery(Long id);

    List<Gallery> findAll();

    Gallery findById(Long id);

}
