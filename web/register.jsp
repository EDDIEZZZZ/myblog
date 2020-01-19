<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,java.sql.*,com.sql.*,com.bean.*" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="./css/zhuce.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function checkForm(){
            var zhanghaotip = checkUserZhanghao();
            var nicknametip = checkUserNickname();
            var passtip = checkPassword();
            var conpasstip = ConfirmPassword();
            return zhanghaotiptip && nicknametip && passtip && conpasstip;
        }


        function checkUserZhanghao(obj){
            var userzhanghao=obj.value;
            var errzhanghao = document.getElementById('zhanghaoErr');
            var zhanghaonumber = /^[1-9][0-9]{4,8}$/;
            /*5到8位数字*/
            if(!(zhanghaonumber.test(userzhanghao))){
                obj.style.border="1px solid red";
                errzhanghao.style.color="red";
                errzhanghao.innerHTML="账号不合规范，请重新输入！"
                return false;
            }else{
                obj.style.border="1px solid #ccc";
                errzhanghao.style.color="#000000";
                errzhanghao.innerHTML="OK"
                return true;
            }
        }

        function checkUserNickname(obj){
            var usernickname=obj.value;
            var errnickname = document.getElementById('nicknameErr');
            var nicknamenumber = /^[a-zA-Z0-9_-]{4,8}$/;
            /*4到8位（字母，数字，下划线，减号）*/
            if(!(nicknamenumber.test(usernickname))){
                obj.style.border="1px solid red";
                errnickname.style.color="red";
                errnickname.innerHTML="昵称不合规范，请重新输入！"
                return false;
            }else{
                obj.style.border="1px solid #ccc";
                errnickname.style.color="#000000";
                errnickname.innerHTML="OK"
                return true;
            }
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
        function ConfirmPassword(obj){
            var userConPassword=obj.value;
            var userpasswd = document.getElementById('userPasword');
            var userConPassword = document.getElementById('userConfirmPasword');
            var errConPasswd = document.getElementById('conPasswordErr');
            if((userpasswd.value)!=(userConPassword.value)||userConPassword.value.length == 0){
                obj.style.border="1px solid red";
                errConPasswd.style.color="red";
                errConPasswd.innerHTML="上下密码不一致"
                return false;
            }else{
                obj.style.border="1px solid #ccc";
                errConPasswd.style.color="#000000";
                errConPasswd.innerHTML="输入密码一致"
                return true;
            }
        }
    </script>
</head>
<body>

<div class="all">
    <h2>用户注册</h2>
    <form id="form" name="form" method="post" action="checkreg.jsp" onSubmit="return checkForm()">

<%--                <p>--%>
<%--                    <input type="text" placeholder="请输入5-10位数字账号" onBlur="checkUserZhanghao(this)"  class="zh" id="userZhanghao" name="id"/>--%>

<%--                    <span class="sp" id="zhanghaoErr"></span>--%>
<%--                </p>--%>


        <p>
            <input type="text" placeholder="请输入4-8位用户昵称" onBlur="checkUserNickname(this)"  class="zh" id="userNickname" name="name"/>

            <span class="sp" id="nicknameErr"></span>
        </p>


        <p>
            <input type="text" onBlur="checkPassword(this)" placeholder="请输入以字母开头6-15位密码" class="pass" id="userPasword"/>

            <span class="sp" id="passwordErr"></span>
        </p>

        <p>
            <input type="password" onBlur="ConfirmPassword(this)"  placeholder="请重新输入密码" class="pass" id="userConfirmPasword" name="pass"/>

            <span class="sp" id="conPasswordErr"></span>
        </p>
        <p>
            <select name="question" id="" class="question">
                <option value="wenti1">你的生日是什么时候</option>
                <option value="wenti2">你喜欢的颜色是什么</option>
                <option value="wenti3">你的家乡在哪里</option>
                <option value="wenti4">你几年多少岁</option>
            </select>
        </p>
        <p>
            <input type="text" placeholder="请输入密保答案" onBlur="checkUsermibaoda"  class="zh" name="answer"/>

            <span class="sp" ></span>
        </p>

        <input type="submit" value="立即注册" class="tijiao">

    </form>
</div>
</body>
</html>
