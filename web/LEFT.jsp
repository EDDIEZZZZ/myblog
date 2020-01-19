<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/23
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>左边导航栏</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css">
</head>
<body>

<div class="left">
    <br>
    <div class="about">
        <i><a href="SixinAdminlistServlet" class="tou"><img src="img/3.jpg" alt=""></a></i>
        <div class="login">

            <c:if test="${sessionScope.loginuser==null }">
                <a href="login.jsp">登陆</a> | <a href="register.jsp">注册</a>
            </c:if>
            <c:if test="${sessionScope.loginuser!=null }">
                <p>用户名：${loginuser.name }</p>
                <p>ID:${loginuser.id }</p>
                <a href="exit.jsp">退出登陆</a>
            </c:if>

        </div>
    </div>
</div>

</body>
</html>
