package com.cyh.blog.web.controller;

import com.cyh.blog.service.OptionsService;
import freemarker.template.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;

@Controller
@RequestMapping("admin/options")
public class OptionsController {

    @Autowired
    OptionsService optionsService;

    @Autowired
    Configuration configuration;

    @GetMapping
    public String getOptions(){
        return "admin/admin_options";
    }

    @PostMapping("save")
    @ResponseBody
    public boolean saveOptions(@RequestParam Map<String, String> options){
        try {
            optionsService.saveOptions(options);
            OPTIONS.clear();
            OPTIONS=optionsService.findAllOptions();
            configuration.setSharedVariable("options",OPTIONS);
        }catch (Exception e){
            return  false;
        }
        return true;
    }

}
