<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>创建学生</title>
    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
</head>
<body>
<form action="/admin/user/createUser" id="myform">
学号：<input type="text" name="no" value="${user.no}" data-rule="required;"><br>
身份证号：<input type="text" name="idCard" value="${user.idCard}" data-rule="required;"><br>
姓名：<input type="text" name="userName" value="${user.userName}" data-rule="required;"><br>
班级：<select name="classId" data-rule="required;"><br>
    <option value="">===请选择====</option>
    <c:forEach items="${list}" var="stuClass">
    <option value="${stuClass.id}">${stuClass.className}</option>
    </c:forEach>
</select><br>
性别：男<input name="sex" type="radio" value="1" checked> 女<input name="sex" value="2" type="radio" data-rule="required;"><br>
年龄：<input name="age" type="text" value="${user.age}" data-rule="required;digits;"><br>
<input type="button" onclick="saveUser()" value="提交">
<input type="button" onclick="back()" value="返回">

</form>
<script type="text/javascript" >
    function back(){
        window.history.back(-1);
    }
    function saveUser() {
        $.ajax({
            url : '/admin/user/createUser',
            data : $('#myform').serialize(),
            type : "POST",
            success : function(data) {
                if (data.success == true) {
                    alert(data.message);
                    location.href="/admin/user/getuserList";
                } else {
                    alert(data.message);
                }
            }
        });
    }
</script>
</body>
</html>
