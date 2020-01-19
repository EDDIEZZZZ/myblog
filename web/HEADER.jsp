<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/10
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>主页头部</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css">
</head>
<body>

<div class="daohang">
    <div class="logo">个人博客</div>
    <ul>
        <a href="IndexServlet"><li>首页</li></a>
        <a href="DongtaiIndexServlet"><li>日志</li></a>
        <a href="AlbumsIndexServlet"><li>相册</li></a>
        <a href="MediasIndexServlet"><li>VLOG</li></a>
<c:if test="${sessionScope.loginuser!=null }">
        <a href="SixinAdminlistServlet"><li>个人中心</li></a>
</c:if>
    </ul>
</div>

</body>
</html>
