/**
 * Created by lzq on 2017/5/5.
 */
var order=0;
var page=1;
var index=0;

$("#li_radio").click(function () {
    alert("我爱你");
    $("#question-box") .append('<div class="topic-type-content topic-type-question after-clear">' +
        '<div class="question-title" type="6" name="radio-question"><span class="required">*</span>' +
        '<span class="question-id" order="1" page="1" index="1" title-quote="N" choice-quote="0" absolute_id="1" question-required="Y" has_other="N" choice-random="0" choice-fixed="0" choice-logic="">Q1</span><div class="position-relative"><div class="qs-content edit-area edit-title" tabindex="0" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: medium none;" contenteditable="true">单选题</div>' +
        '</div></div>' +
        '<ul class="question-choice"><li class="choice" has_other="N" choice_required="0" choice_absolute_id="1"><input name="radio" type="radio"><div class="position-relative"><div class="edit-area edit-child-element" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: inline-block; border: medium none;" contenteditable="true">选项1</div></div><div class="option-tips"></div></li>' +
        '<li class="choice" has_other="N" choice_required="0" choice_absolute_id="2"><input name="radio" type="radio"><div class="position-relative"><div class="edit-area edit-child-element" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: inline-block; border: medium none;" contenteditable="true">选项2</div></div><div class="option-tips"></div></li></ul><div class="add-area visible-show"><ul><li class="add-choice" title="增加" onclick="edit.addQuestion(this)">' +
        '</li>' +
        '<li class="batch-add-choice" title="批量增加" onclick="edit.batchAddChoice(this)"></li></ul></div><div class="operate visible-show"><ul><li class="drag-area" title="移动"></li>' +
        '<li class="set-logic" title="逻辑设置" onclick="setLogic(this)"></li><li class="question-copy" title="复制" onclick="edit.questionCopy(this)"></li><li class="question-handle" title="操作" onclick="edit.questionHandle(this)">' +
        '</li><li class="question-delete" title="删除" onclick="edit.questionDelete(this)"></li></ul></div></div>');
});
function createRadioQuestion() {
    order++;
    alert("我爱你");
    $("#question-box") .append('<div class="topic-type-content topic-type-question after-clear"><div class="question-title" type="6" name="radio-question"><span class="required">*</span><span class="question-id" order=order+"" page="1"  title-quote="N" choice-quote="0" absolute_id="1" question-required="Y" has_other="N" choice-random="0" choice-fixed="0" choice-logic="">Q1</span><div class="position-relative"><div class="qs-content edit-area edit-title" tabindex="0" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border: medium none;" contenteditable="true"><input name="topic" value="${question.topic}"> 单选题</div>/div></div>' +
        '<ul class="question-choice"><li class="choice" has_other="N" choice_required="0" choice_absolute_id="1"><input name="radio" type="radio"><div class="position-relative"><div class="edit-area edit-child-element" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: inline-block; border: medium none;" contenteditable="true">选项1</div></div><div class="option-tips"></div></li>' +
        '<li class="choice" has_other="N" choice_required="0" choice_absolute_id="2"><input name="radio" type="radio"><div class="position-relative"><div class="edit-area edit-child-element" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; display: inline-block; border: medium none;" contenteditable="true">选项2</div></div><div class="option-tips"></div></li></ul><div class="add-area visible-show"><ul><li class="add-choice" title="增加" onclick="edit.addQuestion(this)">' +
        '</li>' +
        '<li class="batch-add-choice" title="批量增加" onclick="edit.batchAddChoice(this)"></li></ul></div><div class="operate visible-show"><ul><li class="drag-area" title="移动"></li>' +
        '<li class="set-logic" title="逻辑设置" onclick="setLogic(this)"></li><li class="question-copy" title="复制" onclick="edit.questionCopy(this)"></li><li class="question-handle" title="操作" onclick="edit.questionHandle(this)">' +
        '</li><li class="question-delete" title="删除" onclick="edit.questionDelete(this)"></li></ul></div></div>');
}
var textNumber = 1,sEle;
var qvalue=0;
function getSelect(){
    var qvalue = document.myForm.qtype.value;
    var addbutton=document.getElementById("add");
    if(qvalue!=3){
        addbutton.removeAttribute("disabled");
    }else if(qvalue==3){
        addbutton.setAttribute("disabled","false");
    }
}
function addTextBox(form, afterElement) {
    textNumber++;
    var label = document.createElement("label");
    label.setAttribute("class", "m_left");
    label.appendChild(document.createTextNode("选项"+textNumber+"："));
    var myTable = document.getElementById("myTable");
    var rowCnt = myTable.rows.length;
    var nextRow = myTable.insertRow(rowCnt - 1);
    var cellTitle = nextRow.insertCell(0);
    var cellText = nextRow.insertCell(1);
    cellTitle.className = "m_left";
    cellTitle.setAttribute("valign", "top");
    cellTitle.appendChild(label);
    var txtName = "txt" + textNumber;
    var txtId = "txt" + textNumber;
    cellText.innerHTML = "<input type='text' name='" + txtName + "' id='" + txtId + "' style=\"width:260px;\"/>";
}
function removeTextBox(form) {
    var myTable = document.getElementById("myTable");
    var rowCnt = myTable.rows.length;
    if (rowCnt > 4) {
        myTable.deleteRow(rowCnt-2);
        textNumber--;
    }
}
function saveQuestion() {
    $("#listCnt").val(textNumber);
    $("#createQuestion").submit();
}
function back() {
    window.history.back(-1);
}