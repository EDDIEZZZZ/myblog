<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/23
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>动态细节</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="admin_HEAD.jsp" />

<jsp:include page="admin_LEFT.jsp" />

<div class="content">
    <div class="fbdongtai">
        <h1>${dongtaidetail.title }</h1>
        <div>作者：${dongtaidetail.author.nickname}&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${dongtaidetail.createtime }</div>
        <div>
            <p style="font-size:50px">${dongtaidetail.content }</p>
        </div>
        <a onClick="javascript:history.back(-1);">返回</a>
    </div>
</div>

</body>
</html>
