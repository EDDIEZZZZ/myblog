package com.bean;

import java.sql.Timestamp;

public class Photos {
    private Integer id;
    private String title;
    private String url;
    private Albums album;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Albums getAlbum() {
        return album;
    }

    public void setAlbum(Albums album) {
        this.album = album;
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
