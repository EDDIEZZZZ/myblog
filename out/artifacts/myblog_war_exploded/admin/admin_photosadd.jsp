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
    <title>照片添加</title>
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
    <div class="fbdongtai">

     <label for="" class="col-md-1 control-label">上传照片</label>
        <form class="form-horizontal required-validate" action="PhotosAddServlet" enctype="multipart/form-data" method="post" >
            <div class="form-group">
                请选择需要上传的相册：<select name="albumid" id="">
                <c:forEach items="${albumslist}" var="albums">
                        <option value="${albums.id}">${albums.name}</option>
                </c:forEach>

                </select>
            </div>
            <div class="form-group">
                <div class="col-md-10 tl th">
                    <input id="input-b3" name="input-b3[]" type="file" class="file"
                           multiple data-show-uplod="false" data-show-caption="true" data-msg-placeholder="上传">

                </div>
            </div>
            <div class="form-group text-center">
                <div class="col-md-10 col-md-offset-1">
                    <button type="submit" class="btn btn-primary btn-lg">上传</button>
                </div>

            </div>
        </form>
    </div>
</div>
</body>
</html>
