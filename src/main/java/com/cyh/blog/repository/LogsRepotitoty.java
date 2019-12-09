package com.cyh.blog.repository;

import com.cyh.blog.model.domain.Logs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LogsRepotitoty extends JpaRepository<Logs,Long>, JpaSpecificationExecutor<Long>{

    /**
     *
     * @return List
     */
    @Query( value = "SELECT * FROM blog_logs ORDER BY log_created DESC LIMIT 5", nativeQuery = true)
    List<Logs> FindTopFive();
}
