<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/23
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:useBean id="user" class="com.bean.User"/>
    <jsp:setProperty name="user" property="*" />
    <%
        Connection conn=ConnDB.getConn();
        //查找用户提交的账号是否已经存在,如果能找到记录，说明该账户已存在，不能注册
        String sql="select * from user where u_name=?";
//        String sql="select * from user where u_id=?";
        PreparedStatement pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, user.getName());
//        pstmt.setInt(1, user.getId());
        ResultSet rs=pstmt.executeQuery();
        if(rs.next()){
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().print("<script>alert('该用户名已被注册，请重新注册'); location.href='register.jsp'</script>");
//            out.print("该用户名已存在,请<a href='register.jsp'>重新注册</a>");
        }else{
            //将账号密码存入user表
            sql="insert into user(u_name,u_pass,u_question,u_answer) values(?,?,?,?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPass());
            pstmt.setString(3,user.getQuestion());
            pstmt.setString(4,user.getAnswer());
//            pstmt.setInt(5,user.getId());
            pstmt.executeUpdate();

    %>
<%--    注册成功，5秒后跳转到登陆页面--%>

    <%
//            response.setHeader("refresh","5;url=login.jsp");
            response.getWriter().print("<script>alert('注册成功，请牢记密保问题与答案'); location.href='login.jsp'</script>");
        }

    %>
</body>
</html>
