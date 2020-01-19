<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/13
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>相册名修改</title>
</head>
<body>

<jsp:include page="admin_HEAD.jsp"/>

<jsp:include page="admin_LEFT.jsp" />


<div class="content">
    <div class="fbdongtai">
        <h4>发布动态</h4>
        <form action="AlbumsUpdateServlet" method="post">

            <input type="hidden" name="id" value="${param.d_id }">
            <p>请输入新的相册名：<input type="text" name="name" value="${albumsdetail.name }"> </p>
            <p><input type="submit" value="修改" class="btn btn-primary"/></p>

        </form>
    </div>
</div>

</body>
</html>
