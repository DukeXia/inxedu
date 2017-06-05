<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/4/27
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍问卷调查管理</title>
    <title>Title</title>
    <script type="text/javascript" src="${ctx}/static/common/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="${ctximg}/static/admin/survey/booksurvey.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/multilevel.js"></script>

    <script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-1.10.4.custom.js?v=${v}"></script>
    <script src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery.ui.datepicker-zh-CN.js?v=${v}"></script>
    <script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-addon.js?v=${v}"></script>
    <script type="text/javascript" src="${ctximg}/static/common/jquery-ui-1.10.4/js/jquery-ui-timepicker-zh-CN.js?v=${v}"></script>

    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
    <style>
        input{
            margin-bottom: 10px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
<form action="${ctx}/admin/bookSurvey/edit" id="bookSurveyForm" method="post">
    <input type="hidden" name="id" value="${id}">
    <input type="hidden" name="bookSurveyTermId" value="${bookSurveyTermId}">
    问卷标题：<input type="text" name="surveyTitle" value="${bookSurvey.surveyTitle}" data-rule="required;"/><br>
    发起学院：<input type="text" name="surveySchool" value="${bookSurvey.surveySchool}" data-rule="required;"><br>
    学期：<input type="text" name="beginYear" value="${bookSurvey.beginYear}" placeholder="开始学年 ，如2016" data-rule="required;digits;">-<input type="text" name="endYear" value="${bookSurvey.endYear}" placeholder="结束学年，如2017" data-rule="required;digits;"/>
        -<input type="text" id="termNumber" name="termNumber" value="${bookSurvey.termNumber}" placeholder="学期序号，如2" data-rule="required;digits;"/><br>
    <input  type="hidden" name="term" value="${bookSurvey.term}"/>
    教材名称：<input  type="text" name="title" value="${bookSurvey.title}" data-rule="required;"/><br>
    教材主编：<input type="text" name="author" value="${bookSurvey.author}" data-rule="required;"/><br>
    出版时间：<input id="publicDate" name="publicDate" type="text" value="<fmt:formatDate  value="${bookSurvey.publicDate}" pattern="yyyy-MM-dd" ></fmt:formatDate>" data-rule="required;"/><br>
    出版社：<input type="text" name="publishingHouse" value="${bookSurvey.publishingHouse}" data-rule="required;"/><br>
    类型：<select name="type" data-rule="required;">
    <option value="">==请选择===</option>
<option value="0" <c:if test="${bookSurvey.type==0}">selected</c:if> >学生</option>
<option value="1" <c:if test="${bookSurvey.type==1}">selected</c:if> >老师</option>
</select><br>
    备注：<textarea  name="memo">${bookSurvey.memo}</textarea>
    <input type="hidden" name="type1" value="${bookSurvey.id>0}">
    <input type="submit" <%--onclick="saveBookSurvey()"--%> value="提交"/>
    <input id="a" type="button" value="返回">
</form>
<script>
    $(function() {
        $( "#publicDate" ).datepicker({
            regional:"zh-CN",
            changeMonth: true,
            dateFormat:"yy-mm-dd",
            timeFormat: "HH:mm:ss"
        });
    });
</script>
<script type="text/javascript">
    document.getElementById("a").onclick= function(){
        window.history.back(-1);
    }
</script>
</body>
</html>
