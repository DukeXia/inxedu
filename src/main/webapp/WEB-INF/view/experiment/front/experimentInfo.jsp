<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实验课质量调查</title>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
    <%--验证框架 --%>
    <script src="${ctx}/static/common/jquery-form.js"></script>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.metadata.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
    <style type="text/css">
        html,body,textarea{
            width: 100%;
            margin: 0;
            padding: 0;
        }
        }
        ul{
            list-style-type: none;
        }
        form{
            width: 66%;
            margin:0 auto;
        }
        table tr td {
            border:1px solid #999999;
        }
        input{
            border: 0;
            background-color: #fff;
            text-align: center;
        }
        td{
            text-align: center;
            height:39.8px;
            vertical-align: middle;
            margin: 0;
            padding: 0;
        }
        table{
        }
        .clearfix:before,.clearfix:after{
            display: table;
            content: "";
        }
        .clearfix:after {
            clear: both;
        }
        .clearfix {
            zoom: 1;
        }
        .j_click input{
            padding-right: 10px;
            width: 80%;
        }
    </style>
</head><%----%>
<body>
<form action="/bookSurvey/saveBookExperiment" id="experimentForm">
<input type="hidden" name="studentNo" value="${loginUser.no}">
<input type="hidden" name="experimentId" id="experimentId"  >
<div style="text-align: center;width: 95%;margin: 0 auto;">
    <h3 style=" width:100%;height: 35px;line-height: 35px;text-align: center;margin: 45px 0;">齐齐哈尔大学实验质量调查表</h3>
    <table <%--style="border: 1px solid #222;"--%>   width="100%" rules="all">
        <tr>
            <td align="center" width="30%" >课程 名 称</td>
            <td width="10% ">
            <a href="javascript:void(0)" onclick="selectExperiment()">选择实验课</a>
            <input type="text" id="courseName" name="courseName" value="" readonly="readonly" >
        </td><td align="center" style="width: 30%;">开课单位</td><td colspan="2"><input type="text" id="school" name="school" value="" readonly="readonly"></td>
        </tr>
        <tr >
            <td >实验班级</td>
            <td><input type="text" name="labClassName" id="labClassName" value="" readonly="readonly"> </td>
            <td>指导教师</td>
            <td colspan="2"><input type="text" name="teacher" id="teacher" value="" readonly="readonly"></td>
        </tr>
        <tr>
            <td>实验地点</td>
            <td><input type="text" name="labAddress" id="labAddress1" value="" readonly="readonly"></td>
            <td>填表时间</td>
            <td colspan="2" ><input type="text" name="createDate" readonly="readonly" value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"></fmt:formatDate>" id="test"></td>
        </tr>
    </table>
    <div style="border-left: 1px solid #ccc;border-right: 1px solid #ccc;border-bottom: 1px solid #ccc;width: 100%;margin-bottom: 17px;">
        <div style="border-bottom: 1px solid #ccc;">
            <ul style="overflow: hidden;">
                <li style="float: left;width: 4%;border-right: 1px solid #ccc;height: 42px;line-height: 42px;">序号</li>
                <li style="float: left;width: 13%;border-right: 1px solid #ccc;width: 13%;
    height: 42px;    line-height: 42px;">指标</li>
                <li style="float: left;width: 62%;border-right: 1px solid #ccc;height: 42px;line-height: 42px;">指标内涵</li>
                <li style="float: left;width: 10%;border-right: 1px solid #ccc;height: 42px;line-height: 42px;">参考分值</li>
                <li style="float: left;width: 9%;height: 42px;line-height: 42px;">得分</li>
            </ul>
        </div>
        
            <div style="border-bottom: 1px solid #ccc;" class="clearfix">
                <div style="width: 4%;border-right: 1px solid #ccc;float: left;">
                    <ul>
                        <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">1</li>
                        <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">2</li>
                        <li style="padding: 9px 0;">3</li>
                    </ul>
                </div>
                <div style="float: left;border-right: 1px solid #ccc;width: 13%;height: 140px;
    line-height: 140px;">
                    实验准备情况（30分
                </div>
                <div style="border-right: 1px solid #ccc;width: 62%;float: left;">
                    <ul>
                        <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">教师 遵纪守时，不随意停（串）课，实验准备充分</li>
                        <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">试验现场整洁，布局合理，有实验室安全管理规定及应急预案，实验设备完好，实验设备齐全</li>
                        <li style="padding: 9px 0;">教师认真检查和考核学生预习情况</li>
                    </ul>
                </div>
                <div style="float: left;width: 10%;border-right: 1px solid #ccc;">
                    <ul>
                        <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">10</li>
                        <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">10</li>
                        <li style="padding: 9px 0;">10</li>
                    </ul>
                </div>
                <div style="float: left;width: 10%;">
                    <ul>
                        <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score1" type="text" data-rule="required;digits" class="verify" size="10"></li>
                        <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 22px 0 22px 6px;width: 103%;"><input name="score2" type="text" data-rule="required;digits" class="verify" size="10"></li>
                        <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score3" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    </ul>
                </div>
            </div>
        <div style="border-bottom: 1px solid #ccc;" class="clearfix">
            <div style="width: 4%;border-right: 1px solid #ccc;float: left;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">4</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">5</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">6</li>
                    <li style="padding: 9px 0;">7</li>
                </ul>
            </div>
            <div style="float: left;border-right: 1px solid #ccc;width: 13%;height: 177px;
    line-height: 177px;">
                实验过程情况(40分)
            </div>
            <div style="border-right: 1px solid #ccc;width: 62%;float: left;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">实验分组合理，实验内容充实，实验考核认真合理</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">教授时间与实际操作时间分配比例恰当，体现精讲多练</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">指导教师熟练掌握实验内容操作，示范操作正确、规范</li>
                    <li style="padding: 9px 0;">指导教师主动指导学生实验，认真解答学生提出的问题</li>
                </ul>
            </div>
            <div style="float: left;width: 10%;border-right: 1px solid #ccc;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">10</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">10</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 22px 0;">10</li>
                    <li style="padding: 9px 0;">10</li>
                </ul>
            </div>
            <div style="float: left;width: 10%;">
                <ul>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score4" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score5" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 22px 0 22px 6px;width: 103%;"><input name="score6" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score7" type="text" data-rule="required;digits" class="verify" size="10"></li>
                </ul>
            </div>
        </div>
        <div style="border-bottom: 1px solid #ccc;" class="clearfix">
            <div style="width: 4%;border-right: 1px solid #ccc;float: left;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">8</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">9</li>
                    <li style="padding: 9px 0;">10</li>
                </ul>
            </div>
            <div style="float: left;border-right: 1px solid #ccc;width: 13%;height: 113px;
    line-height: 113px;">
                实验效果(30分)
            </div>
            <div style="border-right: 1px solid #ccc;width: 62%;float: left;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">巩固加深了学生对相关理论知识的理解</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">学生掌握了实验方法，提高了实验技能</li>
                    <li style="padding: 9px 0;">培养了学生的创新意识和创新能力</li>
                </ul>
            </div>
            <div style="float: left;width: 10%;border-right: 1px solid #ccc;">
                <ul>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">10</li>
                    <li style="border-bottom: 1px solid #ccc;padding: 9px 0;">10</li>
                    <li style="padding: 9px 0;">10</li>
                </ul>
            </div>
            <div style="float: left;width: 10%;">
                <ul>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score8" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score9" type="text" data-rule="required;digits" class="verify" size="10"></li>
                    <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score10" type="text" data-rule="required;digits" class="verify" size="10"></li>
                </ul>
            </div>
        </div>
        <div style="border-bottom: 1px solid #ccc;" class="clearfix">
            <div style="width: 17%;border-right: 1px solid #ccc;float: left;">
                <ul>
                    <li style="padding: 9px 0;">总分</li>
                </ul>
            </div>
            <div style="float: left;width: 82%;">
                <ul>
                    <li  style="padding: 9px 0px 9px 6px;width: 103%;"><input id="sum_grade" name="sum" type="text"   size="10" readonly="true"></li>
                </ul>
            </div>
        </div>
        <div style="border-bottom: 1px solid #ccc;" class="clearfix">
            <div style="width: 17%;border-right: 1px solid #ccc;float: left;height: 155px;line-height: 155px">
                <ul>
                    <li style="padding: 9px 0;">意见和建议：</li>
                </ul>
            </div>
            <div style="float: left;width: 82%;">
                <ul>
                    <li  style="padding: 0;"><textarea name="" id=""
                   cols="30" rows="10" style="resize: none;border: 0;"></textarea></li>
                </ul>
            </div>
        </div>
    </div>
    <section style="margin: 17px 0;">
        <artical>
            <h4>注：优秀(得分>=85分)，良好(得分>=75分),合格(75>=得分>=60分),不合格(得分<60分)。</h4>
        </artical>
    </section>
    <input type="button" onclick="saveBookExperiment()" style="cursor: pointer;border-radius:50%;height: 48px;background-color: #ccc;width: 210px;margin-bottom: 20px;height: 38px;" value="提交调查结果"  >
