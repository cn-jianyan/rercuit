
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="path" scope="page"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>后台登录</title>


    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="${path}/dist/css/bootstrap.css"/>


    <meta name="theme-color" content="#563d7c">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        @media only screen and (max-width: 1000px) {
            .image{
                width: 100%;
                height: 100%;
            }
        }
        body{
            background-image: url("${path}/imgs/img.jpg");
            background-repeat:no-repeat;
            /* position:fixed;*/
            /* top: 0;*/
            /*left: 0;*/
            width:100%;
            height:100%;
            /* min-width: 1000px;*/
            /*z-index:-10;*/
            /* zoom: 1;*/
            /*background-color: #fff;*/
            background-size: cover;
            /*-webkit-background-size: cover;*/
            /*  -o-background-size: cover;*/
            /*  background-position: center 0;*/
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="${path}/js/signin.css" rel="stylesheet">
</head>
<body>
<div class="container text-center">
    <img class="image" src="${pageContext.request.contextPath}/imgs/LOGO.png" width="50%" height="50%">
    <form class="form-signin" action="${pageContext.request.contextPath}/teach/sign" method="post">
        <h1  class="h1 mb-3 font-weight-normal text-danger" >招生信息填报系统</h1>
        <h1 class="h3 mb-3 font-weight-normal" style="color: #ffffff">——Login from——</h1>
        <label for="inputAddress" class="sr-only">用户名</label>
        <input type="text" name="loginname" id="inputAddress" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="loginpwd" id="inputPassword" class="form-control" placeholder="密码" required>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" name="root"   value="admin" id="exampleCheck1">
            <label class="form-check-label small " for="exampleCheck1">root</label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
        <p class=" mb-3 text-muted"><br style="color: white;"></p>
        <p class="small  mb-3 text-muted">Log in to the enrollment management system?</p>
    </form>
</div>
</body>
</html>
