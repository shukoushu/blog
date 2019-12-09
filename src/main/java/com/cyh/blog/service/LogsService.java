package com.cyh.blog.service;

import com.cyh.blog.model.domain.Logs;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface LogsService {

    Page<Logs> findAllLogs(Pageable pageable);

    List<Logs> findLogsLatest();

    void saveLog(Logs logs);

    void deleteAllLogs();
}
