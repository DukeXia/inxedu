<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/3
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<table border="1" width="1000" height="100%">
<tr>
    <td align="cneter">id</td>
    <td align="center">问卷标题</td>
    <td align="center">状态</td>
    <td align="center">更新时间</td>
    <td align="center">发布人</td>
    <td align="center">操作</td>
</tr>
<c:forEach items="${list}" var="result">
    <tr>
        <td>${result.id}</td>
        <td>${result.questionareId}</td>
    </tr>

</c:forEach>
</table>
</body>
</html>
