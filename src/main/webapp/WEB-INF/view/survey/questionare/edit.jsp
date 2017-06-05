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
    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
</head>
<body>
<form action="/admin/questionare/edit">
<input type="hidden" name="id" value="${id}">
    <input type="hidden" name="type" value="${id>0}">
   标题： <input type="text" name="title" data-rule="required;"><br>
   描述 :<br>
    <textarea  name="description">${questionare.description}</textarea><br>
   是否匿名：是 <input type="radio" name="flag" value="1" checked>  否<input type="radio" name="flag1" value="0"><br>
    <input type="submit"  value="提交"/>
    <input type="button" id ="a" value="返回">
</form>
<script type="text/javascript">
    document.getElementById("a").onclick= function(){
        window.history.back(-1);
    }
</script>
</body>
</html>
