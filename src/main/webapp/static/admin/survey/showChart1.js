// var chartOutChar = null;
//
// var option1 = {
//     tooltip: {
//         trigger: 'axis'
//     },
//     toolbox: {
//         feature: {
//             dataView: {show: true, readOnly: false},
//             magicType: {show: true, type: ['line', 'bar']},
//             restore: {show: true},
//             saveAsImage: {show: true}
//         }
//     },
//     legend: {
//         data:['百分比']
//     },
//     xAxis: [
//         {
//             type: 'category',
//             data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
//
//             /*['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']*/
//         }
//     ],
//     yAxis: [
//         {
//             type: 'value',
//             name: '百分比'
//
//            /* min: 0,
//             max: 250,
//             interval: 50,
//             axisLabel: {
//                 formatter: '{value} ml'
//             }*/
//         }/*,
//         {
//             type: 'value',
//             name: '温度',
//             min: 0,
//             max: 25,
//             interval: 5,
//             axisLabel: {
//                 formatter: '{value} °C'
//             }
//         }*/
//     ],
//     series: [
//         {
//             name:'百分比',
//             type:'bar',
//             data:[]
//         }
//     ]
// };
//
// function loadChartOut(id) {
//     $.getJSON('/maze/rest/view/rain.html'+id, function (data) {
//         //上面这个url是重点，组成为：项目名/过滤前缀/Controller中mapping值，当页面加载此js时，它会向后台取数据
//         if (data.success1) {
//             chartOutChar.showLoading({text: '正在努力的读取数据中...'});
//             chartOutChar.setOption({
//                 xAxis:[{
//                     type: 'category',
//                     data: data.iterm
//                 }
//                 ],
//                 series: [
//                     {
//                         name:'百分比',
//                         data:data.statics
//                     }
//                 ]
//             });
//             chartOutChar.hideLoading();
//         }else {
//             alert('提示', data.msg);
//         }
//     });
// }
//
//
// //载入图表
// $(function () {
//     showChars($(".main1 div"));
//     window.addEventListener('resize', function () {
//         chartOutChar.resize();
//         mychart.resize();
//     });
// });
// function showChars(divs) {
//     divs.each(function (index,ele) {
//         chartOutChar = echarts.init(document.getElementById($(this).attr("id")));
//         chartOutChar.setOption(option1);
//         loadChartOut(id);
//     })
// }
function showCharts() {

    $(".ehzzz").children(".chart-show").each(function (index,ele) {

        var myChart = echarts.init(this);
        var option = {
            title: {
                text: 'ECharts 入门示例'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [5, 20, 36, 10, 10, 20]
            }]
        };

// 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    });



}

$(function () {
    showCharts();
// 指定图表的配置项和数据

    // var canvas = document.getElementsByTagName("canvas");
    // var ctx = null;
    // for(var i = 0;i<canvas.length;i++){
    //     ctx=canvas[i].getContext("2d");
    //     ctx.scale(0.8,0.8);
    // }
})

