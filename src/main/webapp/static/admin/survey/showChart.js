var chartOutChar = null;

var option1 = {
    tooltip: {
        trigger: 'axis',
        formatter: '{b}:\n{c}%'
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['百分比']
    },
    xAxis: [
        {
            type: 'category',
            data: [],
            axisLabel:{
                interval:0,//横轴信息全部显示
                formatter : function(params){
                    var newParamsName = "";
                    var paramsNameNumber = params.length;
                    var provideNumber = 7;
                    var rowNumber = Math.ceil(paramsNameNumber / provideNumber);
                    if (paramsNameNumber > provideNumber) {
                        for (var p = 0; p < rowNumber; p++) {
                            var tempStr = "";
                            var start = p * provideNumber;
                            var end = start + provideNumber;
                            if (p == rowNumber - 1) {
                                tempStr = params.substring(start, paramsNameNumber);
                            } else {
                                tempStr = params.substring(start, end) + "\n";
                            }
                            newParamsName += tempStr;
                        }

                    } else {
                        newParamsName = params;
                    }
                    return newParamsName
                }
            }

            /*['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']*/
        }
    ],
    yAxis: [
        {
            type: 'value',
            name: '百分比',
            splitArea : {show:true},
            min:0,
            max:100,
            splitNumber:10,
            ccaler:true,
            axisLabel: {
                formatter: '{value} %'
            }
           /* min: 0,
            max: 250,
            interval: 50,
            axisLabel: {
            formatter: '{value} %'
            }*/
        }/*,
        {
            type: 'value',
            name: '温度',
            min: 0,
            max: 25,
            interval: 5,
            axisLabel: {
                formatter: '{value} °C'
            }
        }*/
    ],
    series: [
        {
            name:'百分比',
            type:'bar',
            itemStyle: {normal: {
                label : {show:true,position:'top',formatter:'{c} %'}
            }},
            data:[]
        }
    ]
};

function loadChartOut(id) {
    $.ajaxSettings.async=false;
    $.getJSON('/admin/questionare/viewResult/'+id, function (data) {
        //上面这个url是重点，组成为：项目名/过滤前缀/Controller中mapping值，当页面加载此js时，它会向后台取数据
        if (data.success1) {
            var arr=[];
            arr=data.iterm;
            var arr1=[];
            arr1=data.statics;
            var sum = 0;
            for(var index in arr1){
                sum += arr1[index];
            }
          for(var index in arr1){
              arr1[index] =  (arr1[index]/sum*100).toFixed(2);
          }
            /*alert(arr);
            alert(arr1);*/
            chartOutChar.showLoading({text: '正在努力的读取数据中...'});
            chartOutChar.setOption({
                xAxis:[{
                    type: 'category',
                    data: arr
                }
                ],
                series: [
                    {
                        name:'百分比',

                        itemStyle: {normal: {
                            label : {show:true,position:'top',formatter:'{c} %'}
                        }},
                        data:arr1
                    }
                ]
            });
            chartOutChar.hideLoading();
        }else {
            alert('提示', data.msg);
        }
    });
}


//载入图表
$(function () {
    showChars($(".ehzzz .chart-show"));
});
function showChars(divs) {

    divs.each(function (index,ele) {
        $.async=false
        chartOutChar = echarts.init(this);
        chartOutChar.setOption(option1);
        loadChartOut($(this).attr("id"));
        window.addEventListener('resize', function () {
            chartOutChar.resize();
            mychart.resize();
        });
    })
}
