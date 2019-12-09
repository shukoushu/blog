package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Gallery;
import com.cyh.blog.repository.GalleryRepository;
import com.cyh.blog.service.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class galleryServiceimpl implements GalleryService {

    @Autowired
    GalleryRepository galleryRepository;

    @Override
    public void saveGallery(Gallery gallery) {
        galleryRepository.save(gallery);

    }

    @Override
    public Page<Gallery> findAll(Pageable pageable) {
        return galleryRepository.findAll(pageable);
    }

    @Override
    public void deleteGallery(Long id) {
        galleryRepository.deleteById(id);

    }

    @Override
    public List<Gallery> findAll() {
        return galleryRepository.findAll();
    }

    @Override
    public Gallery findById(Long id) {
        return galleryRepository.getOne(id);
    }
}
