<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实验课质量调查</title>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
    <%--验证框架 --%>
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
        ul{
            list-style-type: none;
        }
        form{
            width: 80%;
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
    </style>
</head>
<body>
<form action="/bookSurvey/saveBookExperiment" id="experimentForm">
<div style="text-align: center;width: 100%;margin: 0 auto;">
    <h3 style=" width:100%;height: 35px;line-height: 35px;text-align: center;margin: 45px 0;">齐齐哈尔大学实验质量调查表</h3>
    <table <%--style="border: 1px solid #222;"--%>   width="100%" rules="all">
        <tr>
            <td align="center" width="30%" >课程 名 称</td>
            <td width="10% ">
            <input type="text" id="courseName" name="courseName" value="${experimentStudent.courseName}" readonly="readonly" >
        </td><td align="center" style="width: 30%;">开课单位</td><td colspan="2"><input type="text" id="school" name="school" value="${experimentStudent.school}" readonly="readonly"></td>
        </tr>
        <tr >
            <td >实验班级</td>
            <td><input type="text" name="labClassName" id="labClassName" value="${experimentStudent.courseName}" readonly="readonly"> </td>
            <td>指导教师</td>
            <td colspan="2"><input type="text" name="teacher" id="teacher" value="${experimentStudent.teacher}" readonly="readonly"></td>
        </tr>
        <tr>
            <td>实验地点</td>
            <td><input type="text" name="labAddress" id="labAddress1" value="${experimentStudent.labAddress}" readonly="readonly"></td>
            <td>填表时间</td>
            <td colspan="2" ><input type="text" name="createDate" readonly="readonly" value="<fmt:formatDate value="${experimentStudent.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>" id="test"></td>
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
                        <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score1" type="text" value="${experimentStudent.score1}" data-rule="required;digits" class="verify" size="8"></li>
                        <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 22px 0 22px 6px;width: 103%;"><input name="score2" type="text" value="${experimentStudent.score2}" data-rule="required;digits" class="verify" size="8"></li>
                        <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score3" type="text" value="${experimentStudent.score3}" data-rule="required;digits" class="verify" size="8"></li>
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
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score4" type="text" value="${experimentStudent.score4}" data-rule="required;digits"  class="verify" size="8"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score5" type="text" value="${experimentStudent.score5}" data-rule="required;digits" class="verify" size="8"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 22px 0 22px 6px;width: 103%;"><input name="score6" type="text" value="${experimentStudent.score6}" data-rule="required;digits" class="verify" size="8"></li>
                    <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score7" type="text"  value="${experimentStudent.score7}" data-rule="required;digits" class="verify" size="8"></li>
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
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score8" type="text" value="${experimentStudent.score8}" data-rule="required;digits" class="verify" size="8"></li>
                    <li class="j_click" style="border-bottom: 1px solid #ccc;padding: 9px 0 9px 6px;width: 103%;"><input name="score9" type="text" value="${experimentStudent.score9}" data-rule="required;digits" class="verify" size="8"></li>
                    <li class="j_click" style="padding: 9px 0px 9px 6px;width: 103%;"><input name="score10" type="text"value="${experimentStudent.score10}" data-rule="required;digits" class="verify" size="8"></li>
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
                    <li  style="padding: 9px 0px 9px 6px;width: 103%;"><input id="sum_grade" name="sum" type="text" value="${experimentStudent.sum}"  size="8" readonly="true"></li>
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
        <%--<tr>--%>
            <%--<td >--%>
                <%--序号--%>
            <%--</td>--%>
            <%--<td >--%>
                <%--指标--%>
            <%--</td>--%>
            <%--<td>指标内涵</td>--%>
            <%--<td>参考分值</td>--%>
            <%--<td>得分</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>1</td>--%>
            <%--<td rowspan="3">实验准备情况（30）</td>--%>
            <%--<td style="text-align: left;">教师 遵纪守时，不随意停（串）课，实验准备充分</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score1" type="text" data-rule="required;digits" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td >2</td>--%>
            <%--<td style="text-align: left;">试验现场整洁，布局合理，有实验室安全管理规定及应急预案，实验设备完好，实验设备齐全</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score2" type="text"  data-rule="required;digits" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>3</td>--%>
            <%--<td style="text-align: left;">教师认真检查和考核学生预习情况</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score3" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>4</td>--%>
            <%--<td rowspan="4">实验过程情况(40)</td>--%>
            <%--<td style="text-align: left;">实验分组合理，实验内容充实，实验考核认真合理</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score4" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>5</td>--%>
            <%--<td style="text-align: left;">讲授时间与实际操作时间分配比例恰当，体现精讲多练</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score5" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>6</td>--%>
            <%--<td style="text-align: left;">指导教师熟练掌握实验内容和仪器操作</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score6" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>7</td>--%>
            <%--<td style="text-align: left;">指导教师主动指导学生实验，认真解答学生提出的问题</td>--%>
            <%--<td>10</td>--%>
            <%--<td><input name="score7" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>8</td>--%>
            <%--<td rowspan="3">实验效果(30)</td>--%>
            <%--<td style="text-align: left;">巩固和加深了学生对相关理论的理解</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score8" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>9</td>--%>
            <%--<td style="text-align: left;">学生掌握了实验方法，提高了实验技能</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score9" type="text" data-rule="required;digits;"  class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>10</td>--%>
            <%--<td style="text-align: left;">培养了学生的创新意识，和创新能力</td>--%>
            <%--<td>10</td>--%>
            <%--<td class="j_click"><input name="score10" type="text" data-rule="required;digits;" class="verify"></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td colspan="2">总分</td>--%>
            <%--<td colspan="3" id="sum_grade" ><input name="sum" readonly="readonly" type="text" value="0"  data-rule="required;digits;" class="verify" ></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>意见及建议</td>--%>
            <%--<td colspan="4">--%>
                <%--<textarea name="memo" ros="1" column="1" style="resize: none;width:100%;height:150px;border: 0;padding: 0;"></textarea>--%>
            <%--</td>--%>
        <%--</tr>--%>
<%--
    <input type="button" onclick="saveBookExperiment()" style="cursor: pointer;border-radius:50%;height: 48px;background-color: #ccc;width: 210px;margin-bottom: 20px;height: 38px;" value="提交调查结果"  >--%>
</div>
</form>
</body>
</html>
