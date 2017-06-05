<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生教材评价</title>
    <style type="text/css">
        html,body{
            width: 100%;
            margin: 0;
            padding: 0;
        }
        form{
            width: 100%;
            margin: 0;
            padding: 0;
        }
        table{
            border-collapse: collapse;
            border-spacing: 0;
            margin-bottom: 17px;
        }
        table tr td {
            margin: 0;
            padding: 0;
            border:1px solid #999999;
            vertical-align: middle;
        }
        input{
            
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

</head>
<body style="text-align: center;">
<form action="/bookSurvey/saveBookSurveyStudent" id="bookSurveyForm" style="width: 60%;margin: 0 auto;">
    <input type="hidden" name="studentNo" value="${user.no}">
    <input type="hidden" name="bookSurveyId" value="${bookSurvey.id}">
<div style="text-align: center;width:100%;margin: 0 auto;">
    <h3 style=" width:100%;height: 35px;line-height: 35px;text-align: center;margin: 45px 0 ;"    >齐齐哈尔大学教材质量评价表</h3>
    <div style="height: 50px;"><span style="float: left;text-decoration: underline"> ${bookSurvey.surveySchool}</span><span style="float: left;">学院（部、中心）</span><span style="float: right;text-decoration: underline">${bookSurvey.beginYear}/ ${bookSurvey.endYear}  学年第 ${bookSurvey.termNumber}学期</span></div>
    <table <%--style="border: 1px solid #222;"--%>   width="100%" rules="all">
        <tr style="height: 50px">
            <td>教 材 名 称</td><td>主编姓名</td><td>出版时间</td><td>出 版 社</td>
        </tr>
        <tr style="height: 50px">
            <td><input type="text" name="title" readonly="readonly" value="${bookSurvey.title}"></td>
            <td><input type="text" readonly="readonly" value="${bookSurvey.author}
            " style="padding-left: 47px;"></td>
            <td><input type="text" readonly="readonly" value="<fmt:formatDate value="${bookSurvey.publicDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
           " style="padding-left: 42px"></td>
            <td><input type="text" readonly="readonly" value="${bookSurvey.publishingHouse}"></td>
        </tr>
        <tr style="height: 50px">
        <td>专 业</td>
        <td>班 级</td>
        <td>填 表 人</td>
        <td>填 表 时 间</td>
    </tr>
        <tr style="height: 50px">
            <td><input name="majorName" type="text" readonly="readonly" value="${stuClass.className}"></td>
            <td><input type="text" name="className" readonly="readonly" value="${stuClass.className}" ></td>
            <td><input type="text" name="studentName" readonly="readonly" value="${user.userName}"></td>
            <td ><input type="text" name="createDate" readonly="readonly" value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"></fmt:formatDate>"></td>
        </tr>
        <tr style="height: 50px;">
            <td>评 价 指 标</td>
            <td>内 涵 说 明</td>
            <td>分 值</td>
            <td>得 分</td>
        </tr>
        <tr style="height: 80px;">
            <td>教材内容的深度与广度</td>
            <td>取材合适、深度适宜、分量恰当；内容丰富，符合认知规律，富有启发性，利于能力培养。</td>
            <td>10</td>
            <td class="j_click"><input  name="score1" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材内容的系统性与完整性</td>
            <td>能反映知识间的相互联系及发展规律，结构严谨；绪论、正文、习题、思考题、索引、参考文献等齐全，易于理解、掌握。</td>
            <td>15</td>
            <td class="j_click"><input name="score2" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材内容的逻辑性与思想性</td>
            <td>层次分明，条理清楚；思想观点正确，弘扬民族文化精华，无政治性和政策性错误。</td>
            <td>15</td>
            <td class="j_click"><input  name="score3" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材内容的表达水平</td>
            <td>文字简练规范，语言流畅，通俗易懂，叙述生动，图表科学规范，可读性强，适合学生的阅读水平。</td>
            <td>20</td>
            <td class="j_click"><input  name="score4" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材内容的正确性</td>
            <td>教材内容与教学大纲一致，满足本课程教学目标的基本要求，满足本专业培养目标的基本要求</td>
            <td>20</td>
            <td class="j_click"><input name="score5" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材印刷装订质量</td>
            <td>印刷质量好，装订规范。</td>
            <td>10</td>
            <td class="j_click"><input name="score6" value="" data-rule="required;digits;" type="text"></td>
        </tr>
        <tr style="height: 80px;">
            <td>教材价格</td>
            <td>价格适宜</td>
            <td>10</td>
            <td class="j_click"><input  name="score7" data-rule="required;digits;" type="text" id="last"></td>
        </tr>
        <tr style="height: 40px;">
            <td>总分</td>
            <td id="sum_grade" colspan="3"> <input name="score"   type="text" value="0" readonly="readonly"> </td>
        </tr>
        <tr>
            <td style="vertical-align:top;border-right: 0;">对教材质量的具体意见和建议： <br>
                </td>
            <td colspan="3" style="border-left: 0;"><textarea name="memo" column="100" row="10" style="padding-top: 2px;width: 623px; height: 168px;resize: none;border: 0;" ></textarea></td>
        </tr>
    </table>
        <input type="button" onclick="saveBookStudent()" value="提交" style="background-color: #ccc; border-radius: 50%;cursor: pointer;width: 210px;margin-bottom: 20px;height: 38px;">
</div>
</form>
<script>
    $(function () {

        $(".j_click").on("click",function () {
            $(this).children().eq(0).trigger("focus");
        });
        $(".j_click input").on("blur",function () {
            if(!isNaN(parseInt($(this).val()))){
                if(parseInt($(this).val())>parseInt($(this).parent().prev().text())){
                    $(this).after("<span class='msg-box n-right'  style='' for='score3'><span role='alert'' class='msg-wrap n-error'><span class='n-icon'></span><span class='n-msg'>输入的得分超过最大数值</span></span></span>");
                    $(this).val("");
                }
                else{
                    $(this).next().remove();
                }
            }
            var sum = 0;
            $(".j_click input").each(function () {
               sum += parseInt($(this).val());
            });
            $("#sum_grade input").val(sum);

        })

    });

    $(document).ready(function() {

        var options = {
            type: 'POST',   // target element(s) to be updated with server response
            beforeSubmit: function s() {

                alert(valid());
                return false;
            },
            dataType: 'json',
            success:  function successRes(jsonData){
                if (jsonData.success) {
                    alert(jsonData.message);
                    location.href = "/bookSurvey/showBookSurveyList"
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

    function valid() {
        $('#bookSurveyForm').validator({
            stopOnError: false,
            timely: true,
            fields: {
                'score1':'required;digits',
                'score2':'required;digits',
                'score3':'required;digits',
                'score4':'required;digits',
                'score5':'required;digits',
                'score6':'required;digits',
                'score7':'required;digits'
            },
            valid: function () {
                return 1;
            },
            invalid:function () {
                return 2;
            }
        });

    }
  function saveBookStudent() {

       /* alert("add");*/
     /* $('#bookSurveyForm').validator({
          stopOnError: false,
          timely: true,
          fields: {
              'score1':'required;digits',
              'score2':'required;digits',
              'score3':'required;digits',
              'score4':'required;digits',
              'score5':'required;digits',
              'score6':'required;digits',
              'score7':'required;digits'
          },
          valid: function () {*/
            if($("input[name='score1']").val()==''||$("input[name='score2']")==''||$("input[name='score3']").val()==''||$("input[name='score4']").val()==''||$("input[name='score5']").val()==''||$("input[name='score6']").val()==''||$("input[name='score7']").val()==''){
                alert("请填写分数");
                return false;
            }
              $.ajax({
                  url: '/bookSurvey/saveBookSurveyStudent',
                  data: $("#bookSurveyForm").serialize(),
                  type: "POST",
                  success: function (data) {
                      if (data.success) {
                          alert(data.message);
                          location.href = "/bookSurvey/showBookSurveyList"
                      } else {
                          alert(data.message);
                      }
                  }
              });
          /*,}
          invalid:function () {
              return 2;
          }
      });*/

  }
</script>
</body>

</html>