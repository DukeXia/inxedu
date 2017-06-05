<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师评价</title>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
</head>
<body>
<head>
    <title>Title</title>
    <style type="text/css">
        table tr td {
            border: 1px solid #999999;
        }

        input {
            outline:#fff;
            border: 0;
            background-color: #fff;
            text-align: center;
        }

    </style>
    <script src="${ctx}/static/inxweb/js/jquery-1.7.2.min.js"></script>
    <%--验证框架 --%>
    <script src="${ctx}/static/common/jquery-form.js"></script>
    <link rel="stylesheet" href="${ctx}/static/common/nice-validator/jquery.validator.css"></link>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/jquery.validator.js"></script>
    <script type="text/javascript" src="${ctx}/static/common/nice-validator/local/zh-CN.js"></script>
    <script type="text/javascript" src="${ctx}/static/admin/survey/booksurvey.js"></script>
</head>
<body style="text-align: center;">
<form action="/teacher/bookSurvey/saveBookSurveyStudent" id="bookSurveyForm" style="width: 67%;margin: 0 auto;">
    <input type="hidden" name="teacherNo" value="${teacher.username}">
    <input type="hidden" name="bookSurveyId" id="bookSurveyId" value="">
    <div style="text-align: center;width: 100%;margin: 0 auto;">
        <h3 style=" width:100%;height: 35px;line-height: 35px;text-align: center">齐齐哈尔大学教材质量评价表</h3>
        <div style="height: 50px;"><span id="" style="float: left;"><spap id="school"
                                                                          style="text-decoration: underline">__</spap>学院（部、中心）</span><span
                style="float: right;"><span id="beginYear" style="text-decoration: underline">__</span>/<span
                id="endYear" style="text-decoration: underline">__</span>学年第<span id="termNumber"
                                                                                  style="text-decoration: underline">__</span>学期</span>
        </div>
        <table <%--style="border: 1px solid #222;"--%> width="100%" rules="all" style="border:1px solid #999">
            <tr>
                <td rowspan="2" style="width: 15%;">
                    <div style="width: 100%;">教材</div>
                </td>
                <td style="width: 10%;">教 材 名 称</td>
                <td style="width: 10%;">主编姓名</td>
                <td style="width: 74%;">出版时间</td>
                <td>出 版 社</td>
            </tr>
            <tr id="book">
                <td>
                    <a href="javascript:void(0)" onclick="selectBookSurvey()">选择教材</a>
                    <p id="p1"></p>
                </td>
                <td></td>
                <td>
                </td>
                <td></td>
            </tr>
            <tr >
                <td rowspan="2">评议人</td>
                <td>姓 名</td>
                <td>职 务</td>
                <td>职 称</td>
                <td>填 表 时 间</td>
            </tr>
            <tr>
                <td><input name="teacherName" type="text" value="${teacher.name}" readonly="readonly"></td>
                <td><input type="text" name="position" value="" data-rule="required;" placeholder="若没有可以填 无"></td>
                <td><input type="text" name="jobTitle" placeholder="若没有可以填 无" data-rule="required;"></td>
                <td><input type="text" name="createDate"
                           value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"></fmt:formatDate>" readonly="readonly"></td>
            </tr>
            <tr>
                <td>一级指标</td>
                <td>二级  指标  </td>
                <td>三级 指标</td>
                <td >最 佳 状 态 描 述</td>
                <td>得分</td>
            </tr>
            <tr>
                <td rowspan="11">内容质量(80)</td>
            </tr>
            <tr>
                <td rowspan="3">教 学水 平 （30）</td>
                <td>教学适应性（10）</td>
                <td>符合人才培养目标及本课程教学要求，取材合适、深度适宜、分量恰当。</td>
            <td class="j_click"><input name="score1_1" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>

            <tr>
                <td>认识规律性（10）</td>
                <td>符合认知规律，富有启发性，便于学习，有利于激发学生学习兴趣及各种能力的培养。</td>
                <td class="j_click"><input name="score1_2" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>
            <tr>
                <td>结构完整性(10)</td>
                <td>绪论、正文、习题、思考题、索引、参考文献齐全。</td>
                <td class="j_click"><input name="score1_3" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>

            <tr>
                <td rowspan="3">科 学  水 平  （30）</td>
                <td>先进性
                    （10）</td>
                <td>能反映本学科国内外科学研究和教学研究先进成果。</td>
                <td class="j_click"><input name="score2_1" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>

            <tr>
                <td>系统性
                    （10）</td>
                <td>能完整地表达本课程应包含的知识，反映其相互联系及发展规律，结构严谨。</td>
                <td class="j_click"><input name="score2_2" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>

            <tr>
                <td>理论性
                    （10）</td>
                <td>能正确地阐述本学科的科学理论和概念，注意理论联系实际。</td>
                <td class="j_click"><input name="score2_3" data-rule="required;digits;" type="text" data-max="10"></td>
            </tr>
            <tr>
                <td rowspan="2"> 思 想
                    水 平
                    （10）</td>
                <td>思想性
                    （5）</td>
                <td>思想观点正确，弘扬民族文化精华，无政治性和政策性错误。</td>
                <td class="j_click"><input name="score3_1" data-rule="required;digits;" type="text" data-max="5"></td>
            </tr>

            <tr>
                <td>逻辑性(5)</td>
                <td>层次分明，条理清楚，教材体系能反映内容的内在联系及本专业特有的思维方法。</td>
                <td class="j_click"><input name="score3_2" data-rule="required;digits;" type="text" data-max="5"></td>
            </tr>

            <tr>
                <td rowspan="2">文图水平(10)</td>
                <td>语言文字
                    （5）</td>
                <td>文字规范、简练，符合语法规则，语言流畅，通俗易懂，叙述生动。</td>
                <td class="j_click"><input name="score4_1" data-rule="required;digits;" type="text" data-max="5"></td>
            </tr>

            <tr>
                <td>图表
                    （5）</td>
                <td>图文配合恰当，图表清晰、准确，符号、计量单位符合国家标准。</td>
                <td class="j_click"><input name="score4_2" data-rule="required;digits;" type="text" data-max="5"></td>
            </tr>

            <tr>
                <td>编辑印 刷质量
                    （5）</td>
                <td colspan="3">编辑规范，印刷清晰，装订质量好。</td>
                <td class="j_click"><input name="score5" data-rule="required;digits;" type="text" data-max="5"></td>
            </tr>
            <tr>
                <td>特 色
                    （5）</td>
                <td colspan="3">内容、结构、体系安排有明显特色与创新。</td>
                <td class="j_click" colspan="3"><input name="score6" type="text" value="" data-max="5"></td>
            </tr>
            <tr>
                <td>教 材
                    级 别
                    （5）</td>
                <td colspan="3">获奖教材、规划教材、推荐教材、面向21世纪课程教材等。</td>
                <td class="j_click"><input name="score7" type="text" data-max="5"></td>
            </tr>
            <tr>
                <td>
                    学 生反 馈（5）
                </td>
                <td colspan="3">学生教材拥有率高，易于理解、掌握，满意度高等。</td>
                <td class="j_click"><input name="score8" data-rule="required;digits;" type="text" id="last" data-max="5"></td>
            </tr>
            <tr>
                    <td>总分</td>
                    <td colspan="4">
                        <input name="score" type="text" value="0" id="sum_grade" readonly="true">
                    </td>
            </tr>
            <tr>
                <td style="border: 0px;vertical-align:top">对教材质量的具体意见和建议： <br>
                </td>
                <td colspan="4"><textarea name="memo" column="100" row="10"
                                          style="width: 100%; height: 168px;resize: none;outline: #fff;border: 0;margin: 0;padding: 0;text-indent: 37px;"></textarea></td>
            </tr>
        </table>
        <input <%--type="submit"--%> onclick="saveBookStudent()" value="提交"
               style="cursor: pointer;border:1px solid #999;background:#eee;">
    </div>
