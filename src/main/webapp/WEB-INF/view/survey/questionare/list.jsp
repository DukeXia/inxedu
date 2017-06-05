<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/1
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript"	src="/static/table/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctximg}/static/admin/survey/survey.js"></script>
</head>
<body>
<form action="" method="get">
    <a href="/admin/questionare/toEdit/0">添加</a>
</form>
<table border="1" width="1000" height="100%">
    <tr>
        <td align="cneter">序号</td>
        <td align="center">问卷标题</td>
        <td align="center">状态</td>
        <td align="center">更新时间</td>
        <td align="center">发布人</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${list}" var="questionare" varStatus="status">
        <tr>
            <td align="center">${status.index+(page.currentPage-1)*page.pageSize+1}</td>
            <td align="center">${questionare.title}</td>
            <td align="center">
        <c:if test="${questionare.state==1}">
            草稿
        </c:if>
        <c:if test="${questionare.state==2}">
            发布
        </c:if>
        <c:if test="${questionare.state==3}">
            关闭
        </c:if>
            </td>
            <td align="center">
                <fmt:formatDate value="${questionare.updateTime}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td align="center">${questionare.createMan}</td>
            <td align="center">
                <a href="/admin/questionare/toEditContent/${questionare.id}">编辑</a>
                <a href="/admin/questionare/delete?id=${questionare.id}">删除</a>
                <a  onclick="publish('${questionare.id}/${questionare.state}')";return false;>发布</a>
                <a href="#" onclick="closeSurvey('${questionare.id}/${questionare.state}')">关闭</a>
                <a href="/admin/questionare/showResult/${questionare.id}"> 显示结果</a>
            </td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="/WEB-INF/view/common/admin_page.jsp"/>
</body>
</html>
