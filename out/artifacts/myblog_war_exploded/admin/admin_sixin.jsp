<%--
  Created by IntelliJ IDEA.
  User: EDDIE
  Date: 2019/7/4
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/fileinput.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.0.min.js"></script>
</head>
<body>
    <jsp:include page="admin_HEAD.jsp"/>
    <jsp:include page="admin_LEFT.jsp"/>
    <div class="content">
        <div class="titlename"><p>当前位置:私信反馈</p></div>
        <div class="fabu">未反馈私信</div>
        <table>
            <tbody>
            <tr class="tabtitle">
                <th width="54" height="39" scope="col">私信ID</th>
                <th width="256" scope="col">反馈内容</th>
                <th width="282" scope="col">发布时间</th>
                <th width="299" scope="col">操作</th>
            </tr>
            <c:forEach items="${sixinilist}" var="sixin">
                <c:if test="${sixin.is_new_a==true}">
                    <tr>
                        <td height="40">${sixin.id }</td>
                        <td>${sixin.content }</td>
                        <td>${sixin.createtime }</td>
                        <td>&nbsp;<a href="SixindetailServlet?s_id=${sixin.id }" class="anniu">回复反馈</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>

        <div class="fabu">已反馈私信</div>
        <table>
            <tbody>
            <tr class="tabtitle">
                <th width="54" height="39" scope="col">私信ID</th>
                <th width="256" scope="col">反馈内容</th>
                <th width="282" scope="col">发布时间</th>
                <th width="299" scope="col">操作</th>
            </tr>
            <c:forEach items="${sixinilist}" var="sixin">
                <c:if test="${sixin.is_new_a==false}">
                    <tr>
                        <td height="40">${sixin.id }</td>
                        <td>${sixin.content }</td>
                        <td>${sixin.createtime }</td>
                        <td>&nbsp;<a href="SixindetailServlet?s_id=${sixin.id }" class="anniu">回复反馈</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
