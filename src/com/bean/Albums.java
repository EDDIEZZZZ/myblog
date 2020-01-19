package com.bean;

import java.sql.Timestamp;

public class Albums {   //vo po
    private Integer id;
    private String name;
    private Adminuser author;
    private Timestamp createtime;
    private boolean is_used;
    //相册照片数量
    private Integer photocount;
    //相册封面
    private String photofirst;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Integer getPhotocount() {
        return photocount;
    }

    public void setPhotocount(Integer photocount) {
        this.photocount = photocount;
    }

    public String getPhotofirst() {
        return photofirst;
    }

    public void setPhotofirst(String photofirst) {
        this.photofirst = photofirst;
    }
}
