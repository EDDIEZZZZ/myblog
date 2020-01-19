<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/22
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="./css/zhuce.css" rel="stylesheet" type="text/css">
    <script>
        function checkForm(){
            var passtip = checkPassword();
            return  passtip;
        }
        function checkPassword(obj){
            var userpasswd=obj.value;
            var errPasswd = document.getElementById('passwordErr');
            var pattern = /^[a-zA-Z]([a-zA-z0-9]){6,15}$/;
            if(!(pattern.test(userpasswd))){
                obj.style.border="1px solid red";
                errPasswd.style.color="red";
                errPasswd.innerHTML="密码不合规范"
                return false;
            }else{
                obj.style.border="1px solid #ccc";
                errPasswd.style.color="#000000";
                errPasswd.innerHTML="OK"
                return true;
            }
        }
    </script>
</head>
<body>
<div class="all">
    <h2>重设密码</h2>
<form action="ResetPassServlet" method="post">
    <input type="text" name="u_id" style="width: 300px;height: 35px" placeholder="请输入你的账号">
<%--    <input type="text"  value="${us.u_id}">--%>
    <select name="u_question" class="question">
        <%--            <input type="text" placeholder="请输入密保问题" onBlur="checkUsermibao"  class="zh" name="question"/>--%>
            <option value="wenti1">你的生日是什么时候</option>
            <option value="wenti2">你喜欢的颜色是什么</option>
            <option value="wenti3">你的家乡在哪里</option>
            <option value="wenti4">你几年多少岁</option>
        <%--            <span class="sp" ></span>--%>
    </select>
    <input type="text" name="u_answer" style="width: 300px;height: 35px" placeholder="请输入密保答案">
    <input type="text" name="u_pass" id="" style="width: 300px;height: 35px" onBlur="checkPassword(this)" class="pass" id="userPasword" placeholder="请输入以字母开头6-15位新密码"/>
    <span class="sp" id="passwordErr"></span>
    <input type="submit" value="确认" class="tijiao">
</form>
</div>
</body>
</html>
