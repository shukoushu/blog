package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Menu;
import com.cyh.blog.repository.MenuRepository;
import com.cyh.blog.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


@Service
public class MenuServiceimpl implements MenuService {

    @Autowired
    MenuRepository menuRepository;

    @Override
    public List<Menu> findAllMenu() {
        return menuRepository.findAll();
    }

    @Override
    public Optional<Menu> findMenuById(Long id) {
        final Optional<Menu> menu = menuRepository.findById(id);
        return menu;
    }

    @Override
    public void saveMenu(Menu menu) {

        menuRepository.save(menu);

    }

    @Override
    public void removeMenu(Long id) {
        menuRepository.deleteById(id);

    }
}
