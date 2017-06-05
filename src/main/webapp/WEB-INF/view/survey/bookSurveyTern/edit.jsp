<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/26
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑教材评价学期</title>
    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
</head>
<body>
<form action="/admin/bookSurveyTerm/edit" method="POST">
    <input type="hidden" name="type" value="${bookSurveyTerm.id>0}">
    <input type="hidden" name="id" value="${bookSurveyTerm.id}">
  标题：<input type="text" name="title" value="${bookSurveyTerm.title}" data-rule="required"><br>
   学期: <input type="text" name="term" value="${bookSurveyTerm.term}" placeholder="如:2016-2017-2" data-rule="required"><br>
    <input type="submit" value="提交">
    <input type="button" onclick="back()" value="返回">
</form>
<script type="text/javascript">
    function back(){
        window.history.back(-1);
    }
</script>
</body>
</html>
