// 基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
var myChart1 = echarts.init(document.getElementById('main1'));
var myChart2 = echarts.init(document.getElementById('main2'));
var names=[]; var size=[];
var sexview=[];
var names2=[]; var size2=[];


function school() {
    names=[]; size=[];
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/school",
        type:"get",
        success:function(result){
            console.log(result);
            for(var key in result){
                names.push(key);
                size.push(result[key]);
            }
            loadData();

        }
    })
}
function sex() {
    names=[]; size=[];
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/sex",
        type:"get",
        success:function(result){
            console.log(result);
            for(var key in result){
                var s={
                    value:"",
                    name:""
                }
               s.name=key;
                s.value=result[key];
                sexview.push(s);
            }


        }
    })
}
function area() {
    names=[]; size=[];
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/area",
        type:"get",
        success:function(result){
            console.log(result);
            for(var key in result){
                names2.push(key);
                size2.push(result[key]);
            }


        }
    })
}
function f() {
    sex();
    school();
    area();
    loadData();
}
function loadData() {
// 指定图表的配置项和数据
    var option = {
        title: {
            text: '学生统计图'
        },
        tooltip: {},
        legend: {
            data:['数量']
        },
        xAxis: {
            data: names
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            data: size
        }]
    };
    var option1 = {
        //设置
        title:{
            text:'男女统计',
            subtext:'9月',
            x:'center'
        },
        tooltip:{
            trigger:'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        //对图例组件的不同系列进行标记说明
        legend:{
            orient:'vertical',  //设置图例列表的布局朝向
            left:'left',
            data:[]
        },
        //系列列表
        series:[
            //系列1
            {
                name:'学生成绩分布',
                type:'pie',    //数据统计图的类型
                //放置要展示的数据
                data:sexview
            }
        ]
    };
    var option2 = {
        title: {
            text: '学生统计图'
        },
        tooltip: {},
        legend: {
            data:['数量']
        },
        xAxis: {
            data: names2
        },
        yAxis: {},
        series: [{
            name: '数量',
            type: 'bar',
            data: size2
        }]
    };


    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    myChart1.setOption(option1);
    myChart2.setOption(option2);
}

console.log(sexview);
f();