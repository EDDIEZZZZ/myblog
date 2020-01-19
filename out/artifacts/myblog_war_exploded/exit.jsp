<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/8
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    成功退出，5秒后跳 <a href="IndexServlet">转回首页</a>
    <%
        response.setHeader("refresh","5;url=IndexServlet");
    %>

</body>
</html>
