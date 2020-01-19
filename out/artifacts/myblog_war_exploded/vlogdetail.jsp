<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/24
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">
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

            <div class="vd">
            <c:forEach items="${mediaslist }" var="v">
<%--                <p>视频名字：</p><p>${v.title }</p>--%>
                <video width="850" height="635" controls>
                    <source src='${v.url}' type="video/mp4">
                    <object data="${v.url}" width="320" height="240">
                        <embed src="${v.url}" width="320" height="240">
                    </object>
                </video>
            </c:forEach>
            </div>

        </div>

    </div>
</body>
</html>
