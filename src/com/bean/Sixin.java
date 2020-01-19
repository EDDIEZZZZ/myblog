package com.bean;

import java.sql.Timestamp;

public class Sixin {
    private Integer id;
    private User user;
    private Adminuser adminuser;
    private String content;
    private Timestamp createtime;
    private Boolean is_new_a;
    private String reply;
    private Boolean is_new_u;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Adminuser getAdminuser() {
        return adminuser;
    }

    public void setAdminuser(Adminuser adminuser) {
        this.adminuser = adminuser;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Timestamp createtime) {
        this.createtime = createtime;
    }

    public Boolean getIs_new_a() {
        return is_new_a;
    }

    public void setIs_new_a(Boolean is_new_a) {
        this.is_new_a = is_new_a;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public boolean isIs_new_u() {
        return is_new_u;
    }

    public void setIs_new_u(boolean is_new_u) {
        this.is_new_u = is_new_u;
    }
}
