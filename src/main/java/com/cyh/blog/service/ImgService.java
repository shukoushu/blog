package com.cyh.blog.service;

import com.cyh.blog.model.domain.Img;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface ImgService {

    Page<Img> findimg(Pageable pageable);
    Map imgupload(MultipartFile file);
    void save(Img img);
    List<Img> findAll();
    Img findingbyid(Long id);
    void imgRemove(Long id);
    Long imgCount();
}
