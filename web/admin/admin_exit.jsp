<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/8
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员退出登录</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    成功退出，请<a href="admin_login.jsp">重新登陆</a>
</body>
</html>
