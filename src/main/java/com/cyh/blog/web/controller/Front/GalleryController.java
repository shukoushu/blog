package com.cyh.blog.web.controller.Front;

import com.cyh.blog.service.GalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("gallery")
public class GalleryController {

    @Autowired
    GalleryService galleryService;

    @GetMapping
    public String findAllGallery(Model model){
        model.addAttribute("galleries",galleryService.findAll());
        return "front/simple/gallery";
    }
}
