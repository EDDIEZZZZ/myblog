<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/24
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>VLOG</title>
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
                <c:forEach items="${mediaslist }" var="medias">
                <div class="vlog">
                    <div class="newsvlog">

                            <h2 class="newsin">
                                <a href="ShowMediasDetailServlet?d_id=${medias.id }"><b>${medias.name }</b></a>
                                <span>发布时间:<fmt:formatDate value="${medias.createtime }" pattern="yyyy年MM月dd日HH点mm分" /></span>
                            </h2>

                    </div>
                </div>
                    <br>
                </c:forEach>
                <div class="fanye">
                <a href="MediasIndexServlet?currentPage=1">首页</a>

                <a href="MediasIndexServlet?currentPage=${currentPage==1? 1 : currentPage-1}">上一页</a>
                ${currentPage}/${maxPage}
                <a href="MediasIndexServlet?currentPage=${currentPage==maPage? maxPage : currentPage+1}">下一页</a>

                <a href="MediasIndexServlet?currentPage=${maxPage}">尾页</a>
                </div>
            </div>

    </div>
</body>
</html>
