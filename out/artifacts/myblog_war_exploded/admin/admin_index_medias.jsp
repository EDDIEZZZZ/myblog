<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/20
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>相册详情主页</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/fileinput.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="admin_HEAD.jsp" />

<jsp:include page="admin_LEFT.jsp" />

<div class="content">
    <div class="fbdongtai">
    <div class="fabu">已发布视频</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">视频媒体名称</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
        <c:forEach items="${mediaslist}" var="medias">
            <c:if test="${medias.is_used==true}">
                <tr>
                    <td height="40">${medias.id}</td>
                    <td>${medias.name }</td>
                    <td>${medias.createtime }</td>
                    <td>&nbsp;<a href="MediasDetailServlet?d_id=${medias.id }" class="anniu">查看视频</a>
                        &nbsp;&nbsp;<a href="MediasDeleteServlet?d_id=${medias.id }" class="anniu">删除</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div class="shanchu">已删除视频媒体</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">视频名称</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
        <c:forEach items="${mediaslist}" var="medias">
            <c:if test="${medias.is_used==false}">
                <tr>
                    <td height="40">${medias.id }</td>
                    <td>${medias.name }</td>
                    <td>${medias.createtime }</td>
                    <td>&nbsp;<a href="MediasDetailServlet?d_id=${medias.id }" class="anniu">查看视频</a>&nbsp;&nbsp;
                        <a href="MediasUnDeleteServlet?d_id=${medias.id }" class="anniu">恢复</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    </div>
</div>
</body>
</html>
