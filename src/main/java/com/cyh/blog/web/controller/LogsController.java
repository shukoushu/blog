package com.cyh.blog.web.controller;

import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/logs")
public class LogsController {

    @Autowired
    LogsService logsService;

    @GetMapping
    public String findAllLogs(@PageableDefault(size=10, direction = Sort.Direction.DESC)
                                          Pageable pageable,
                                          Model model){
        final Page<Logs> allLogs = logsService.findAllLogs(pageable);
        model.addAttribute("logs",allLogs);
        return "admin/widget/logs-all";
    }

    @GetMapping("clear")
    public String deleteAll(){
        logsService.deleteAllLogs();
        return "redirect:/admin";
    }


}
