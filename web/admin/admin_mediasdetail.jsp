<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/21
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>视频详情</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/fileinput.min.js"></script>
    <script src="../js/fileinput_locale_zh.js"></script>

</head>
<body>
<jsp:include page="admin_HEAD.jsp" />

<jsp:include page="admin_LEFT.jsp" />

<div class="content">
   <div class="fbdongtai">
    <c:forEach items="${mediaslist }" var="v">
        <p>视频名字：</p><p>${v.title }</p>
        <video width="320" height="240" controls>
            <source src="../${v.url}" type="video/mp4">
            <source src="../${v.url}" type="video/ogg">
            <source src="../${v.url}" type="video/webm">
            <object data="../${v.url}" width="320" height="240">
                <embed src="../${v.url}" width="320" height="240">
            </object>
        </video>
    </c:forEach>
   </div>
</div>

</body>
</html>
