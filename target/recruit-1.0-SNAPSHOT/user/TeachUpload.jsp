<%--
  Created by IntelliJ IDEA.
  User: jianyan
  Date: 2020/6/14
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="path" scope="page"
/>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title></title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Vdist/css/bootstrapValidator.css" />

    <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/Vdist/js/bootstrapValidator.js"></script>
</head>
<body>
<div style="height: 500px" class="container">
    <h1 class="row">批量上传教师</h1>
    <form class="row" action="${path}/teach/excel" method="post"  enctype="multipart/form-data">
        <input type="file" class="col-4 form-control" name="file" id="" value="" />
        <input type="submit" class="col-4 btn" value="开始导入"/>
    </form>
    <div class="row">
        <img src="${path}/imgs/teach.png" class="img-thumbnail" alt="">
    </div>
</div>
</body>
</html>
