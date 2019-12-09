package com.cyh.blog.service;

import java.util.Map;



public interface OptionsService {

    Map<String, String>  findAllOptions();

    void saveOption(String key, String value);

    void saveOptions(Map<String, String> options);

}