</form>
<script>
    $(function () {

        $(".j_click").on("click", function () {
            $(this).children().eq(0).trigger("focus");
        });
        $(".j_click input").on("blur", function () {
                var sum = 0;
                $(".j_click input").each(function () {
                    sum += parseInt($(this).val());
                });
                $("#sum_grade").val(sum );
            if($(this).siblings()) {
                $(this).siblings().each(function () {
                    if($(this).text()=='输入的得分超过最大数值')
                        $(this).remove();

                })
            }
            if(!isNaN(parseInt($(this).val()))) {
                if (parseInt($(this).val()) > parseInt($(this).data("max"))) {
                    $(this).after("<span class='msg-box n-right'  style='' for='score3'><span role='alert'' class='msg-wrap n-error'><span class='n-icon'></span><span class='n-msg'>输入的得分超过最大数值</span></span></span>");
                    $(this).val("");
                }
                else
                    $(this).next().remove();
            }
            }
        );

    });
    $(document).ready(function() {

        var options = {
            type:        'POST',   // target element(s) to be updated with server response
            beforeSubmit:function s() {
                var bookSurveyId= $("#bookSurveyId").val();
                if(bookSurveyId==""){
                    alert("请选择课程");
                    return false;
                }
                $('#bookSurveyForm').validator({
                    stopOnError: false,
                    timely: true,
                    fields: {
                        'score1_1':'required;digits',
                        'score1_2':'required;digits',
                        'score1_3':'required;digits',
                        'score2_1':'required;digits',
                        'score2_2':'required;digits',
                        'score2_3':'required;digits',
                        'score3_1':'required;digits',
                        'score3_2':'required;digits',
                        'score4_1':'required;digits',
                        'score4_2':'required;digits',
                        'score5':'required;digits',
                        'score6':'required;digits',
                        'score7':'required;digits',
                        'score8':'required;digits'
                    },
                    valid: function () {
                        return true;
                    },
                    invalid:function () {
                        return false;
                    }
                });
            },
            dataType:'json',
            success: function successRes(jsonData){
                if (jsonData.success) {
                    alert(jsonData.message);
                    location.href="/teacher/main/mindex";
                } else {
                    alert(jsonData.message);
                }
            }
        };
        $('#bookSurveyForm').submit(function() {
            $(this).ajaxSubmit(options);
            return false;
        });

    });
    function saveBookStudent() {
       var bookSurveyId= $("#beginYear").text();
        if(bookSurveyId==""){
            alert("请选择课程");
            return false;
        }
       if($("input[name='position']").val()==''){
            alert("请填写职务");
            return false;
       } if($("input[name='jobTitle']").val()==''){
            alert("请填写职称");
            return false;
        }
       if($(""))
        if($("input[name='score1_1']").val()==''||$("input[name='score1_2']")==''||$("input[name='score1_3']").val()==''||$("input[name='score2_1']").val()==''||$("input[name='score2_2']").val()==''||$("input[name='score2_3']").val()==''||$("input[name='score3_1']").val()==''||$("input[name='score3_2']").val()==''||$("input[name='score4_1']").val()==''||$("input[name='score4_2']").val()==''||$("input[name='score5']").val()==''||$("input[name='score6']").val()==''||$("input[name='score7']").val()==''||$("input[name='score8']").val()==''){
            alert("请填写分数");
            return false;
        }

        $.ajax({
            url : '/teacher/bookSurvey/saveBookSurveyStudent',
            data : $('#bookSurveyForm').serialize(),
            type : "POST",
            success : function(data) {
                if(data.success){
                    alert(data.message);
                    location.href="/teacher/main/mindex"
                }else {
                    alert(data.message);
                }

            }
        });
    }
</script>
</body>
</body>
</html>
