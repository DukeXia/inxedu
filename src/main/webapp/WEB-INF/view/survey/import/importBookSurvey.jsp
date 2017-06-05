<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/5/21
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入教材评价</title>
    <script type="text/javascript">
        function importExcel(){

            var myFile = $("#myFile").val();
            if(myFile.length <= 0){
                alert("请选择导入内容");
                return false;
            }
            $("#importP").submit();
        }
    </script>
</head>
<body>

<br>
<font color="black" size="5px">导入教材评价</font><br>
<div class="mt20">
    <div class="commonWrap">
        <form action="/admin/excelSurvey/importBookSurveyImport" method="post" id="importP" enctype="multipart/form-data">
            <input value="${bookSurveyTermId}" name="bookSurveyTermId" type="hidden">

            <table width="100%" cellspacing="0" cellpadding="0" border="0" class="commonTab01">
                <caption>&nbsp;</caption>
                <tbody>
                <tr>
                    <td align="center"><font color="red">*</font>&nbsp;信息描述</td>
                    <td>班级excel模版说明：<br>
                        第一列：问卷标题，不能空<br>
                        第二列：发起问卷的学院或单位，不能为空<br>
                        第三列：开始学年，不能为空<br>
                        第四列：结束学年，不能为空<br>
                        第五列：学期序号，不能为空<br>
                        第六列：教材名称，不能为空<br>
                        第七列：教材主编，不能为空<br>
                        第八列：出版时间，不能为空<br>
                        第九列：出版社，不能为空<br>
                        第十列：类型，0表示学生，1表示老师，不能为空
                        （<a href="${ctx}/static/common/import_student/import_booksurvey.xlsx"  style="color: red;">点击下载模版</a>）<br>
                    </td>
                </tr>
                <tr>
                    <td align="center">导入中出错选择项</td>
                    <td>
                        <select name="mark">
                            <option value="1">跳过</option>
                            <option value="2">全部放弃</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td align="center">上传</td>
                    <td>
								<span class="ml10"><input id="myFile" type="file" value="" name="myFile"/><input type="button" value="提交" class="btn btn-danger"  onclick="importExcel()"/>
								<a href="javascript:history.go(-1);" title="返回" class="btn btn-danger">返回</a>
								</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

    </div>
</div>
</body>
</html>
