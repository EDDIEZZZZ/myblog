<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
  <meta charset="utf-8">
  <title>myblog</title>
  <link rel="stylesheet" href="./css/index.css" type="text/css">
</head>

<body>
<div class="all">

  <jsp:include page="HEADER.jsp" />

  <jsp:include page="LEFT.jsp"/>

  <div class="content">
    <div class="welcome">
      <p>&nbsp;&nbsp;您好，欢迎您访问我们的小组博客！</p>
    </div>

    <!--相册-->
    <div class="albumsbox">
      <div class="albums">
        <h2 class="albumstitle"><span><a href="AlbumsIndexServlet">更多</a></span><b>相册</b></h2>
      </div>
          <div class="photo">
            <ul>
              <c:forEach items="${albumslist }" var="albums">
                <c:if test="${empty albums.photofirst }">
                  <li>
                    <a href="ShowAlbumsDetailServlet?d_id=${albums.id }">
                      <img src="img/no-photos.jpg" alt="相册封面"><p>${albums.name }(${albums.photocount })</p>
                    </a>
                    <span><fmt:formatDate value="${albums.createtime }" pattern="yyyy年MM月dd日HH点mm分" /></span>
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
              </c:forEach>
            </ul>
          </div>
        </div>

    <!--VLOG-->
    <div class="newsbox">
      <div class="news">
        <h2 class="newstitle"><span><a href="MediasIndexServlet">更多</a></span><b>VLOG</b></h2>
        <ul>
          <c:forEach items="${mediaslist }" var="me">
            <a href="ShowMediasDetailServlet?d_id=${me.id }">
              <li>${me.name }
                <span><fmt:formatDate value="${me.createtime }" pattern="yyyy年MM月dd日HH点mm分" />&nbsp;</span>
              </li>
            </a>
          </c:forEach>
        </ul>
      </div>
    </div>

    <!--日志-->
    <div class="newsbox">
      <div class="news">
        <h2 class="newstitle"><span><a href="DongtaiIndexServlet">更多</a></span><b>博客</b></h2>
          <ul>
            <c:forEach items="${dongtailist }" var="dt">
              <a href="ShowDongtaiDetailServlet?d_id=${dt.id }">
                <li>${dt.title }
                  <span><fmt:formatDate value="${dt.createtime }" pattern="yyyy年MM月dd日HH点mm分" />&nbsp;&nbsp;&nbsp;&nbsp;作者:${dt.author.nickname }</span>
                </li>
              </a>
          </c:forEach>
        </ul>
      </div>
    </div>

  </div>
</div>
</body>
</html>

