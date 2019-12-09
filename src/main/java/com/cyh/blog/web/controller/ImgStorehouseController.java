package com.cyh.blog.web.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.extra.servlet.ServletUtil;
import com.cyh.blog.model.domain.Img;
import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.service.ImgService;
import com.cyh.blog.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

import static com.cyh.blog.model.enums.LogsRecordEnum.*;
import static org.springframework.data.domain.Sort.Direction.DESC;

/**
 * 图片上传
 */

@Controller
@RequestMapping(value="/admin/img")
public class ImgStorehouseController {

    @Autowired
    ImgService imgService;

    @Autowired
    LogsService logsService;

    @Autowired
    HttpServletRequest request;

    @GetMapping
    public String img(Model model,
                       @PageableDefault(direction = DESC) Pageable pageable){
        Page<Img> imgs=imgService.findimg(pageable);
        model.addAttribute("imgs",imgs);
        return "admin/admin_img_storehouse";
    }

    @GetMapping("select")
    public String imgSelect(Model model,
                            @PageableDefault(direction = DESC) Pageable pageable,
                            String id){
        Page<Img> selectimgs = imgService.findimg(pageable);
        model.addAttribute("imgs",selectimgs);
        model.addAttribute("id",id);
        return "admin/widget/attachment-select";
    }

    @PostMapping
    @ResponseBody
    public Map<String, Object> imgupload(@RequestParam("file") MultipartFile[] file,Model model){
        Map<String,Object> result =new HashMap<String, Object>();
        for (MultipartFile imgfile:file){
            if(!imgfile.isEmpty()){
                Map<String,String> map=imgService.imgupload(imgfile);
                Img img = new Img();
                img.setImgName(map.get("filename"));
                img.setImgSuffix(map.get("filesuffix"));
                img.setImgPath(map.get("filepath"));
                imgService.save(img);
                Logs log= new Logs(UPLOAD_IMG.getRecord(),map.get("filename"), ServletUtil.getClientIP(request), DateUtil.date());
                logsService.saveLog(log);
                model.addAttribute("success", true);
            }
        }
        result.put("success",1);
        return result;
    }

    @GetMapping("remove")
    @ResponseBody
    public boolean imgremove(@RequestParam("attachId") Long id){
        try {
            Logs log= new Logs(REMOVE_IMG.getRecord(),imgService.findingbyid(id).getImgName(), ServletUtil.getClientIP(request), DateUtil.date());
            imgService.imgRemove(id);
            logsService.saveLog(log);
        }catch (Exception e){
            return false;
        }
        return true;
    }

    @GetMapping(value ="{id}")
    public String getimgbyid(Model model,@PathVariable(value = "id") Long id){
        final Img img = imgService.findingbyid(id);
        model.addAttribute("img",img);
        return "admin/widget/img-detail";
    }
}
