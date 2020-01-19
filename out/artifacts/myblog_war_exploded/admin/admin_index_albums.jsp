<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>相册详情主页</title>
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
    <div class="titlename"><p>当前位置:查看相册</p></div>
    <div class="fabu">已发布相册</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">相册名称</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
<c:forEach items="${albumslist}" var="albums">
    <c:if test="${albums.is_used==true}">
        <tr>
            <td height="40">${albums.id}</td>
            <td>${albums.name }（${albums.photocount }）</td>
            <td>${albums.createtime }</td>
            <td>&nbsp;<a href="AlbumsDetailServlet?d_id=${albums.id }" class="anniu">查看相片</a>
                &nbsp;&nbsp;<a href="AlbumsPreUpdateServlet?d_id=${albums.id }" class="anniu">修改相册名</a>
                &nbsp;&nbsp;<a href="AlbumsDeleteServlet?d_id=${albums.id }" class="anniu">删除</a>
            </td>
        </tr>
    </c:if>
</c:forEach>
        </tbody>
    </table>
    <div class="shanchu">已删除相册</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">相册名称</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
<c:forEach items="${albumslist}" var="albums">
    <c:if test="${albums.is_used==false}">
        <tr>
            <td height="40">${albums.id }</td>
            <td>${albums.name }（${albums.photocount }）</td>
            <td>${albums.createtime }</td>
            <td>&nbsp;<a href="AlbumsDetailServlet?d_id=${albums.id }" class="anniu">查看相片</a>&nbsp;&nbsp;
                <a href="AlbumsPreUpdateServlet?d_id=${albums.id }" class="anniu">修改相册名</a>&nbsp;&nbsp;
                <a href="AlbumsUnDeleteServlet?d_id=${albums.id }" class="anniu">恢复</a>
            </td>
        </tr>
    </c:if>
</c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
