<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/14
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑实验课教材</title>

    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
</head>
<body>
<form action="/admin/experiment/edit">
    <input type="hidden" value="${experiment.id}" name="id">
    实验课名称 :<input name="courseName" value="${experiment.courseName}" data-rule="required;"><br>
    开课单位：<input name="school" type="text" value="${experiment.school}"  data-rule="required;"><br>
    实验班级：<input name="labClassName" type="text" value="${experiment.labClassName}"  data-rule="required;"><br>
    指导教师：<input name="teacher" type="text" value="${experiment.teacher}"  data-rule="required;"><br>
    实验室地址<input name="labAddress" type="text" value="${experiment.labAddress}"  data-rule="required;"><br>
    备注:<textarea name="memo">${experiment.memo}</textarea><br>
    <input type="submit" value="提交">
    <input type="button" id="a" onclick="back()" value="返回">
</form>
<script type="text/javascript">
    document.getElementById("a").onclick= function(){
        window.history.back(-1);
    }
</script>
</body>
</html>
