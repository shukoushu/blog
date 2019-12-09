package com.cyh.blog.service.impl;

import com.cyh.blog.model.domain.Logs;
import com.cyh.blog.repository.LogsRepotitoty;
import com.cyh.blog.service.LogsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LogsServiceimpl implements LogsService {

    @Autowired
    LogsRepotitoty logsRepotitoty;

    @Override
    public Page<Logs> findAllLogs(Pageable pageable) {
        return logsRepotitoty.findAll(pageable);
    }

    @Override
    public List<Logs> findLogsLatest() {
        return logsRepotitoty.FindTopFive();
    }

    @Override
    public void saveLog(Logs logs) {
        logsRepotitoty.save(logs);

    }

    @Override
    public void deleteAllLogs() {
        logsRepotitoty.deleteAll();
    }
}
