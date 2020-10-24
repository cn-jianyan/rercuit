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
<body>
<div class="container-fluid" id="tb">
    <table class="table table-striped ">
        <thead>
        <tr class="small">
            <th scope="col">#</th>
            <th scope="col">操作记录</th>
            <th scope="col">操作人</th>
            <th scope="col">操作时间</th>
            <th scope="col">操作</th>
        </tr>
        </thead>
        <tbody class="small">
        <tr v-for="lg,index in p.list">
            <th scope="row">{{index}}</th>
            <td>{{lg.operatingrecord}}</td>
            <td>{{lg.admin.name}}</td>
            <td>{{new Date(lg.operatingdate)}}</td>
            <td>
                <div class="btn-group border " style="border-radius: 30px;">
                    <button type="button" class="btn " @click="del(lg.lid,$event)">删除</button>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item" v-show="p.hasPreviousPage">
                <a class="page-link"  @click="search(p.pageNum-1)" href="#"><-</a>
            </li>
            <li class="page-item"  v-show="p.hasPreviousPage">
                <a class="page-lin0"><a class="page-link" @click="search(p.pageNum-1)" href="#">{{p.pageNum-1}}</a></li>
            <li class="page-item active"><a class="page-link"  @click="search(p.pageNum)" href="#">{{p.pageNum}}</a></li>
            <li class="page-item"  v-show="p.pageNum+1<p.pages"><a class="page-link"  @click="search(p.pageNum+1)" href="#">{{p.pageNum+1}}</a></li>
            <li class="page-item" v-show="p.hasNextPage">
                <a class="page-link"  @click="search(p.pageNum+1)" href="#">-></a>
            </li>
        </ul>
    </nav>

    <div class="row small justify-content-end">当前页:{{p.pageNum}}，总页:{{p.pages}}，总记录:{{p.total}}</div>
</div>

<script type="text/javascript">

    var tb=new Vue({
        el:"#tb",
        data:{
            p:""
        },
        methods:{
            del:function (val,event) {
                // console.log(val);
                $.ajax({
                    url: "${path}/log/delete/"+val,
                    type: "get",
                    success:function (result) {
                        if(result==1){
                            alert("删除成功");
                            event.target.parentNode.parentNode.parentNode.remove();
                        }
                        else{
                            alert("删除失败");
                        }
                    }

                })
            },
            search:function (val) {
                const that = this;
                console.log(val);
                $.ajax({
                    url:"${path}/log/selectLimit/"+val,
                    type:"get",
                   // data:this.stued,
                    success:function(result){
                        // console.log(that.stued);

                        tb.$data.p=result;

                    }
                })
            }
        }
    })
    $.ajax({
        url:"${path}/log/selectLimit/1",
        type:"get",
        success:function(result){

            tb.$data.p=result;

        }
    })


</script>

</body>
</html>