</div>
<script type="text/javascript">
   $(function () {
        $(".j_click").on("click",function () {
            $(this).children("input").eq(0).trigger("focus");
        })
       $(".verify").on("blur",function () {
           if($(this).siblings()) {

               $(this).siblings().each(function () {
                   if($(this).text()=='输入的得分超过可输入最大值')
                   $(this).remove();
               })
           }
           if(!isNaN(parseInt($(this).val()))){
               if(parseInt($(this).val())>10){
                   $(this).after("<span class='msg-box n-right'  style='' for='score3'><span role='alert'' class='msg-wrap n-error'><span class='n-icon'></span><span class='n-msg'>输入的得分超过可输入最大值</span></span></span>");
                   $(this).val("");
               }
               else{
                   $(this).next().remove();
               }
           }
       })

           $(".j_click input").on("blur", function () {
                   var sum = 0;
                   $(".j_click input").each(function () {
                       sum += parseInt($(this).val());
                   });
                   $("#sum_grade").val(sum + "");
               }
           );
   });
   /*$(document).ready(function() {

       var options = {
           type:        'POST',   // target element(s) to be updated with server response
           beforeSubmit:function s() {

               $('#experimentForm').validator({
                   stopOnError: true,
                   timely: true,
                   fields: {
                       'score1':'required;digits',
                       'score2':'required;digits',
                       'score3':'required;digits',
                       'score4':'required;digits',
                       'score5':'required;digits',
                       'score6':'required;digits',
                       'score7':'required;digits',
                       'score8':'required;digits',
                       'score9':'required;digits',
                       'score10':'required;digits'
                   },
                   valid: function () {
                       return true;
                   },
                   invalid:function () {
                      /!* alert("eeror");*!/
                       return false;
                   }
               });
           },
           dataType:'json',
           success: function successRes(jsonData){
               if (jsonData.success) {
                   alert(jsonData.message);
                   location.href="/";
               } else {
                   alert(jsonData.message);
               }
           }
       };
       $('#experimentForm').submit(function() {
           $(this).ajaxSubmit(options);
           return false;
       });

   });*/
    function saveBookExperiment(){
        var courseName=  $("#courseName").val();
        if(courseName==''){
            alert("请选择课程");
            return false;
        }
        if($("input[name='score1']").val()==''||$("input[name='score2']")==''||$("input[name='score3']").val()==''||$("input[name='score4']").val()==''||$("input[name='score5']").val()==''||$("input[name='score6']").val()==''||$("input[name='score7']").val()==''||$("input[name='score8']").val()==''||$("input[name='score9']").val()==''||$("input[name='score10']").val()==''){
            alert("你的评价还没评完");
            return false;
        }
        $.ajax({
            url : '/bookSurvey/saveBookExperiment',
            data : $('#experimentForm').serialize(),
            type : "POST",
            success : function(data) {
                if(data.success){
                    alert(data.message);
                    location.href="/"
                }else {
                    alert(data.message);
                }

            }
        });
    }
</script>
</form>
</body>
</html>
