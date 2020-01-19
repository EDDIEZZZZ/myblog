<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/21
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="admin_HEAD.jsp" />

<jsp:include page="admin_LEFT.jsp" />

<div class="content">
    <div class="fbdongtai">
        <h4>新建视频媒体</h4>
        <form action="MediasAddServlet" method="post">
            <p>	请输入新建视频媒体名：<input type="text" name="name"> </p>
            <p><input type="submit" value="创建" class="btn btn-primary"/></p>
        </form>
    </div>
</div>

</body>
</html>