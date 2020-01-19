<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/7/4
  Time: 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>日志</title>
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
        <c:forEach items="${dongtailist }" var="dongtai">
        <div class="essay1">

<%--            <div class="news">--%>

                <h2 class="newsheader">
                    <a href="ShowDongtaiDetailServlet?d_id=${dongtai.id }"><b>【${dongtai.title}】</b></a>
                    <span>发布时间:<fmt:formatDate value="${dongtai.createtime }" pattern="yyyy年MM月dd日HH点mm分" /></span>
                </h2>
<%--                <a href="ShowDongtaiDetailServlet?d_id=${dongtai.id }"><p>${dongtai.content}</p></a>--%>
<%--                <div class="author"><p>--%>
<%--                </p></div>--%>

<%--            </div>--%>

        </div>

        </c:forEach>
        <br>
        <div class="fanye">
        <a href="DongtaiIndexServlet?currentPage=1">首页</a>

        <a href="DongtaiIndexServlet?currentPage=${currentPage==1? 1 : currentPage-1}">上一页</a>
        ${currentPage}/${maxPage}
        <a href="DongtaiIndexServlet?currentPage=${currentPage==maPage? maxPage : currentPage+1}">下一页</a>

        <a href="DongtaiIndexServlet?currentPage=${maxPage}">尾页</a>
        </div>

    </div>
</body>
</html>
