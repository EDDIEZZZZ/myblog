package com.bean;


import java.sql.Timestamp;


public class User { //vo,本实体类通过页面表单内的组件对应创建  view 视图   po   pojo
    private Integer id;
    private String name;
    private String pass;
    private Timestamp createtime;
    private boolean is_used;
    private String url;
    private String question;
    private String answer;

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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
