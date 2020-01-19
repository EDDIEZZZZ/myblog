package com.bean;

import java.sql.Timestamp;

public class Dongtai {
    private Integer id;
    private String title;
    private String content;
    //外键，使用外键表对应的对象来定义
    private Adminuser author;
    private Timestamp createtime;
    private boolean is_used;
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Adminuser getAuthor() {
        return author;
    }
    public void setAuthor(Adminuser author) {
        this.author = author;
    }
    public Timestamp getCreatetime() {
        return createtime;
    }
    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }
    public boolean isIs_used() {
        return is_used;
    }
    public void setIs_used(boolean is_used) {
        this.is_used = is_used;
    }



}
