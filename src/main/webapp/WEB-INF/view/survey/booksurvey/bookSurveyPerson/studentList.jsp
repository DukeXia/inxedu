<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/15
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生调查详细</title>
    <style type="text/css">
        table tr td{
            border: 1px solid;
        }
    </style>
</head>
<body>
<table style="border: 1px solid " width="100%">
    <tr>
        <td align="center">姓名</td>
        <td align="center">学号</td>
        <td align="center">总分</td>
        <td align="center">操作</td>
    </tr>
   <c:forEach items="${list}" var="s">
      <tr>
        <td align="center">${s.studentName}</td>
        <td align="center">${s.studentNo}</td>
        <td align="center">${s.score}</td>
        <td align="center">
        <a href="/admin/bookSurvey/searchInfo/0?id=${s.id}">调查详情</a>
        </td>
        </tr>
    </c:forEach>
</table>
        <form action="${ctx}/admin/bookSurvey/voteInfo/${id}/1" id="searchForm">
             <input type="hidden" id="currentPage" name="currentPage">
            <jsp:include page="/WEB-INF/view/common/admin_page.jsp"/>
        </form>
</body>
</html>
