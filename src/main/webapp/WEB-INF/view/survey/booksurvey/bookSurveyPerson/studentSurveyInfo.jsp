<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生教材评价详情</title>
    <style type="text/css">
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
            margin: 0;
            padding: 0;
            border: 0;
            background-color: #fff;
            text-align: center;

        }

    </style>
</head>
<body style="text-align: center;">
<form action="/bookSurvey/saveBookSurveyStudent" id="bookSurveyForm">
    <div style="text-align: center;width: 772px;margin: 0 auto;">
        <h3 style=" width:100%;height: 35px;line-height: 35px;text-align: center;margin: 45px 0 ;"    >齐齐哈尔大学教材质量评价表</h3>
        <div style="height: 50px;"><span style="float: left;"> _______${bookSurvey.surveySchool}____   学院（部、中心）</span><span style="float: right;">___${bookSurvey.beginYear}___ / __${bookSurvey.endYear}__  学年第  _${bookSurvey.termNumber}_ 学期</span></div>
        <table style="border: 1px solid #222;"   width="100%" rules="all">
            <tr>
                <td>教 材 名 称</td><td>主编姓名</td><td>出版时间</td><td>出 版 社</td>
            </tr>
            <tr>
                <td><input type="text" name="" disabled="disabled" value="${bookSurvey.title}"></td>
                <td><input type="text" disabled="disabled" value="${bookSurvey.author}
            " style="padding-left: 47px;"></td>
                <td><input type="text" disabled="disabled" value="<fmt:formatDate value="${bookSurvey.publicDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
           " style="padding-left: 42px"></td>
                <td><input type="text"disabled="disabled" value="${bookSurvey.publishingHouse}"></td>
            </tr>
            <tr>
                <td>专 业</td>
                <td>班 级</td>
                <td>填 表 人</td>
                <td>填 表 时 间</td>
            </tr>
            <tr>
                <td><input name="majorName" type="text" disabled="disabled" value="${bookSurveyStudent.className}"></td>
                <td><input type="text" name="className" disabled="disabled" value="${bookSurveyStudent.className}" ></td>
                <td><input type="text" name="studentName" disabled="disabled" value="${bookSurveyStudent.studentName}"></td>
                <td><input type="text" name="createDate" disabled="disabled" value="<fmt:formatDate value="${bookSurveyStudent.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>"></td>
            </tr>
            <tr>
                <td>评 价 指 标</td>
                <td>内 涵 说 明</td>
                <td>分 值</td>
                <td>得 分</td>
            </tr>
            <tr>
                <td>教材内容的深度与广度</td>
                <td>取材合适、深度适宜、分量恰当；内容丰富，符合认知规律，富有启发性，利于能力培养。</td>
                <td>10</td>
                <td class="j_click"><input  name="score1" data-rule="required;digits;" value="${bookSurveyStudent.score1}" type="text"></td>
            </tr>
            <tr>
                <td>教材内容的系统性与完整性</td>
                <td>能反映知识间的相互联系及发展规律，结构严谨；绪论、正文、习题、思考题、索引、参考文献等齐全，易于理解、掌握。</td>
                <td>15</td>
                <td class="j_click"><input name="score2" value="${bookSurveyStudent.score2}" data-rule="required;digits;" type="text"></td>
            </tr>
            <tr>
                <td>教材内容的逻辑性与思想性</td>
                <td>层次分明，条理清楚；思想观点正确，弘扬民族文化精华，无政治性和政策性错误。</td>
                <td>15</td>
                <td class="j_click"><input  name="score3" value="${bookSurveyStudent.score3}" data-rule="required;digits;" type="text"></td>
            </tr>
            <tr>
                <td>教材内容的表达水平</td>
                <td>文字简练规范，语言流畅，通俗易懂，叙述生动，图表科学规范，可读性强，适合学生的阅读水平。</td>
                <td>20</td>
                <td class="j_click"><input  name="score4" data-rule="required;digits;" value="${bookSurveyStudent.score4}" type="text"></td>
            </tr>
            <tr>
                <td>教材内容的正确性</td>
                <td>教材内容与教学大纲一致，满足本课程教学目标的基本要求，满足本专业培养目标的基本要求</td>
                <td>20</td>
                <td class="j_click"><input name="score5" data-rule="required;digits;" value="${bookSurveyStudent.score5}" type="text"></td>
            </tr>
            <tr>
                <td>教材印刷装订质量</td>
                <td>印刷质量好，装订规范。</td>
                <td>10</td>
                <td class="j_click"><input name="score6" data-rule="required;digits;"  value="${bookSurveyStudent.score6}" type="text"></td>
            </tr>
            <tr>
                <td>教材价格</td>
                <td>价格适宜</td>
                <td>10</td>
                <td class="j_click"><input  name="score7"data-rule="required;digits;" value="${bookSurveyStudent.score7}" type="text" id="last"></td>
            </tr>
            <tr>
                <td>总分</td>
                <td id="sum_grade" colspan="3"> <input name="score"    type="text" value="${bookSurveyStudent.score}"> </td>
            </tr>
            <tr>
                <td style="vertical-align:top">对教材质量的具体意见和建议： <br>
                </td>
                <td colspan="3"><textarea name="memo" column="100" row="10" style="width: 623px; height: 168px;resize: none;border: 0;padding: 0;" >
                    ${bookSurveyStudent.memo}
                </textarea></td>
            </tr>
        </table>
        <input type="button" onclick="back()" value="返回" style="background-color: #ccc; border-radius: 50%;cursor: pointer;width: 210px;margin-bottom: 20px;height: 38px;">
    </div>
</form>
<script type="text/javascript">
    function back(){
        window.history.back(-1);

    }
</script>
</body>

</html>
