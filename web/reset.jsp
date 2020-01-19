<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/7/3
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="./css/zhuce.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="all">
    <h2>找回密码</h2>
    <br>
    <form  name="form" method="post" action="NameServlet" >
        <span>请输入用户昵称进行验证：</span>
        <input type="text" placeholder="请输入用户昵称" name="u_name" style="width: 300px;height: 35px"/>
        <input type="submit" value="提交查询" class="tijiao">
    </form>
</div>
</body>
</html>
