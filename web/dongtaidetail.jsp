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
    <link rel="stylesheet" href="./css/index.css" type="text/css">
</head>

<body>
<div class="all">

    <jsp:include page="HEADER.jsp"/>

    <jsp:include page="LEFT.jsp"/>

    <div class="content">

        <div class="welcome">
            <p>&nbsp;&nbsp;您好，欢迎您访问我们的小组博客！</p>
        </div>
        <br><br>

        <!--		日志文章-->
        <div class="daily">
            <h2 class="newsheader"><strong>${dongtaidetail.title }</strong></h2>
            <div class="dailyauthor">
                <p>作者:${dongtaidetail.author.nickname }&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>发布时间:<fmt:formatDate value="${dongtaidetail.createtime}" pattern="yyyy年MM月dd日HH点mm分" /></span>
                </p>
            </div>
            <hr color="#CCCCCC">
            <div class="dailycontent">
                <p>${dongtaidetail.content }</p>
            </div>
            <hr color="#CCCCCC">
            <!--			评论区<-->
            <div class="pinglunbox">
                <b>评论区:</b><br>
                <c:forEach items="${pinglunlist }" var="pl">
                    <div class="pinglunheader">
                        <div class="pltou">
                            <i><br><a href="#"><img src="img/3.jpg"></a><b>用户名：${pl.author.name }</b></i>
                        </div>
                        <div class="plcontent">
                            <p>${pl.content }</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <br>

            <!--			评论-->   <br><br><br><br>
            <hr color="#CCCCCC">
            <div class="pinglun">
                <form action="PinglunAddServlet" method="post" accept-charset="utf-8">
                    <b>评论：</b>
                    <br>
                    <input type="hidden" name="d_id" value="${d_id }">
                    <textarea cols="90%" rows="8" name="content" placeholder="输入你的评论"></textarea><br>
                    <button type="submit" >评论</button>
                </form>
            </div>
            <br>
        </div>
    </div>

</div>
</body>
</html>
