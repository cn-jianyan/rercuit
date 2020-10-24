<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="path" scope="page"
/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <script src="${path}/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${path}/dist/css/bootstrap.css"/>
    <script src="${path}/js/jquery-3.4.1.min.js"></script>
    <script src="${path}/dist/js/bootstrap.bundle.js" type="text/javascript" charset="utf-8"></script>
</head>
<div class="container-fluid justify-content-center" id="tb">
    <form action="${path}/stu/down" method="get" class="row form-inline col p-3">
        <input v-model="stued.name" placeholder="名字" type="text" name="名字" value="" class="form-control col col-xs-6" />
        <select  v-model="stued.sex"  placeholder="性别"  class="form-control col  col-xs-6"  >
            <option value =""></option>
            <option value ="男">男</option>
            <option value ="女">女</option>
        </select>
        <input type="number"  v-model="stued.phonenum"   placeholder="电话" class="form-control col  col-xs-6"  />

     <%--   <input type="number"  v-model="stued.teach.tid"   placeholder="招生老师ID" class="form-control col  col-xs-6"  />
 --%>       <button type="button" class="form-control bg-secondary text-white" @click="search(1)">搜索</button>
        <button type="submit" class="form-control bg-secondary text-white">导出</button>
    </form>
    <table class="table table-striped ">
        <thead>
        <tr class="small border">
            <th scope="col">#</th>
            <th scope="col">姓名</th>
            <th scope="col"  v-show="bool">性别</th>
            <th scope="col" v-show="bool">年龄</th>
            <th scope="col"  v-show="bool">籍贯</th>
            <th scope="col">电话</th>
            <th scope="col" >操作</th>
        </tr>
        </thead>
        <tbody class="small">
        <tr v-for="i,index in p.list" class="border">
            <th scope="row">{{index}}</th>
            <td  >{{i.name}}</td>
            <td  v-show="bool">{{i.sex}}</td>
            <td  v-show="bool">{{i.age}}</td>
            <td  v-show="bool">{{i.origin}}</td>
            <td  >{{i.phonenum}}</td>

            <td>
                <div class="btn-group mr-2 small" role="group" aria-label="First group">
                    <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#exampleModal" @click="see(index)">
                        <svg class="bi bi-person" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M13 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM3.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        </svg></button>
                    <a type="button" class="btn btn-secondary" :href="update(i.sid)">
                        <svg class="bi bi-arrow-counterclockwise" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M12.83 6.706a5 5 0 0 0-7.103-3.16.5.5 0 1 1-.454-.892A6 6 0 1 1 2.545 5.5a.5.5 0 1 1 .91.417 5 5 0 1 0 9.375.789z"/>
                            <path fill-rule="evenodd" d="M7.854.146a.5.5 0 0 0-.708 0l-2.5 2.5a.5.5 0 0 0 0 .708l2.5 2.5a.5.5 0 1 0 .708-.708L5.707 3 7.854.854a.5.5 0 0 0 0-.708z"/>
                        </svg></a>
                    <button type="button" class="btn btn-secondary" @click="del(i.sid,$event)">
                        <svg class="bi bi-person-dash" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M11 14s1 0 1-1-1-4-6-4-6 3-6 4 1 1 1 1h10zm-9.995-.944v-.002.002zM1.022 13h9.956a.274.274 0 0 0 .014-.002l.008-.002c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664a1.05 1.05 0 0 0 .022.004zm9.974.056v-.002.002zM6 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4zm3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm2 2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5z"/>
                        </svg></button>
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
                <a class="page-link" @click="search(p.pageNum-1)" href="#">{{p.pageNum-1}}</a></li>
            <li class="page-item active"><a class="page-link"  @click="search(p.pageNum)" href="#">{{p.pageNum}}</a></li>
            <li class="page-item"  v-show="p.pageNum+1<p.pages"><a class="page-link"  @click="search(p.pageNum+1)" href="#">{{p.pageNum+1}}</a></li>
            <li class="page-item" v-show="p.hasNextPage">
                <a class="page-link"  @click="search(p.pageNum+1)" href="#">-></a>
            </li>
        </ul>
    </nav>

    <div class="row small justify-content-end">当前页:{{p.pageNum}}，总页:{{p.pages}}，总记录:{{p.total}}</div>
    <div  class=" modal  fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content card">
                <div class="modal-header card-header">
                    <h5 class="modal-title" id="exampleModalLabel">学生信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body card-body">



                    <div class="text small p-4 " v-if="stu!=''" >
<%--                        <p>{{key}}  ：{{val}}</p>--%>
                        <h6 class="">姓名:{{stu.name}}</h6>
                        <p>性别:{{stu.sex}}</p>
                        <p>年龄:{{stu.age}}</p>
                        <p>手机:{{stu.phonenum}}</p>
                        <p>籍贯：{{stu.origin}}</p>
                        <p>名族：{{stu.national}}</p>
                        <p>高考准考证：{{stu.ticket}}</p>
                        <p>班主任：{{stu.headteach}}</p>
                        <p>身份证：{{stu.idnumber}}</p>
                        <p>报考专业：{{stu.major}}</p>
                        <p>qq：{{stu.qqnum}}</p>
                        <p>学校名称：{{stu.school}}</p>
                        <p>地区： {{stu.area}}</p>
                        <p>招生老师：{{stu.teach.name}}</p>
                        <p>紧急联系人：{{stu.emergencycontact}}</p>
                        <p>紧急联系人电话：{{stu.emergencycontacnumber}}</p>
                        <p><span>备注信息：</span>{{stu.remark}}</p>
                    </div>
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
            bool:true,
            stu:"",
            stued:{
                name:"",
                sex:"",
                phonenum:"",

            }
        },
        methods:{
            see:function (val) {
                // alert(val);
                this.stu=this.p.list[val];
                console.log(this.stu);
            },
            update:function (val) {
                //console.log("${path}/stu/selectOne/"+val);
                return "${path}/stu/selectOne/"+val;
            },
            del:function (val,event) {
                // console.log(val);


                $.ajax({
                    url: "${path}/stu/delete/"+val,
                    type: "get",
                    success:function (result) {
                        if(result==1){
                            alert("删除成功---");

                            location.reload();
                            // event.target.parentNode.parentNode.parentNode.parentNode.remove();
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
                    url:"${path}/stu/selectLimit/"+val,
                    type:"get",
                    data:this.stued,
                    success:function(result){
                        // console.log(that.stued);

                        tb.$data.p=result;

                    }
                })
            }
        },
        created() {
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
            var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
            var bIsMidp = sUserAgent.match(/midp/i) == "midp";
            var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
            var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
            var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
            // document.writeln("您的浏览设备为：");
            if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
                this.bool=false;

            } else {
                this.bool=true;
            }
        }
    })
    $.ajax({
        url:"${path}/stu/selectLimit/1",
        type:"get",
        success:function(result){
            // console.log(result.list[0]);
            console.log(result);
            tb.$data.p=result;

        }
    })
</script>
<body>
</body>
</html>
