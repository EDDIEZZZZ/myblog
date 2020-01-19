<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/30
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
    <meta charset="utf-8">
    <title>myblog</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <style>
        .unlike{
            font-size: 25px;
            color: #ccc;
            cursor: pointer;
            padding-left: 50px;
        }
        .like{
            font-size: 25px;
            color: #b92c28;
            cursor: pointer;
            padding-left: 50px;
        }
    </style>
</head>

<body>

<div class="all">

   <jsp:include page="HEADER.jsp"/>

   <jsp:include page="LEFT.jsp"/>

    <div class="content">
        <div class="welcome">
            <p>&nbsp;&nbsp;您好，欢迎您访问我们的小组博客！</p>
        </div>
        <!--		个人中心-->
        <div class="album">
            <h2 class="newsheader"><b>${albums.name }</b></h2>
            <c:forEach items="${albumslist }" var="p" >

                <img src='${p.url}' alt="${p.title }">

            </c:forEach>

        </div>
        <c:if test="${dianzan.is_used==true }">
            <a href="ShowDianzanServlet?d_id=${albums.id}"><span class="like">&#10084;</span></a>点击取消点赞
        </c:if>
        <c:if test="${dianzan.is_used==false }">
            <a href="ShowDianzanServlet?d_id=${albums.id}"><span class="unlike">&#10084;</span></a>点击赞一个
        </c:if>
        <c:if test="${empty dianzan}">
            <a href="ShowDianzanServlet?d_id=${albums.id}"><span class="unlike">&#10084;</span></a>点击赞一个
        </c:if>
    </div>

</div>

</body>
</html>