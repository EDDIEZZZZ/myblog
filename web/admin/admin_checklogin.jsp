<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<html>
<head>
    <title>管理员检查登录</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<jsp:useBean id="adminuser" class="com.bean.Adminuser"/>
<jsp:setProperty name="adminuser" property="*" />
<%
    Connection conn=ConnDB.getConn();
    //使用用户提交的账号密码作为条件去查询user数据表，如果能找到记录，说明该账户密码匹配，可以登录
    String sql="select * from adminuser where a_name=? and a_pass=? and is_used=true";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, adminuser.getName());
    pstmt.setString(2, adminuser.getPass());
    ResultSet rs=pstmt.executeQuery();
    //next方法下移记录指针，如果有记录，指向到该记录，返回true，如果无记录，返回false
    if(rs.next()){
        Adminuser adminusersql=new Adminuser();
        adminusersql.setId(rs.getInt("a_id"));
        adminusersql.setName(rs.getString("a_name"));
        adminusersql.setPass(rs.getString("a_pass"));
        adminusersql.setNickname(rs.getString("a_nickname"));
        adminusersql.setCreatetime(rs.getTimestamp("createtime"));
        adminusersql.setIs_used(rs.getBoolean("is_used"));

        session.setAttribute("adminuser", adminusersql);
        session.setAttribute("adminflag", "1");
        response.sendRedirect("DongtaiListServlet");
    }else{
        out.print("账号或密码错误,请<a href='login.jsp'>重新登录</a>");

    }
%>
</body>
</html>
