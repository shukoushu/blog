package com.cyh.blog.service.impl;

import cn.hutool.core.util.StrUtil;
import com.cyh.blog.model.domain.Options;
import com.cyh.blog.repository.OptionsRepository;
import com.cyh.blog.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class OptionsServiceimpl  implements OptionsService {
    

    @Autowired
    private OptionsRepository optionsRepository;

    @Override
    public Map<String, String> findAllOptions() {
        final Map<String, String> options = new HashMap<>();
        final List<Options> optionsList = optionsRepository.findAll();
        if (null != optionsList) {
            optionsList.forEach(option -> options.put(option.getOptionName(), option.getOptionValue()));
        }
        return options;
    }

    @Override
    public void saveOption(String key, String value) {
        Options options = null;
        if (StrUtil.equals(value, "")) {
            options = new Options();
            options.setOptionName(key);
            optionsRepository.delete(options);

//            removeByIdOfNullable(key);
        } else if (StrUtil.isNotEmpty(key)) {
            //如果查询到有该设置选项则做更新操作，反之保存新的设置选项
                if (null == optionsRepository.findOptionsByOptionName(key)) {
                    options = new Options();
                    options.setOptionName(key);
                    options.setOptionValue(value);
                    optionsRepository.save(options);
                } else {
                    options = optionsRepository.findOptionsByOptionName(key);
                    options.setOptionValue(value);
                    optionsRepository.save(options);
                }

//            Options options = fetchById(key).map(option -> {
//                // Exist
//                option.setOptionValue(value);
//                return option;
//            }).orElseGet(() -> {
//                // Not exist
//                Options option = new Options();
//                option.setOptionName(key);
//                option.setOptionValue(value);
//                return option;
//            });

            // Save or update the options
//            optionsRepository.save(options);
        }

    }

    @Override
    public void saveOptions(Map<String, String> options) {
        if (!CollectionUtils.isEmpty(options)) {
            options.forEach(this::saveOption);
        }

    }
}
