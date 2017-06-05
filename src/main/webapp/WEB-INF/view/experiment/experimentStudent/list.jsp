<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/15
  Time: 13:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生评价</title>
    <style type="text/css">
        table tr td{
            border: 1px solid
        }
      /*  td{
            align-content:center;
        }
*/
    </style>
</head>
<body>
<table style="width: 100%">
    <tr>
        <td align="center">学号</td>
        <td align="center">课程名</td>
        <td align="center">开课学院</td>
        <td align="center">指导教师</td>
        <td align="center">实验室地址</td>
        <td align="center">总分</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${list}" var="experimentStudent">
        <tr>
            <td align="center">${experimentStudent.studentNo}</td>
            <td align="center">${experimentStudent.courseName}</td>
            <td align="center">${experimentStudent.school}</td>
            <td align="center">${experimentStudent.teacher}</td>
            <td align="center">${experimentStudent.labAddress}</td>
            <td align="center">${experimentStudent.sum}</td>
            <td align="center">
            <a href="/admin/experiment/searchInfo?id=${experimentStudent.id}">调查详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<form action="${ctx}/admin/experiment/voteInfo/${id}" id="searchForm">
    <input type="hidden" id="currentPage" name="currentPage">
<jsp:include page="/WEB-INF/view/common/admin_page.jsp"/>
</form>
</body>
</html>
