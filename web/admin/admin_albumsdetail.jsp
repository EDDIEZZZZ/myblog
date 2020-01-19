<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/9
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>相册详情</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/fileinput.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script src="../js/fileinput.min.js"></script>
    <script src="../js/fileinput_locale_zh.js"></script>

</head>
<body>

<jsp:include page="admin_HEAD.jsp" />

<jsp:include page="admin_LEFT.jsp" />

<div class="content">
    <div class="fbdongtai">
        <c:forEach items="${albumslist }" var="p">

            <img src="../${p.url}" alt="${p.title }">

        </c:forEach>
    </div>
</div>

</body>
</html>
