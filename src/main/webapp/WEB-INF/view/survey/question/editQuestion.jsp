<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑题目</title>
    <script type="text/javascript">
        function back() {
            window.history.back(-1);
        }
        var qvalue=0;
        function getSelect(){
            var qvalue = document.myForm.qtype.value;
            var addbutton=document.getElementById("add");
            if(qvalue!=3){
                //alert("你选的是"+qvalue);
                //window.location.reload();
                addbutton.removeAttribute("disabled");
            }else if(qvalue==3)
            {
                //alert("你选的是文本类");
                addbutton.setAttribute("disabled","false");
            }
        }
        function addTextBox(form, afterElement) {
            var myTable = document.getElementById("myTable");
            var rowCnt = myTable.rows.length;
            var textNumber = (rowCnt-3);
            var sEle;
            textNumber++;
            var label = document.createElement("label");
            label.setAttribute("class", "m_left");
            label.appendChild(document.createTextNode("选项"+textNumber+": "));
            var nextRow = myTable.insertRow(rowCnt - 1);
            var cellTitle = nextRow.insertCell(0);
            var cellText = nextRow.insertCell(1);
            cellTitle.className = "m_left";
            cellTitle.setAttribute("valign", "top");
            cellTitle.appendChild(label);
            var txtName = "txt_" + (textNumber-1);
            var txtId = "txt_" + (textNumber-1);
            //alert(txtName);
            cellText.innerHTML = "<input type='text' name='" + txtName + "' id='" + txtId + "' value='"+"' style=\"width:260px;\"/>";
        }
        function removeTextBox(form) {
            var textNumber = (rowCnt-3);
            var myTable = document.getElementById("myTable");
            var rowCnt = myTable.rows.length;
            myTable.deleteRow(rowCnt-2);
            textNumber--;
            if (textNumber < 4) {
                alert("至少得有一个选项!");
            }
        }
        //提交
        function updateQuestion(){
                var listCnt = document.getElementById("listCnt");
                var myTable = document.getElementById("myTable");
                var textNumber = myTable.rows.length;
                listCnt.value = (textNumber-3);

                $("#createQuestion").submit();
                return true;
        }
    </script>
</head>

<body>
<form action="/admin/question/editQuestion" id="createQuestion" name="myForm" method="post">
    <input type="button" onclick="updateQuestion()" value="更新问题">
    <input type="button" id="a" onclick="back()" value="返回">
    <input type="hidden" value="${question.id}" name="questionId">
    <input type="hidden" value="${question.questionareId}" name="questionareId">
    <table width="500" border="0" align="center" cellpadding="2"
           cellspacing="1" id="myTable" class="tab">
        <tr>
            <td width="60px">题目：</td>
            <td><input type="text" name="topic" value="${question.topic}" style="width:300px;"  data-rule="required;"/></td>
        </tr>
        <tr>
            <td valign="top">类型：</td>
            <td><select name="type" onchange=getSelect()
                        style="width:120px;">
                <option value="3" <c:if test="${question.type==3}">selected</c:if> >单选</option>
                <option value="4" <c:if test="${question.type==4}">selected</c:if> >多选</option>
                <option value="2" <c:if test="${question.type==2}">selected</c:if> >下拉框</option>
                <option value="1" <c:if test="${question.type==1}">selected</c:if> >文本框</option>
            </select>
            </td>
        </tr>
        <c:forEach var="iterms" items="${question.items}" varStatus="status">

            <tr>
                <td valign="top"><label> 选项${iterms.sortNum}： </label></td>
                <td><input type="text" name="txt_${status.index}" id="txt_${status.index}"
                           value="${iterms.item}" style="width:260px;" /></td>
            </tr>
        </c:forEach>
        <tr>
            <td><input type="hidden" name="listCnt" id="listCnt" value="" />
                <input type="hidden" name="oid" value=""/></td>
            <td id="td1"><input type="button" value="添加选项 " name="add"
                                onclick="addTextBox(this.form,this.parentNode)" class="btn" /> <input
                    type="button" value="删除选项 " onclick="removeTextBox(this.form)"
                    class="btn" /></td>
        </tr>
    </table>
</form>
</body>
</html>
