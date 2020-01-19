<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>管理员主页</title>
    <link rel="stylesheet" href="../css/houtai.css" type="text/css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/fileinput.min.js"></script>
    <script src="../js/fileinput_locale_zh.js"></script>
</head>
<body>
<jsp:include page="admin_HEAD.jsp" />
<jsp:include page="admin_LEFT.jsp"/>
<!--	内容-->
<div class="content">
    <div class="titlename"><p>当前位置:查看动态</p></div>
    <div class="fabu">已发布动态</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">标题</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
        <c:forEach items="${dongtailist}" var="dongtai">
            <c:if test="${dongtai.is_used==true}">
                <tr>
                    <td height="40">${dongtai.id }</td>
                    <td>${dongtai.title }</td>
                    <td>${dongtai.createtime }</td>
                    <td>&nbsp;<a href="DongtaiDetailServlet?d_id=${dongtai.id }" class="anniu">查看详情</a>
                        &nbsp;&nbsp;<a href="DongtaiPreUpdateServlet?d_id=${dongtai.id }" class="anniu">修改</a>
                        &nbsp;&nbsp;<a href="DongtaiDeleteServlet?d_id=${dongtai.id }" class="anniu">删除</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
    <div class="shanchu">已删除动态</div>
    <table>
        <tbody>
        <tr class="tabtitle">
            <th width="54" height="39" scope="col">ID</th>
            <th width="256" scope="col">标题</th>
            <th width="282" scope="col">发布时间</th>
            <th width="299" scope="col">操作</th>
        </tr>
        <c:forEach items="${dongtailist}" var="dongtai">
            <c:if test="${dongtai.is_used==false}">
                <tr>
                    <td height="40">${dongtai.id }</td>
                    <td>${dongtai.title }</td>
                    <td>${dongtai.createtime }</td>
                    <td>&nbsp;<a href="DongtaiDetailServlet?d_id=${dongtai.id }" class="anniu">查看详情</a>
                        &nbsp;&nbsp;<a href="DongtaiPreUpdateServlet?d_id=${dongtai.id }" class="anniu">修改</a>&nbsp;&nbsp;
                        <a href="DongtaiUnDeleteServlet?d_id=${dongtai.id }" class="anniu">恢复</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
