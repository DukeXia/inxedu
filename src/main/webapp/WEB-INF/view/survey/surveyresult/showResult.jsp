<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%--<script type="text/javascript" src="${ctxming}/static/admin/survey/showChart.js"></script>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${ctxming}/static/admin/js/highChart/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${ctxming}/static/admin/js/echarts.js"></script>
<script type="text/javascript" src="${ctxming}/static/admin/survey/showChart.js"></script>

<%--<script type="text/javascript" src="hemi/js/funnelView.js"></script>--%>

<h3 class="page-title">
    Echarts 展示 <small>可视化图表</small>
</h3>
</div>
<div class="main1">
<div>
<c:forEach items="${questions}" var="question" varStatus="status">
    <c:if test="${question.type!=1}">
    <div class="ehzzz" style="height:800px">
        <div style="float: left;width: 100%;height: 30px;clear: both;padding: 0 0 100px; font-size:16px">${status.index+1}.${question.topic}</div>
        <div class="chart-show" id="${question.id}" style="width: 1000px;height:600px;padding: 0 0 200px  0;bottom: -10px;"></div>
    </div>
    </c:if>
</c:forEach>
</div>
</div>

</div>
