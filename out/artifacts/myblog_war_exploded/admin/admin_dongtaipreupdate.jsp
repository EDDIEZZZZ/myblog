<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/23
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<html>
<head>
    <title>动态修改</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="admin_HEAD.jsp"/>
<jsp:include page="admin_LEFT.jsp" />

<div class="content">
    <div class="fbdongtai">
        <h4>发布动态</h4>
        <form action="DongtaiUpdateServlet" method="post">
            <input type="hidden" name="id" value="${dongtaidetail.id }">
            <p>请输入标题：<input type="text" name="title" value="${dongtaidetail.title }"> </p>
            <p>请输入内容：<textarea rows="10"  cols="100" name="content" >${dongtaidetail.content }</textarea></p>
            <p><input type="submit" value="修改" class="btn btn-primary"/></p>
        </form>
    </div>
</div>

</body>
</html>
