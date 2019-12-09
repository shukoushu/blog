package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.cyh.blog.model.domain.Gallery;
import com.cyh.blog.model.domain.Link;
import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.model.domain.Page;
import com.cyh.blog.service.GalleryService;
import com.cyh.blog.service.LinkService;
import com.cyh.blog.service.LogsService;
import com.cyh.blog.service.PageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.cyh.blog.model.enums.LogsRecordEnum.PUSH_PAGE;
import static com.cyh.blog.model.enums.LogsRecordEnum.REMOVE_PAGE;

/**
 * 页面
 */


@Controller
@RequestMapping(value = "/admin/page")
public class PageController {

    @Autowired
    PageService pageService;

    @Autowired
    LinkService linkService;

    @Autowired
    GalleryService galleryService;

    @Autowired
    HttpServletRequest request;

    @Autowired
    LogsService logsService;

    @GetMapping
    public String page(Model model){
        final List<Page> pages = pageService.findAll();
        model.addAttribute("pages",pages);
        return "admin/admin_page";
    }

    @GetMapping(value = "edit")
    public String pageEdit(Model model){
        return "admin/admin_page_new";
    }

    @GetMapping(value = "edit/{id}")
    public String pageEdit(Model model, @PathVariable("id") Long id){
        final Page page = pageService.findPageById(id);
        model.addAttribute("page",page);
        return "admin/admin_page_new";
    }


    @DeleteMapping(value = "remove/{id}")
    public String removePage(@PathVariable("id") Long id){
        Logs log= new Logs(REMOVE_PAGE.getRecord(),pageService.findPageById(id).getPageTitle(), ServletUtil.getClientIP(request), DateUtil.date());
        logsService.saveLog(log);
        pageService.removePage(id);
        return "redirect:/admin/page";
    }

    @PostMapping
    @ResponseBody
    public Map<String, String> save(@ModelAttribute Page page){
//        String url="";
//        StrBuilder pageUrl=new StrBuilder(url);
//        pageUrl.append(page.getPageTitle());
//        page.setPageUrl(pageUrl.toString());
//        page.setPageUrl(page.getPageUrl().substring(0,page.getPageUrl().length()-1));
        pageService.save(page);
        Logs log= new Logs(PUSH_PAGE.getRecord(),page.getPageTitle(), ServletUtil.getClientIP(request), DateUtil.date());
        logsService.saveLog(log);
        Map<String,String> map = new HashMap<>(1);
        map.put("succes","1");

        return map;
    }


    @GetMapping(value = "links")
    public String link(Model model){
        final List<Link> links = linkService.findAll();
        model.addAttribute("links",links);
        model.addAttribute("statusName","新建");
        return "admin/admin_page_link";
    }

    @PostMapping(value = "links/save")
    public String savelink(Model model,Link link){
        linkService.saveLink(link);
        return "redirect:/admin/page/links";
    }

    @GetMapping(value = "links/{id}" )
    public String updatelink(Model model,@PathVariable("id") Integer id){
        Link link = linkService.findByLinkId(id);
        final List<Link> links = linkService.findAll();
        model.addAttribute("links",links);
        model.addAttribute("statusName","修改");
        model.addAttribute("updateLink",link);
        return "admin/admin_page_link";
    }

    @DeleteMapping(value = "links/remove/{id}")
    public String removelink(@PathVariable("id") Integer id){
        linkService.removeLink(id);
        return "redirect:/admin/page/links";
    }

    @GetMapping("gallery")
    public String findGallery(Pageable pageable, Model model){
        final org.springframework.data.domain.Page<Gallery> galleries = galleryService.findAll(pageable);
        model.addAttribute("gallerys",galleries);
        return "admin/admin_page_gallery";
    }

    @GetMapping("gallery/remove")
    @ResponseBody
    public Boolean removeGallery(@RequestParam("attachId") Long attachId){
        try {
            galleryService.deleteGallery(attachId);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    @GetMapping("gallery/{id}")
    public String findGalleryById(@PathVariable("id") Long id,Model model){
        model.addAttribute("gallery",galleryService.findById(id));
        return "admin/widget/gallery-detail";
    }

    @PostMapping("gallery/save")
    public String saveGallery(Gallery gallery){
        galleryService.saveGallery(gallery);
        return "redirect:/admin/page/gallery";
    }
}
