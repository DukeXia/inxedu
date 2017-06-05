/**
 * Created by 梁自强 on 2017/5/1.
 */
function  saveBookSurvey() {

    $("#bookSurveyForm").submit();
}
function selectBookSurvey(){
    window.open(baselocation+'/teacher/bookSurvey/list/' ,'newwindow', 'toolbar=no,scrollbars=yes,location=no,resizable=no,top=150,left=300,width=923,height=600');
}
function selectExperiment() {
    window.open(baselocation+'/bookSurvey/selectExoerimentList' ,'newwindow', 'toolbar=no,scrollbars=yes,location=no,resizable=no,top=150,left=300,width=923,height=600');
}
function confirmSelectExperiment() {
    var teahcer = $("input[name='ids']:checked");
    if(teahcer==null || teahcer.length==0){
        alert("请选择实验课");
        return false;
    }
    var tr = teahcer.closest('tr')
    var  tds = tr.find('td');
    var tc={'id1':$("input[name='ids']:checked").val(),'courseName':tds.eq(1).text(),'school':tds.eq(2).text(),'labClassName': tds.eq(3).text(),'teacher':tds.eq(4).text(),'labAddress':tds.eq(5).text()};

    var teahcerArr = new Array();
    teahcerArr.push(tc);
    window.opener.addExperimentList(teahcerArr);
    closeWin();
}
/**
 * 添加到指定位置
 *
 */
function addExperimentList(experiment) {
       $("#school").val(experiment[0].school);
       $("#courseName").val(experiment[0].courseName);
       $("#labClassName").val(experiment[0].labClassName);
       $("#teacher").val(experiment[0].teacher);
       $("#labAddress1").val(experiment[0].labAddress);
        $("#experimentId").val(experiment[0].id1);

}
/**
 * 确认选择
 */
function confirmSelect(){
    var teahcer = $("input[name='ids']:checked");
    if(teahcer==null || teahcer.length==0){
        alert("请选择教材");
        return false;
    }
    var tr = teahcer.closest('tr')
      var  tds = tr.find('td');
    var tc={'id1':teahcer.val(),'title':tds.eq(4).text(),'author': tds.eq(5).text(),'publishDate':tds.eq(6).text(),'publishHouse':tds.eq(7).text(),'school':tds.eq(2).text(),'beginYear':tds.eq(8).text(),'endYear':tds.eq(9).text(),'termNumber':tds.eq(10).text()};

    var teahcerArr = new Array();
    teahcerArr.push(tc);
    window.opener.addTeahcerList(teahcerArr);
    closeWin();
}
/**
 * 关闭窗口
 */
function closeWin(){
    window.close();
}
function addTeahcerList(tcArr) {
       $("#p1").text(tcArr[0].title);
       $("#book td")[1].innerHTML=tcArr[0].author;
       $("#book td")[2].innerHTML=tcArr[0].publishDate;
       $("#book td")[3].innerHTML=tcArr[0].publishHouse;
       $("#school").text(tcArr[0].school);
       $("#beginYear").text(tcArr[0].beginYear);
       $("#endYear").text(tcArr[0].endYear);
       $("#termNumber").text(tcArr[0].termNumber);
       $("#bookSurveyId").val(tcArr[0].id1);
}