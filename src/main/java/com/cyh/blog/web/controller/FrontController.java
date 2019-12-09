package com.cyh.blog.web.controller;

import cn.hutool.core.io.file.FileReader;
import cn.hutool.core.io.file.FileWriter;
import com.cyh.blog.service.OptionsService;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("admin/front")
public class FrontController {

    @Autowired
    OptionsService optionsService;

    @Autowired
    Configuration configuration;

    @GetMapping
    public String front(){
        return "admin/admin_front_options";
    }

    @GetMapping("editor")
    public String frontEditor(Model model){
        List<String> tpls = new ArrayList<>();
        try {
            // 获取项目根路径
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            // 获取主题路径
            File themesPath = new File(basePath.getAbsolutePath(), "templates/front/simple");
            File modulePath = new File(themesPath.getAbsolutePath(), "module");
            File[] baseFiles = themesPath.listFiles();
            File[] moduleFiles = modulePath.listFiles();
            if (null != moduleFiles) {
                for (File file : moduleFiles) {
                    if (file.isFile() && file.getName().endsWith(".ftl")) {
                        tpls.add("module/" + file.getName());
                    }
                }
            }
            if (null != baseFiles) {
                for (File file : baseFiles) {
                    if (file.isFile() && file.getName().endsWith(".ftl")) {
                        tpls.add(file.getName());
                    }
                }
            }
        } catch (Exception e) {

        }
        model.addAttribute("tpls",tpls);
        return "admin/admin_front_editor";
    }

    @GetMapping("getTpl")
    @ResponseBody
    public String getTplContent(@RequestParam("tplName") String name){
        String Content= "";
        try {
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            File themesPath = new File(basePath.getAbsolutePath(), "templates/front/simple/"+name);
            FileReader fileReader= new FileReader(themesPath);
            Content=fileReader.readString();
        }catch (Exception e){
        }
        return Content;
    }

    @PostMapping("editor/save")
    @ResponseBody
    public Boolean saveTplContent(@RequestParam("tplName") String name,
                                 @RequestParam("tplContent") String content){
        try {
            File basePath = new File(ResourceUtils.getURL("classpath:").getPath());
            File themesPath = new File(basePath.getAbsolutePath(), "templates/front/simple/"+name);
            FileWriter fileWriter= new FileWriter(themesPath);
            fileWriter.write(content);
        }catch (Exception e){
            return false;
        }
        return true;
    }
}
