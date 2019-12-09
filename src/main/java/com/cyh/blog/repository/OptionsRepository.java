package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Options;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface OptionsRepository extends JpaSpecificationExecutor<Options>,
        JpaRepository<Options,String>  {

    Options findOptionsByOptionName(String key);

}
