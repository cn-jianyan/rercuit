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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Vdist/css/bootstrapValidator.css" />

    <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/Vdist/js/bootstrapValidator.js"></script>
</head>
<body>
<form class="needs-validation mt-4" action="${pageContext.request.contextPath}/teacher/add" method="post" novalidate>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label for="inputEmail4">姓名</label>
            <input type="text" class="form-control"name="name"  id="inputEmail4">
        </div>
        <div class="form-group  col-md-6">
            <label for="inlineFormCustomSelect">性别</label>
            <select class="form-control" name="sex" id="inlineFormCustomSelect">
                <option  value="男">男</option>
                <option value="女" >女</option>
            </select>

        </div>
        <div class="form-group col-md-6">
            <label for="inputPassword4">账号</label>
            <input type="text" class="form-control" name="loginname" id="inputPassword4">
        </div>
        <div class="form-group col-md-6">
            <label >密码</label>
            <input type="text" class="form-control" name="loginpwd" >
        </div>
        <div class="form-group col-md-6">
            <label >招生地区</label>
            <input type="text" class="form-control" name="area" >
        </div>
        <div class="form-group col-md-6">
            <label >手机</label>
            <input type="number" class="form-control" name="phonenum" >
        </div>
        <div class="form-group col-md-6">
            <label >qq</label>
            <input type="number" class="form-control" name="qqnum" >
        </div>
        <div class="col-12">

        </div>


        <button type="submit " class="col-12 btn btn-primary form-control">提交</button>
    </div>
</form>
</body>
<script type="text/javascript">
    $(function() {
        $('form').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                loginname: {

                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 6,
                            message: '必须超过2个且少于6个字符'
                        },
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱无效'
                        }
                    }
                },
                loginpwd: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 5,
                            message: '密码必须至少包含6个字符'
                        }
                    }
                },
                idnumber: {
                    validators: {
                        notEmpty: {
                            message: '身份证号码不能为空'
                        },
                        stringLength: {
                            min: 18,
                            max: 18,
                            message: '身份证号码必须为18个字符'
                        },
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        },

                    }
                },
                phonenum: {
                    validators: {
                        notEmpty: {
                            message: '联系方式不能为空'
                        },

                    }
                },
                area: {
                    validators: {
                        notEmpty: {
                            message: '地区不能为空'
                        },

                    }
                },
            }
        }).on('success.form.bv', function(e) {
            console.log("aaa")
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
    });
</script>
</html>
