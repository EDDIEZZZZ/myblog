<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/7/4
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/fileinput.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
</head>
<body>

<jsp:include page="admin_HEAD.jsp"/>

<jsp:include page="admin_LEFT.jsp"/>

<div class="content">
    <div class="fbdongtai">
        <div class="sixin">
            <c:forEach items="${requestScope.sixinlist}" var="sixin">
                <p>反馈内容:${sixin.content}</p>
                <hr>
                <form action="SixinHuifuServlet" method="post">
                    <input type="hidden" name="id" value="${sixin.id }">
                    <textarea cols="70" rows="8" placeholder="请输入回复内容" name="reply"></textarea>
                    <br><br>
                    <input type="submit" value="回复" class="huifu">
                </form>
            </c:forEach>
        </div>
    </div>
</div>

</body>
</html>
