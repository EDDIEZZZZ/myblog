<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<html>
<head>
    <title>处理添加动态</title>
</head>
<body>
<jsp:useBean id="dongtai" class="com.bean.Dongtai"/>
<jsp:setProperty name="dongtai" property="*" />

<%
    Adminuser adminusersql = (Adminuser) session.getAttribute("adminuser");
    Connection conn=ConnDB.getConn();
    //使用用户提交的账号密码作为条件去查询user数据表，如果能找到记录，说明该账户密码匹配，可以登录
    String sql="insert into  dongtai(d_title,d_content,d_author) values (?,?,?);";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, new String(dongtai.getTitle().getBytes("ISO-8859-1"),"UTF-8"));
    pstmt.setString(2, new String(dongtai.getContent().getBytes("ISO-8859-1"),"UTF-8"));
    pstmt.setInt(3,adminusersql.getId());
    pstmt.executeUpdate();
    out.print("发布成功,<a href='DongtaiListServlet'>返回首页</a>");
%>
</body>
</html>
