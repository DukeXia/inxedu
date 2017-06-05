<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/admin/css/survey.css"/>

</head>
<body>

<div class="quetiionare-topic">
    <p class="text-p">${questionare.title}</p>
</div>
<input type="button" value="新建问题" onclick="createQuestion('${questionare.id}')">
<input type="button" value="导入问题" onclick="importQuestion('${questionare.id}')">
<br>
<div class="survey-question1">
    <table class="table">
        <c:forEach items="${questionare.questions}" var="question" varStatus="status">
            <tr>
                <li class="topic-type">${status.index+1}.${question.topic}</li>

                <c:forEach items="${question.items}" var="iterm">
                    <c:if test="${question.type==3}">
                        <li width="35" rowspan="2" valign="top"><input type="radio"><label>${iterm.item}</label></li>
                    </c:if>
                    <c:if test="${question.type==4}">
                        <li width="35" rowspan="2" valign="top"><input type="checkbox"><label>${iterm.item}</label></li>
                    </c:if>
                    <c:if test="${question.type==1}">
                        <li width="35" rowspan="2" valign="top"><input type="text"></li>
                    </c:if>
                </c:forEach>
                <br>
                <a onclick="editQuestion('${question.id}')">编辑题目</a>&nbsp
                <a onclick="removeQuestion('${question.id}')" >减少题目</a>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">
    function editQuestion(id) {
        window.location.href="/admin/question/toEditQuestion/"+id;
    }
    function createQuestion(id) {
        window.location.href="/admin/question/toCreateQuestion/"+id;
    }
    function importQuestion(id) {
        window.location.href="/admin/excelSurvey/toQuestionImport/"+id;
    }
</script>
</body>
</html>
