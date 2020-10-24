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
		<div class="container">
			<form action="${path}/admin/update" method="post">
				<div class="form-group">
					<label>账号:</label>
					<input type="text" class="form-control" name="loginname" readonly value="${admin.loginname}" />
				</div>
				<div class="form-group">
					<label>密码:</label>
					<input type="password"   class="form-control" name="loginpwd" value="${admin.loginpwd}" />
				</div>
				<div class="form-group">
					<label>姓名:</label>
					<input type="text"  class="form-control"  name="name" value="${admin.name}" />
				</div>
				<div class="form-group">
					<label>部门:</label>
					<input type="text"  class="form-control"  name="dept" value="${admin.dept}" />
				</div>
				<button type="submit" class="btn border active" >提交</button>
			</form>
		</div>
	</body>
</html>

