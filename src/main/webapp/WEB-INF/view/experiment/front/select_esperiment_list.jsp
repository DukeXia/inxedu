<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/14
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>选择实验课</title>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
    <script src="${ctx}/static/inxweb/js/jquery-1.7.2.min.js"></script>
    <%--验证框架 --%>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
    <style type="text/css">
        .paging {
            padding: 50px 0 20px;
            text-align: center;
        }
        .paging a {
            border: 1px solid #ccc;
            border-radius: 40%;
            color: #666;
            display: inline-block;
        +display: inline-block;
            margin: 0 5px;
            height: 30px;
            width: 30px;
            text-align: center;
            line-height: 30px;
            transition: .3s;
            transition-property: all;
            transition-duration: 0.3s;
            transition-timing-function: ease;
            transition-delay: 0s;
            -webkit-transition: .3s;
            transition-property: all;
            transition-duration: 0.3s;
            transition-timing-function: ease;
            transition-delay: 0s;
        }
        .paging a.current, .paging a:hover {
            border-radius: 50%;
            border-top-left-radius: 50%;
            border-top-right-radius: 50%;
            border-bottom-right-radius: 50%;
            border-bottom-left-radius: 50%;
            text-decoration: none;
            text-decoration-color: currentcolor;
            text-decoration-line: none;
            text-decoration-style: solid;
        }
        .paging a.current, .paging a.undisable {
            cursor: text;
        }
        .clear {
            clear: both;
            display: block;
            overflow: hidden;
            overflow-x: hidden;
            overflow-y: hidden;
            visibility: hidden;
            width: 0;
            height: 0;
        }
        table tr:hover{
            color: #333;
            cursor: pointer;
        }
        table tr{
            height:2.2em;
        }
    </style>
</head>
<body>
<form action="/bookSurvey/selectExperimentByName" method="get" id="searchForm">
    <input name="currentPage" type="hidden"  value="1" id="pageCurrentPage"/>
    实验课名称：<input type="text" name="courseName" value="${courseName}">
    <input type="submit" value="搜索" style="width: 5em;
    height: 2.3em;
    border-radius: 12px/12px;
    box-shadow: inset 13px 15px 24px rgba(133, 192, 48, 0.85);
    border: 0;">
</form>
<table border="0" width="1000" height="" style="    border-spacing: 0;
    border-collapse: collapse;background: #f9f9f9;    color: #888;" >
    <tr style="background-color: #fff;font-family: 'Lantinghei SC','Open Sans',Arial,'Hiragino Sans GB','Microsoft YaHei';color: #fff;background-color: rgba(133, 192, 48, 0.85);height: 2.7em;">
        <th>选择</th>
        <td align="center">实验课名称</td>
        <td  align="center">开课单位</td>
        <td  align="center">实验班级</td>
        <td  align="center">指导教师</td>
        <td  align="center">实验地址</td>
    </tr>
    <c:forEach var="experiment" items="${list}">
        <tr>
            <td align="center"><input id="ch" class="che" onclick="unSelect(this)" name="ids" type="radio"  value="${experiment.id}"></td>
            <td  align="center"> ${experiment.courseName}</td>
            <td  align="center">${experiment.school}</td>
            <td  align="center">${experiment.labClassName}</td>
            <td  align="center">${experiment.teacher}</td>
            <td  align="center">${experiment.labAddress}</td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="/WEB-INF/view/common/front_page.jsp" />
<div style="text-align: center;">
    <a title="确认" onclick="confirmSelectExperiment()" class="button tooltip" href="javascript:void(0)" style="    height: 2.3em;
    width: 4em;
    background: rgba(133, 192, 48, 0.85);
    display: inline-block;
    border-radius: 1em/1em;
    text-align: center;
    line-height: 2.3em;
    text-decoration: none;
    color: #666;
    font-weight: 700;">
        <span></span>
        确认
    </a>
    <a title="关闭" onclick="closeWin()" class="button tooltip" href="javascript:void(0)" style="    height: 2.3em;
    width: 4em;
    background: rgba(133, 192, 48, 0.85);
    display: inline-block;
    border-radius: 1em/1em;
    text-align: center;
    line-height: 2.3em;
    text-decoration: none;
    color: #666;
    font-weight: 700;">
        <span class="ui-icon ui-icon-cancel"></span>
        关闭
    </a>
</div>
</body>
</html>
