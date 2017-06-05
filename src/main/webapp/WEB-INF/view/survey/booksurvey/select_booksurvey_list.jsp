<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选择教材名称</title>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
</head>
<script type="application/javascript">
    function selectAllItem(obj){
        if(obj.checked){
            $("input[name='ids']").prop('checked',true);
        }else {
            $("input[name='ids']").prop('checked',false);
        }
    }
    function unSelect(b){
        if(b.checked==false)
            $(".sele").attr("checked",false);
    }
</script>
<body>
<form action="/teacher/bookSurvey/selectByName" method="get" id="searchForm">
    <input name="currentPage" type="hidden"  value="1" id="pageCurrentPage"/>
    问卷标题<input type="text" name="surveyTitle" value="${surveyTitle}"/>
    <input type="submit" value="搜索">
</form>

<table border="1" width="1000" height="100%">
    <tr>
        <th>选择</th>
        <td align="center">问卷标题</td>
        <td align="center">发起问卷评价的学院</td>
        <td align="center">学期</td>
        <td align="center">教材名称</td>
        <td align="center">教材主编</td>
        <td align="center">出版时间</td>
        <td align="center">出版社</td>
        <td align="center">开始学年</td>
        <td align="center">结束学年</td>
        <td align="center">学期序号</td>
        <td align="center">问卷类型</td>
    </tr>
    <c:forEach items="${list}" var="bookSurvey">
        <tr>
            <td align="center"><input class="che" onclick="unSelect(this)" name="ids" type="radio"  value="${bookSurvey.id}"></td>
            <td align="center">${bookSurvey.surveyTitle}</td>
            <td align="center">${bookSurvey.surveySchool}</td>
            <td align="center">${bookSurvey.term}</td>
            <td align="center">${bookSurvey.title}</td>
            <td align="center">${bookSurvey.author}</td>
            <td align="center">
                <fmt:formatDate value="${bookSurvey.publicDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td align="center">${bookSurvey.publishingHouse}</td>
            <td align="center">${bookSurvey.beginYear}</td>
            <td align="center">${bookSurvey.endYear}</td>
            <td align="center">${bookSurvey.termNumber}</td>
            <td align="center">
                <c:if test="${bookSurvey.type==0}">
                    学生调查问卷
                </c:if>
                <c:if test="${bookSurvey.type==1}">教师调查问卷
                </c:if>

            </td>
        </tr>
    </c:forEach>

</table>

<jsp:include page="/WEB-INF/view/common/admin_page.jsp" />
<div style="text-align: center;">
    <a title="确认" onclick="confirmSelect()" class="button tooltip" href="javascript:void(0)">
        <span></span>
        确认
    </a>
    <a title="关闭" onclick="closeWin()" class="button tooltip" href="javascript:void(0)">
        <span class="ui-icon ui-icon-cancel"></span>
        关闭
    </a>
</div>
</body>
</html>
