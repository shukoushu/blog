package com.cyh.blog.listener;

import com.cyh.blog.service.OptionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

import static com.cyh.blog.model.dto.CommonProperties.OPTIONS;

@Configuration
public class StartedListener implements ApplicationListener<ApplicationStartedEvent> {
    @Autowired
    private OptionsService optionsService;
    @Override
    public void onApplicationEvent(ApplicationStartedEvent applicationStartedEvent) {
    this.loadOptions();
    }
    private void loadOptions() {
        final Map<String, String> options = optionsService.findAllOptions();
        if (options != null && !options.isEmpty()) {
            OPTIONS = options;
        }
    }

}
