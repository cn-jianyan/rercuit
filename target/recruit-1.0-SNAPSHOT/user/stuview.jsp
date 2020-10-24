
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="path" scope="page"
/>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="<%=request.getContextPath()%>/js/echarts.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${path}/dist/css/bootstrap.css"/>

    <script src="${path}/dist/js/bootstrap.bundle.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div class="container mt-4">
    <%--"--%>
    <div class="container-fluid">

        <div class="row border" style="height: auto;">
            <div   class="col-md-6 col-xs-12"  style="width: 100%;height:300px;">
                <img src="${path}/imgs/img.jpg" class="img-thumbnail" alt="..">
            </div>
            <div id="main2" class="col-md-6 col-xs-12" style="width: 100%;height:300px;"></div>
           
        </div>
        <div class="row border "  style="height: auto;">
            <div id="main" class="col-md-6 col-xs-12" style="width: 100%;height:300px;"></div>
            <div id="main1"  class="col-md-6 col-xs-12"  style="width: 100%;height:300px;"></div>
        </div>

    </div>

</div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var myChart1= echarts.init(document.getElementById('main1'));
    var myChart2= echarts.init(document.getElementById('main2'));

    var names=[]; var size=[];
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/school",
        type:"get",
        success:function(result){

            for(key in result){
                names.push(key);
                size.push(result[key]);

            }

            loadData();

        }
    })
    function loadData() {
// 指定图表的配置项和数据
        var option = {
            title: {
                text: '学校'
            },
            tooltip: {},
            legend: {
                data:['数量']
            },
            grid:{
                height:200
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

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }

    //地区的
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/area",
        type:"get",
        success:function(result){
            var arr1=[];
            var arr2=[];

            for(key in result){
                arr1.push(key);
                arr2.push(result[key]);

            }
          myChart1.setOption({
              title: {
                  text: '地区'
              },
              grid:{
                  height:200
              },
              tooltip: {},
              legend: {
                  data:['数量']
              },
              xAxis: {
                  data: arr1
              },
              yAxis: {},
              series: [{
                  name: '数量',
                  type: 'bar',
                  data: arr2
              }]
          })

        }
    });

    //性别
    $.ajax({
        url:"<%=request.getContextPath()%>/stu/view/sex",
        type:"get",
        success:function(result){
            var arr=[];
            var sexname=[];
            for(key in result){
               var s={
                   value:"",
                   name:""
               }
               s.value=result[key];
               s.name=key;
               sexname.push(key);
               arr.push(s);
            }
            console.log(arr);

            myChart2.setOption({
                //设置
                title:{
                    text:'男女比例图',
                    subtext:'',
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
                    data:sexname
                },
                //系列列表
                series:[
                    //系列1
                    {
                        name:'比例',
                        type:'pie',    //数据统计图的类型
                        //放置要展示的数据
                        data:arr
                    }
                ]
            })

        }
    })

</script>
</body>
</html>
