<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/6/26
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="./js/jquery-1.11.3.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/tab.css" type="text/css">
</head>
<body>
<jsp:include page="HEADER.jsp"/>
<jsp:include page="LEFT.jsp"/>
<div class="personalcontent">
<div role="tabpanel">
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#ziliao" data-toggle="tab" role="tab" aria-controls="tab1">反馈中心</a></li>
        <li role="presentation"><a href="#dafu" data-toggle="tab" role="tab" aria-controls="tab2">查看答复</a></li>
<%--        <li role="presentation"><a href="#touxiang" data-toggle="tab" role="tab" aria-controls="tab3">头像更改</a></li>--%>
    </ul>
    <div id="tabContent1" class="tab-content">
        <div role="tabpanel" class="tab-pane fade in active" id="ziliao">
            <div class="fankuibox">
                <form action="SixinAddServlet" method="post">
                    <label for="" >选择管理员:</label>


                    <select name="id" class="guanli">
                        <c:forEach items="${requestScope.list }" var="adminuser">
                        <option value="${adminuser.id }" >${adminuser.nickname }</option>
                        </c:forEach>
                    </select>

                    <br>
                    <label for="">反&nbsp;馈&nbsp;内&nbsp;容:</label>
                    <textarea cols="60" rows="5" name="content"></textarea>
                    <br>
                    <input type="submit" style="height: 27px;width: 80px;margin-left: 76px;" value="提交反馈">
                </form>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane fade" id="dafu">
            <div>


                <c:forEach items="${requestScope.sixinlist }" var="sixin">
                    <h4>反&nbsp;馈&nbsp;内&nbsp;容:</h4>
                <div class="fankuicontent">
                    <ul class="huifu">
                        ${sixin.content }
                    </ul>
                    <h4>管理员答复:</h4>
                    <div >
                            ${sixin.reply}
                    </div>
                </div>
                </c:forEach>
                <a href="SixinAdminlistServlet?currentPage=1">首页</a>

                <a href="SixinAdminlistServlet?currentPage=${currentPage==1? 1 : currentPage-1}">上一页</a>
                ${currentPage}
                <a href="SixinAdminlistServlet?currentPage=${currentPage==maPage? maxPage : currentPage+1}">下一页</a>

                <a href="SixinAdminlistServlet?currentPage=${maxPage}">尾页</a>
            </div>
        </div>
<%--        <div role="tabpanel" class="tab-pane fade" id="touxiang">--%>
<%--            <div class="touxiang">--%>
<%--                <p>当前头像: <img src="img/3.jpg" alt=""></p>--%>
<%--                <form action="">--%>
<%--                    <p>更改头像路径:<input type="file" class="wenjian"></p>--%>
<%--                    <input type="submit" value="确定更改" style="height: 30px;width: 80px">--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>

    </div>
</div>
</div>
</body>
</html>
