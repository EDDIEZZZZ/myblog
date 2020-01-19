<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/7/4
  Time: 7:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>相册</title>
    <link rel="stylesheet" href="./css/index.css" type="text/css">
</head>
<body>

    <jsp:include page="HEADER.jsp"/>
    <jsp:include page="LEFT.jsp"/>
    <div class="content">
        <div class="welcome">
            <p>&nbsp;&nbsp;您好，欢迎您访问我们的小组博客！</p>
        </div>
        <br><br>

        <div class="album">
            <h2 class="newsheader"><b>相册</b></h2>

            <c:forEach items="${albumslist }" var="albums">
            <div class="photobox">
                <c:if test="${empty albums.photofirst }">
                    <li>
                        <a href="ShowAlbumsDetailServlet?d_id=${albums.id }">
                            <img src="img/no-photos.jpg" alt="相册封面"><p>${albums.name }</p>
                        </a>
                        <p><fmt:formatDate value="${albums.createtime }" pattern="yyyy年MM月dd日HH点mm分" /></p>
                    </li>
                </c:if>

                <c:if test="${not empty albums.photofirst }">
                    <li>
                        <a href="ShowAlbumsDetailServlet?d_id=${albums.id }">
                            <img src="${albums.photofirst }" alt="相册封面"> <p>${albums.name }(${albums.photocount })</p>
                        </a>
                        <span>${albums.author.nickname }<fmt:formatDate value="${albums.createtime }" pattern="yyyy年MM月dd日HH点mm分" /></span>
                    </li>
                </c:if>
            </div>
            </c:forEach>


        </div>
        <div class="fanye">
        <a href="AlbumsIndexServlet?currentPage=1">首页</a>

        <a href="AlbumsIndexServlet?currentPage=${currentPage==1? 1 : currentPage-1}">上一页</a>
        ${currentPage}/${maxPage}
        <a href="AlbumsIndexServlet?currentPage=${currentPage==maxPage? maxPage : currentPage+1}">下一页</a>

        <a href="AlbumsIndexServlet?currentPage=${maxPage}">尾页</a>
        </div>
    </div>

</body>
</html>
