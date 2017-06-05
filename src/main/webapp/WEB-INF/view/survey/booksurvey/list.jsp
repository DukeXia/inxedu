<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/4/27
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教科书问卷列表</title>
</head>
<body>
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

<form action="/admin/bookSurvey/select" method="get" id="searchForm">
    <input name="currentPage" type="hidden"  value="1" id="pageCurrentPage"/>
    <input name="bookSurveyTermId" type="hidden" value="${bookSurveyTermId}">
    问卷标题<input type="text" name="surveyTitle" value="${surveyTitle}"/>
    发起问卷评价的学院 <input type="text" name="surveySchool" value="${surveySchool}"/>
    <input type="submit" value="搜索">
     <a href="/admin/bookSurvey/toEdit/0/${bookSurveyTermId}">添加</a>
    <a href="/admin/excelSurvey/toBookSurveyImport/${bookSurveyTermId}">导入</a>
</form>

<table border="1" width="1000" height="100%">
    <tr>
        <th><input class="sele" type="checkbox" onclick="selectAllItem(this)" >全选</th>
        <td align="center">问卷标题</td>
        <td align="center">发起问卷评价的学院</td>
        <td align="center">教材名称</td>
        <td align="center">教材主编</td>
        <td align="center">出版时间</td>
        <td align="center">出版社</td>
        <td align="center">所得总分</td>
        <td align="center">所得平均分</td>
        <td align="center">参与调查总人数</td>
        <td align="center">问卷类型</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${list}" var="bookSurvey">
        <tr>
            <td align="center"><input class="che" onclick="unSelect(this)" name="ids" type="checkbox" value="${bookSurvey.id}"></td>
            <td align="center">${bookSurvey.surveyTitle}</td>
            <td align="center">${bookSurvey.surveySchool}</td>
            <td align="center">${bookSurvey.title}</td>
            <td align="center">${bookSurvey.author}</td>
            <td align="center">
            <fmt:formatDate value="${bookSurvey.publicDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td align="center">${bookSurvey.publishingHouse}</td>
            <td align="center">${bookSurvey.sum}</td>
            <td align="center">${bookSurvey.average}</td>
            <td align="center">${bookSurvey.number}</td>
            <td align="center">
            <c:if test="${bookSurvey.type==1}">
                老师调查问卷
            </c:if>
             <c:if test="${bookSurvey.type==0}">学生调查问卷
             </c:if>

            </td>
            <td align="center">
                <a href="/admin/bookSurvey/toEdit/${bookSurvey.id}/${bookSurveyTermId}">编辑</a>
                <a href="/admin/bookSurvey/delete?id=${bookSurvey.id}">删除</a>
                <a href="/admin/bookSurvey/voteInfo/${bookSurvey.id}/${bookSurvey.type}">评论详情</a>
            </td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="/WEB-INF/view/common/admin_page.jsp" />
</body>
</html>
