package com.cyh.blog.service;

import com.cyh.blog.model.domain.Menu;

import java.util.List;
import java.util.Optional;

/**
 * 菜单
 * 2019/6/23
 */
public interface MenuService {

    List<Menu> findAllMenu();

    Optional<Menu> findMenuById(Long id);

    void saveMenu(Menu menu);

    void removeMenu(Long id);
}
