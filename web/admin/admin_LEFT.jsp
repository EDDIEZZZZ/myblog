<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/8
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/houtai.css" type="text/css">
</head>
<body>

<div class="left">
    <p></p>
    <ul>
        <dt>⚪动态管理</dt>
        <a href="DongtaiListServlet"><li>查看动态</li></a>
        <a href="admin_adddongtai.jsp"><li>发布动态</li></a>
        <dt>⚪相册管理</dt>
        <a href="AlbumsListServlet"><li>查看相册</li></a>
        <a href="admin_albumsadd.jsp"><li>新建相册</li></a>
        <a href="AlbumsListForPhotosServlet"><li>上传照片</li></a>
        <dt>⚪视频管理</dt>
        <a href="MediasListServlet"><li>查看视频</li></a>
        <a href="admin_mediasadd.jsp"><li>新建媒体</li></a>
        <a href="MediasListForVediosServlet"><li>上传视频</li></a>
        <dt>⚪私信管理</dt>
        <a href="SixinListServlet"><li>私信查看</li></a>
    </ul>
</div>
</body>
</html>
