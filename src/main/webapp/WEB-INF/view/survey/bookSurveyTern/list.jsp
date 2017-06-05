<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: 梁自强
  Date: 2017/5/26
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程学期评价列表</title>
</head>
<body>
<form action="/admin/bookSurveyTerm/selectByTitle" method="POST">
    <input type="hidden" name="currentPage" value="1">
    标题：<input type="text" name="title" value="${title}"/>
    <input type="submit" value="查询">
    <a href="/admin/bookSurveyTerm/toEdit?id=0">添加</a>
</form>
<div>
    <table width="100%" style="align-content: center">
        <tr>
            <td>标题</td>
            <td>学期</td>
            <td>创建时间</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list}" var="bookSurveyTerm">
            <td>${bookSurveyTerm.title}</td>
            <td>${bookSurveyTerm.term}</td>
            <td>
            <fmt:formatDate value="${bookSurveyTerm.createDate}" pattern="yyyy-MM-dd"/>
            </td>
            <td>
                <a href="#" onclick="editBookTerm('${bookSurveyTerm.id}')">编辑</a>
                <a href="#" onclick="deleteBooSurveyTerm('${bookSurveyTerm.id}')">删除</a>
                <a href="/admin/bookSurveyTerm/bookSurveyList?id=${bookSurveyTerm.id}">教材评价</a>
            </td>
        </c:forEach>
    </table>
    <jsp:include page="/WEB-INF/view/common/admin_page.jsp" />
</div>
<script type="text/javascript">
    function deleteBooSurveyTerm(id) {
        if(confirm("您确定删除吗?")){
            location.href="/admin/bookSurveyTerm/delete?id="+id;
        }
    }
    function editBookTerm(id) {
        location.href="/admin/bookSurveyTerm/toEdit?id="+id;
    }
</script>
</body>
</html>