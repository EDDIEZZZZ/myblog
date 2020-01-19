<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/5/22
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="./css/login.css" rel="stylesheet" type="text/css">
</head>
<script>
    window.onload=function login() {
        var width = document.documentElement.clientWidth;
        var height = document.documentElement.clientHeight;
        for(var i=0; i<50; i++){
            var Star = document.createElement("p");
            document.body.appendChild(Star);
            var x = parseInt(Math.random() * width);
            var y = parseInt(Math.random() * height);
            Star.style.left = x + "px";
            Star.style.top = y + "px";
            var scale = Math.random() * 1.5;
            Star.style.transform = "scale("+ scale + "," + scale + ")";
            var rate = Math.random() * 7;
            Star.style.animationDelay = rate + "s";
        }
    }
</script>
<body>
<div class="login">
    <div class="login_hand"></div>
    <div class="login_centent">
        <div class="login_admin" onmouseover="login_admin(this)" id="admin">
            <div class="login_admin_hand">
                <div class="login_admin_box2">登&nbsp;&nbsp;录</div>
            </div>
            <form id="form" name="form" method="post" action="UserLoginServlet" onSubmit="return checkForm()">
                <div>
                    <div class="login_admin_box">
                        <input class="login_admin_centent" name="name" placeholder="用户名" maxlength="16" type="text" autocomplete="off" id="name" onchange="check()" />
                    </div>
                </div>
                <div class="login_admin_box1">
                    <input class="login_admin_centent" name="pass" placeholder="密码" maxlength="16" type="password" autocomplete="off" id="pass" onchange="check()" />
                </div>
                <span style="text-align: center;display:block;">还没注册吗？<a href="register.jsp" seclass="register-link">马上注册</a></span>
                <span style="text-align: center;display:block;">忘记密码？<a href=" reset.jsp">点击找回密码</a></span>
                <div>
                    <input class="login_admin_login" type="submit" value="登陆">
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
