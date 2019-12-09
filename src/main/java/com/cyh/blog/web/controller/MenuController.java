package com.cyh.blog.web.controller;

import com.cyh.blog.model.domain.Menu;
import com.cyh.blog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

/**
 * 菜单
 *
 * 2019/6/23
 */
@Controller
@RequestMapping(value = "admin/menu")
public class MenuController {
    @Autowired
    MenuService menuService;

    @GetMapping
    public String findmenu(Model model){
        final List<Menu> menus = menuService.findAllMenu();
        model.addAttribute("menus",menus);
        model.addAttribute("statusName","添加");
        return  "admin/admin_menu";
    }

    @PostMapping
    public String savemenu(Model model,Menu menu){
        menuService.saveMenu(menu);
        return "redirect:/admin/menu";
    }


    @GetMapping("/{id}")
    public String findmenuById(Model model,@PathVariable("id") Long id){
        final Optional<Menu> menu = menuService.findMenuById(id);
        final List<Menu> menus = menuService.findAllMenu();
        model.addAttribute("menus",menus);
        model.addAttribute("updateMenu",menu.get());
        model.addAttribute("statusName","修改");
        return "admin/admin_menu";
    }

    @DeleteMapping("/remove/{id}")
    public String removeMenu(@PathVariable("id") String id){
        Long longid=Long.parseLong(id);
        menuService.removeMenu(longid);
        return "redirect:/admin/menu";
    }

}
