package com.cyh.blog.model.enums;

public enum  LogsRecordEnum {

    LOGIN("登录后台"),

    LOGIN_SUCCESS("登录成功"),

    LOGIN_ERROR("登录失败"),

    LOGOUT("退出登录"),

    PUSH_POST("发表文章"),

    PUSH_PAGE("发表页面"),

    REMOVE_POST("删除文章"),

    REMOVE_PAGE("删除页面"),

    UPLOAD_IMG("上传图片"),

    REMOVE_IMG("删除图片"),

    REGISTER("注册博客");

    String record;

    LogsRecordEnum(String record) {
        this.record = record;
    }

    public String getRecord(){
     return record;
    }
}
