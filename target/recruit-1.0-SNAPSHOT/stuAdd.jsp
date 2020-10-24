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
<form class="needs-validation  mt-4" action="${pageContext.request.contextPath}/stu/add" method="post" novalidate>
    <div class="form-row">
        <div class="form-group col-md-6">
            <label >姓名</label>
            <input type="text"  class="form-control"name="name"  value="">
        </div>
        <div class="form-group  col-md-6">
            <label for="inlineFormCustomSelect">性别</label>
            <select class="form-control" name="sex" id="inlineFormCustomSelect">
                <option  value="男">男</option>
                <option value="女" >女</option>
            </select>

        </div>
        <div class="form-group col-md-6">
            <label for="inputPassword4">年龄</label>
            <input type="number"  class="form-control" name="age" id="inputPassword4"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >籍贯</label>
            <input type="text"  class="form-control" name="origin"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >名族</label>
            <input type="text"  class="form-control" name="national"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >高考准考证号</label>
            <input type="text" class="form-control" name="ticket"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >班主任姓名</label>
            <input type="text" class="form-control" name="headteacher"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >身份证</label>
            <input type="text"  class="form-control" name="idnumber"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >报考专业</label>
            <input type="text"  class="form-control" name="major"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >手机</label>
            <input type="text"  class="form-control" name="phonenum"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >qq</label>
            <input type="text" class="form-control"  name="qqnum" value="" >
        </div>
        <div class="form-group col-md-6">
            <label >紧急联系人</label>
            <input type="text"  class="form-control" name="emergencycontact" value="" >
        </div>
        <div class="form-group col-md-6">
            <label >紧急联系人电话</label>
            <input type="text"  class="form-control" name="emergencycontacnumber"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >学校</label>
            <input type="text"  class="form-control" name="school"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >地区</label>
            <input type="text"  class="form-control" name="area"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >招生老师id</label>
            <input type="number"  class="form-control" name="teach.tid"  value="">
        </div>
        <div class="form-group col-md-6">
            <label >填报日期</label>
            <input type="date" class="form-control"  name="createdate"  value="">
        </div>

        <div class="form-group  col-md-6">
            <label for="inputAddress">家庭住址</label>
            <input type="text"  class="form-control" id="inputAddress" name="address"  value="" placeholder="家庭住址">
        </div>

        <div class="form-group  col-12">
            <label >备注信息</label>
            <textarea class="form-control"  name="remark"  value=""></textarea>
        </div>


        <button type="submit" class="col-12 btn btn-primary form-control">提交</button>




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
                username: {
                    message: '用户名验证失败',
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
                password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        stringLength: {
                            min: 6,
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
                age: {
                    validators: {
                        notEmpty: {
                            message: '年龄不能为空'
                        },

                    }
                },
                origin: {
                    validators: {
                        notEmpty: {
                            message: '籍贯不能为空'
                        },

                    }
                },
                national: {
                    validators: {
                        notEmpty: {
                            message: '名族不能为空'
                        },

                    }
                },
                major: {
                    validators: {
                        notEmpty: {
                            message: '专业方向不能为空'
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
                address: {
                    validators: {
                        notEmpty: {
                            message: '家庭住址不能为空'
                        },

                    },
                    emergencycontact: {
                        validators: {
                            notEmpty: {
                                message: '紧急联系人不能为空'
                            },

                        }
                    },
                    emergencycontacnumber: {
                        validators: {
                            notEmpty: {
                                message: '紧急联系人电话不能为空'
                            },

                        }
                    },
                    school: {
                        validators: {
                            notEmpty: {
                                message: '学校不能为空'
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
                    createdate: {
                        validators: {
                            notEmpty: {
                                message: '填报时间不能为空'
                            },

                        }
                    },


                }

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
