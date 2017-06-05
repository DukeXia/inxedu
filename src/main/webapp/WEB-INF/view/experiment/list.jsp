<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/13
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
        table tr td{
            border: 1px solid
        }
    </style>
</head>
<body>
<form action="/admin/experiment/findByCourseName" id="searchForm">
    <input type="hidden" id="pageCurrentPage" name="page.currentPage" value="1">
    实验课名称：<input  name="courseName" value="${courseName}">
    <input type="submit" value="查询">
    <a href="/admin/experiment/toEdit/0">添加</a>
    <a href="/admin/experiment/clear" onclick="clearAllExperiment()">清空</a>
    <a href="/admin/excelSurvey/toExperimentImport">导入</a>
</form>
<table style="width: 100%">
    <tr>
        <td align="center">实验课名称</td>
        <td  align="center">开课单位</td>
        <td  align="center">实验班级</td>
        <td  align="center">指导教师</td>
        <td  align="center">评价总数</td>
        <td  align="center">平均分</td>
        <td  align="center">操作</td>
    </tr>
    <c:forEach var="experiment" items="${list}">
    <tr>
        <td  align="center">
            ${experiment.courseName}
        </td>
        <td  align="center">${experiment.school}</td>
        <td  align="center">${experiment.labClassName}</td>
        <td  align="center">${experiment.teacher}</td>
        <td  align="center">${experiment.number}</td>
        <td  align="center">${experiment.average}</td>

        <td  align="center">

        <a href="/admin/experiment/toEdit/${experiment.id}">编辑</a>
        <a href="javascript:void(0)" onclick="deleteExperiment('${experiment.id}')">删除</a>
         <a href="/admin/experiment/voteInfo/${experiment.id}">评论详情</a>
        </td>
    </tr>
    </c:forEach>
</table>
<jsp:include page="/WEB-INF/view/common/admin_page.jsp"/>

<script type="text/javascript">
    function deleteExperiment(id) {
        if(confirm("你确定要删除吗？")){
            location.href="/admin/experiment/delete?id="+id;
        }else {
            return false;
        }
    }
    function clearAllExperiment() {
        if(confirm("你确定要清空吗？清空以后不能回复"))
        {
            location.href="/admin/experiment/clear";
        }else {
            return false;
        }
    }
</script>
</body>
</html>
