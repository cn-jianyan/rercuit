<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="path" scope="page"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script src="${path}/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${path}/dist/css/bootstrap.css"/>
    <script src="${path}/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/dist/js/bootstrap.bundle.js" type="text/javascript" charset="utf-8"></script>
</head>
<div class="container-fluid" id="tb">
    <div class="row">
        <form action="${path}/stu/down" method="get" class="row form-inline col p-3">
            <input v-model="teach.name" placeholder="名字" type="text" name="名字" value="" class="form-control col col-xs-6" />
            <select  v-model="teach.sex"  placeholder="性别"  class="form-control col  col-xs-6"  >
                <option value =""></option>
                <option value ="男">男</option>
                <option value ="女">女</option>
            </select>
            <input type="text"  v-model="teach.area"   placeholder="招生地区" class="form-control col  col-xs-6"  />

            <%--   <input type="number"  v-model="stued.teach.tid"   placeholder="招生老师ID" class="form-control col  col-xs-6"  />
        --%>       <button type="button" class="form-control bg-secondary text-white" @click="search()">搜索</button>
        </form>
    </div>
    <div class="row justify-content-center">
        <div v-for="i,index in p.list" class="card m-3" style="width: 18rem;">
            <div class="card-header bg-info label">
               招生老师信息
            </div>
            <div class="card-body text-black-50 justify-content-around">
                <h6 class="">姓名:{{i.name}}</h6>
                <div class="card-text">
                    <p>性别:{{i.sex}}</p>
                    <p>qq:{{i.qqnum}}</p>
                    <p>手机:{{i.phonenum}}</p>
                    <p>招生地区：{{i.area}}</p>
                    <p>账号：{{i.loginname}}</p>
                    <p>密码：{{i.loginpwd}}</p>

                </div>
                <div class="btn-group border " style="border-radius: 30px;">
                    <a :href="update(i.tid)" class="btn " >修改</a>
                    <button type="button" class="btn " v-on:click="del(this,i.tid)">删除</button>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var tb=new Vue({
        el:"#tb",
        data:{
            p:"",
            teach:{
                name:"",
                sex:"",
                area:""
            }
        },
        methods:{
            search:function () {
                var that=this;
                $.ajax({
                    url:"${path}/teach/selectLimit/0",
                    data: that.teach,
                    type:"get",
                    success:function(result){

                        tb.$data.p=result;

                    }
                })
            }
            ,
            update:function (val) {
                console.log("${path}/teach/selectOne/"+val);
                return "${path}/teach/selectOne/"+val;
            },
            del:function (a,val) {
                console.log(val);
                $.ajax({
                    url: "${path}/teach/delete/"+val,
                    type: "get",
                    success:function (result) {
                        if(result==1){
                            alert("删除成功");
                            a.parentNode.parentNode.parentNode.remove();
                        }
                        else{
                            alert("删除失败");
                        }
                    }

                })
            }
        }
    })
    $.ajax({
        url:"${path}/teach/selectLimit/0",
        type:"get",
        success:function(result){

            tb.$data.p=result;

        }
    })
</script>
<body>
</body>
</html>
