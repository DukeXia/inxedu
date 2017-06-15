<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <title>${questionare.title}</title>
    <script type="text/javascript">
        if (window.location.hash) {
            window.location.hash = "";
            window.location.href = window.location.href.replace("#", "");
        }
        var isWeiXin = 0;
    </script>
    <script src="${ctxming}/static/inxweb/js/jquery-1.7.2.min.js"></script>
    <link href="${ctx}/static/inxweb/css/_demo.css" rel="stylesheet" type="text/css"/>
    <script>var hasSlider = 1;</script>
    <script src="${ctxming}/static/inxweb/front/submit_judge.js" type="text/javascript"></script>
    <script src="${ctxming}/static/inxweb/front/select.js" type="text/javascript"></script>
</head>
<body>


<form id="form1" method="post" action="/front/submitSurveyQuestion" style="width: 76%;
margin: 0 auto;">
<input type="hidden" value="${questionare.id}" name="questionareId">

    <div id="toptitle">
        <h1 class="htitle">
            ${questionare.title}</h1>
    </div>
   <%-- <div id="divLoadAnswer" style="display:none;background:#fffaea;padding:15px 10px;">
        <b style="color:red;">提示：</b>您上次作答没有成功提交，<a href="javascript:" onclick="loadAnswer();">加载上次答案</a>
    </div>--%>


    <div id="divContent">
        <div id="divDesc" class="formfield">
            <span class="description">
                <div><span style="line-height:1.5;">${questionare.description}</span></div></span>
        </div>
        <div id="divQuestion">
            <fieldset class='fieldset' style='' id='fieldset1'>
                <c:forEach items="${questionare.questions}" var="question" varStatus="status" >
                    <div class='field ui-field-contain' id='div1' req='1' topic='1' data-role='fieldcontain' type='${question.type}'>
                        <div class='field-label'>${status.index+1}. ${question.topic}<span class='req'>*</span></div>
                        <div class='ui-controlgroup'>
                        <c:if test="${question.type==3}">
                                <c:forEach items="${question.items}" var="iterm" >
                                    <div class='ui-radio' style="overflow: hidden;"><span class='jqradiowrapper'><input type='radio' value=''
                                                                                              id='q1_${question.id}'
                                                                                              name="radio${question.id}_${iterm.id}"
                                                                                              style='display:none;'/><a
                                            class='jqradio' href='javascript:;'></a></span>
                                        <div class='label' for='q1_1'>${iterm.item}</div>
                                    </div>
                                </c:forEach>
                        </c:if>
                        <c:if test="${question.type==4}">
                            <c:forEach items="${question.items}" var="iterm" >
                                <div class='ui-checkbox' style="overflow: hidden;><span class='jqcheckwrapper'><input type='checkbox' value=''
                                                                                             id='q1_${question.id}'
                                                                                             name='checkbox${question.id}_${iterm.id}'
                                                                                             style='display:none;'/><a
                                        class='jqcheck' href='javascript:;'></a></span>
                                    <div class='label' for='q1_${question.id}'>${iterm.item}</div>
                                </div>
                            </c:forEach>
                        </c:if>
                            </div>
                        <c:if test="${question.type==1}">
                            <c:forEach items="${question.items}" var="iterm" >
                            <div class='ui-input-text' style='position:relative;' style="overflow: hidden;><input type='text'
                                                                                         name='txt${question.id}_${iterm.id}'/>
                            </div>
                            </c:forEach>
                        </c:if>
                        <div class='errorMessage'></div>
                    </div>
                </c:forEach>
            </fieldset>
        </div>
        <div id="divMatrixRel" style="position: absolute; display: none; width: 80%; margin: 0 10%;"
             class="ui-input-text">
            <input type="text" placeholder="请注明..." id="matrixinput" style="min-height: 2em;
                width: 100%; padding: 0.3em 0.6em;"/>
        </div>
        <div class="shopcart" id="shopcart" style="display:none;">
        </div>
        <div class="footer">
            <div class="ValError">
            </div>
            <div id="divSubmit" style="padding: 10px; display:none;">
                <div id="tdCode" style="display: none;padding-bottom:15px;">
                    <table>
                        <tr>
                            <td class="ui-input-text nofocus">
                                <input id="yucinput" size="14" maxlength="10" type="text" name="yucinput"/>
                            </td>
                            <td>
                                <div id="divCaptcha" style="display: none;">
                                    <img alt="验证码" title="看不清吗？点击可以刷新" captchaid="" instanceid="">
                                </div>
                            </td>
                            <td>
                                &nbsp;&nbsp;<img id="imgCode" alt="验证码" title="看不清吗？点击可以刷新" style="vertical-align: bottom;
                                    cursor: pointer; display: none;"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <a id="ctlNext" onclick="submitForm()" href="javascript:;" class="button blue">
                    提交</a>
            </div>
        </div>

    </div>
</form>
<a id='lnkCity' style="display: none;"></a>
<a href="javascript:;" class="scrolltop" style="display:none;"></a>
<script type="text/javascript">
function submitForm() {

}
    var activityId = 13789895;
    var isYdb = 0;
    var isPub = 0;
    var cqType = 1;
    var isDingDing = 0;
    var ddcorpid = "";
    var sojumpParm = '';
    var isKaoShi = 0;
    var lastTopic = 0;
    var Password = "";
    var guid = "";
    var udsid = 0;
    var langVer = 0;
    var cProvince = "";
    var cCity = "";
    var cIp = "";
    var divTip = document.getElementById("divTip");
    var displayPrevPage = "none";
    var inviteid = '';
    var access_token = "";
    var openid = "";
    var isQQLogin = 0;
    var wxthird = 0;
    var hashb = 0;
    var sjUser = '';
    var outuser = '';
    var outsign = '';
    var sourceurl = '';
    var sourcename = "";
    var isSimple = '';
    var jiFenBao = 0;
    var cAlipayAccount = "";
    var isRunning = 1;
    var SJBack = '';
    var jiFen = "0";
    var ItemDicData = "";
    var rndnum = "1864122581.43504279";
    var totalPage = 1;
    var totalCut = 0;
    var cepingCandidate = "";
    var cpid = "";
    var needSaveJoin = 0;
    var qBeginDate = "1494035601750";
    var randomMode = 0;
    var fisrtLoadTime = new Date().getTime();
</script>


<script type="text/javascript">
    var needAvoidCrack = 0;
    var tdCode = "tdCode";
    var imgCode = $("#imgCode")[0];
    var submit_text = $("#yucinput")[0];
    var tCode = $("#" + tdCode)[0];
    var hasTouPiao = 0;
</script>


</body>
</html>
