package com.cyh.blog.model.domain;

import javax.persistence.*;

/**
 * 设置
 */

@Entity
@Table(name = "blog_options")
public class Options {


    @Id
    @Column(length = 127)
    private String optionName;

    @Lob
    private String optionValue;

    public String getOptionName() {
        return optionName;
    }

    public void setOptionName(String optionName) {
        this.optionName = optionName;
    }

    public String getOptionValue() {
        return optionValue;
    }

    public void setOptionValue(String optionValue) {
        this.optionValue = optionValue;
    }
}
