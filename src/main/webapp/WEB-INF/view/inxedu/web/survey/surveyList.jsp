<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/base.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>问卷列表</title>
</head>
<body>
<div id="aCoursesList" class="bg-fa of">
    <!-- /课程列表 开始 -->
    <section class="container">
        <header class="comm-title all-teacher-title">
            <h2 class="fl tac">
                <span class="c-333">全部问卷</span>
            </h2>
            <section class="c-tab-title">
                <a id="subjectAll" title="全部"  href="${ctx }/front/teacherlist">全部</a>
                <c:forEach var="subject" items="${subjectList }">
                    <a id="${subject.subjectId}" title="${subject.subjectName }" href="javascript:void(0)" onclick="submitForm(${subject.subjectId})">${subject.subjectName }</a>
                </c:forEach>
            </section>
        </header>
        <section class="c-sort-box unBr">
            <div>
                <!-- /无数据提示 开始-->
                <c:if test="${empty list }">
                    <section class="no-data-wrap">
                        <em class="icon30 no-data-ico">&nbsp;</em> <span class="c-666 fsize14 ml10 vam">没有相关数据，小编正在努力整理中...</span>
                    </section>
                </c:if>
                <!-- /无数据提示 结束-->
                <article class="i-teacher-list">
                    <ul class="of">
                        <c:if test="${not empty list }">
                            <c:forEach var="questionare" items="${list }">
                                <li>
                                    <section class="i-teach-wrap">
                                        <div class="i-teach-pic">
                                            <a href="#" onclick="isclose('${questionare.id}')" title="${questionare.title }">
                                                <c:choose>
                                                    <c:when test="${not empty teacher.picPath }">
                                                        <img src="${ctx }/static/inxweb/img/spss.jpg" xsrc="<%=staticImage %>${teacher.picPath}" alt="">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img xSrc="${ctx }/static/inxweb/img/spss.jpg" src="${ctx }/static/inxweb/img/spss.jpg" alt="">
                                                    </c:otherwise>
                                                </c:choose>
                                            </a>
                                        </div>
                                        <div class="mt10 hLh30 txtOf tac">
                                            <a href="#" onclick="isclose('${questionare.id}')" title="${questionare.title }" class="fsize18 c-666" >${questionare.title }</a>
                                        </div>
                                        <div class="hLh30 txtOf tac">
                                            <span class="fsize14 c-999">${questionare.title }</span>
                                        </div>
                                        <div class="mt15 i-q-txt">
                                            <p class="c-999 f-fA">${questionare.title}</p>
                                        </div>
                                    </section>
                                </li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <div class="clear"></div>
                </article>
            </div>
            <!-- 公共分页 开始 -->
            <div>
                <form action="${ctx }/front/showSurveyList" method="post" id="searchForm">
                    <input type="hidden" name="page.currentPage" id="pageCurrentPage" value="1">
                </form>
                <jsp:include page="/WEB-INF/view/common/front_page.jsp"></jsp:include>
            </div>
            <!-- 公共分页 结束 -->
        </section>
    </section>
    <!-- /课程列表 结束 -->
</div>
<script type="text/javascript">
    function isclose(id) {
        $.ajax({
            type: "GET",
            url: "/front/survey/" + id + "?time=" + new Date().getTime(),
            data: null,
            dataType: 'json',
            success: function (data) {
                if(data.success){
                    window.location.href="/front/surveyInfo/"+id;
                }
                if(!data.success){
                    if(data.message=='请登录'){
                        lrFun(1);
                    }else {
                        alert("该问卷已关闭");
                    }
                }
            },
            error:function (data) {

            }
        });
    }
    $(function() {
        if ('${subjectId}' == null || '${subjectId}' == 0) {
            $("#subjectAll").addClass("current");
        }else{
            $("#${subjectId}").addClass("current");
        };
        scrollLoad(); //响应滚动加载课程图片
    });

/*    /!**
     * 条件查询
     *!/
    function submitForm(val){
        $("input[name='queryTeacher.subjectId']").val(val);
        $("#searchForm").submit();
    }*/
</script>
</body>
</html>