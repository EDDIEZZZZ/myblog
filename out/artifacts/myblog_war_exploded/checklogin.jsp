<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*"%>
<html>
<head>
    <title>Title</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/jquery-3.4.0.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</head>
<body>
<

<jsp:useBean id="user" class="com.bean.User"/>

<%--映射，自动将页面参数名与javabean类中的属性名比较，如果一致，则自动将参数值赋值给对象的该属性 --%>
<jsp:setProperty name="user" property="*" />
<%


    Connection conn=ConnDB.getConn();
    //使用用户提交的账号密码作为条件去查询user数据表，如果能找到记录，说明该账户密码匹配，可以登录
    String sql="select * from user where u_name=? and u_pass=?";
    PreparedStatement pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, user.getName());
    pstmt.setString(2, user.getPass());
    ResultSet rs=pstmt.executeQuery();
    //next方法下移记录指针，如果有记录，指向到该记录，返回true，如果无记录，返回false
    if(rs.next()){
        session.setAttribute("loginuser", user.getName());
        String login=request.getParameter("login");

        //查找登录状态是否被保存
        Cookie thisCookie=null;
        //cookie是否被找到的标记
        boolean cookieFound=false;
        //获取当前网站在电脑上保存的所有cookie
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            for(int i=0;i<cookies.length;i++){
                thisCookie=cookies[i];
                if(thisCookie.getName().equals("loginuser")){
                    //cookie被找到时标记
                    cookieFound=true;
                    break;
                }
            }

        }
        //如果你选择的保存自动登录状态，1、已存在cookie，用你的账号覆盖原来的信息，2、没有cookie，创建cookie并保存
        if("yes".equals(login)){
            //1、已存在cookie，用你的账号覆盖原来的信息
            if(cookieFound){
                thisCookie=new Cookie("loginuser",user.getName());
                thisCookie.setMaxAge(60*60*24*365);
                response.addCookie(thisCookie);
                //2、没有cookie，创建cookie并保存
            }else{
                Cookie c=new Cookie("loginuser",user.getName());
                c.setMaxAge(60*60*24*365);
                response.addCookie(c);
            }
            //如果你没有选择自动保存，1、已存在cookie，删除它 ，2、	 没有cookie，不做操作
        }else{
            //1、已存在cookie，删除它
            if(cookieFound){
                thisCookie.setMaxAge(0);
                response.addCookie(thisCookie);
            }

        }

        out.print("登录成功");
    }else{
        out.print("账号或密码错误,请<a href='login.jsp'>重新登录</a>");

    }
%>
</body>
</html>
