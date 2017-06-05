<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/5
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/css/survey.css"></link>
    <script type="text/javascript" src="${ctximg}/static/admin/survey/createQuestion1.js"></script>

    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
</head>
<body>
<form action="/admin/question/createQuestion" id="createQuestion" name="myForm" method="post">
    <input type="button" onclick="saveQuestion()" value="保存问题">
    <input type="button" onclick="back()" value="返回">
    <input type="hidden" value="${questionareId}" name="questionareId">
    <table width="500" border="0" align="center" cellpadding="2"
           cellspacing="1" id="myTable" class="tab">
        <tr>
            <td width="60px">题目：</td>
            <td><input type="text" name="topic" style="width:300px;"  data-rule="required;"/></td>
        </tr>
        <tr>
            <td valign="top">类型：</td>
            <td><select name="type" onchange=getSelect()
                        style="width:120px;">
                <option value="3" selected>单选</option>
                <option value="4">多选</option>
                <option value="2">下拉框</option>
                <option value="1">文本框</option>
            </select></td>
        </tr>
        <tr>
            <td valign="top"><label> 选项1： </label></td>
            <td><input type="text" name="txt1" id="txt1"
                       style="width:260px;" /></td>
        </tr>
        <tr>
            <td><input type="hidden" name="listCnt" id="listCnt" value="" />
                <input type="hidden" name="oid" value="" /></td>
            <td id="td1"><input type="button" value="添加选项 " name="add"
                                onclick="addTextBox(this.form,this.parentNode)" class="btn" /> <input
                    type="button" value="删除选项 " onclick="removeTextBox(this.form)"
                    class="btn" /></td>
        </tr>
    </table>
</form>
</body>

</html>
