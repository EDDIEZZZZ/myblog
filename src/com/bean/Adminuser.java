package com.bean;

import java.sql.Timestamp;

public class Adminuser {
    private Integer id;
    private String name;
    private String pass;
    private String nickname;
    private Timestamp createtime;
    private boolean is_used;
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
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public String getNickname() {
        return nickname;
    }
    public void setNickname(String nickname) {
        this.nickname = nickname;
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
