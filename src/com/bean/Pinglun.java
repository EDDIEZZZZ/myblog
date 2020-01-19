package com.bean;

import java.sql.Timestamp;

public class Pinglun {
    private Integer id;
    private String content;
    private User author;
    private Dongtai dongtai;
    private Timestamp createtime;
    private boolean is_used;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Dongtai getDongtai() {
        return dongtai;
    }

    public void setDongtai(Dongtai dongtai) {
        this.dongtai = dongtai;
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
