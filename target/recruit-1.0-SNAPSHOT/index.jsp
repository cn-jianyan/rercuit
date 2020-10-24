<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<c:set value="<%=request.getContextPath()%>" var="path" scope="page"/>
<c:if test="${empty admin}">
  <c:set value="${teach.name}" var="name" scope="page"></c:set>
</c:if>
<c:if test="${admin!=null}">
  <c:set value="${admin.name}" var="name" scope="page"></c:set>
</c:if>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="${path}/production/images/favicon.ico" type="image/ico" />

    <title>| | </title>

    <!-- Bootstrap -->
    <link href="${path}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${path}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${path}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${path}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="${path}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${path}/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${path}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${path}/build/css/custom.min.css" rel="stylesheet">
	<script src="${path}/js/jquery-3.4.1.min.js" type="text/javascript"></script>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
             <%-- <a href="#" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>--%>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">

                <img src="${path}/production/images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>User</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> 学生管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li>
                        <a href="${path}/stu.jsp"  target="win">主页面</a>
                      </li>

                      <li>
                        <a href="${path}/stuAdd.jsp"  target="win">新增学员</a>
                      </li>
                      <li>
                        <a href="${path}/stuview.jsp"  target="win">数据图</a>
                      </li>
                    </ul>
                  </li>
                  <c:if test="${admin !=null}">
                  <li><a><i class="fa fa-edit"></i> 老师管理 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li>
                        <a href="${path}/teach.jsp" target="win">主页面</a>
                      </li>

                      <li>
                        <a href="${path}/teachAdd.jsp"  target="win">新增老师</a>
                      </li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i>管理员 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li>
                        <a href="${path}/admin.jsp" target="win">主页面</a>
                      </li>

                      <li>
                        <a href="${path}/adminAdd.jsp"  target="win">新增管理员</a>
                      </li>
                    </ul>
                  </li>
                  </c:if>
                </ul>
              </div>
              <div class="menu_section">
               <!-- <h3>Live On</h3> -->
                <ul class="nav side-menu">
                    </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
           <%-- <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>--%>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <nav class="nav navbar-nav">
              <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                  <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                    <img src="${path}/production/images/img.jpg" alt="">${name}
                  </a>
                  <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                    <c:if test="${empty admin}">
                      <a  class="row dropdown-item"  href="${path}/teach/selectOne/${teach.tid}" class=" btn border" target="win">修改个人信息</a>
                    </c:if>
                    <c:if test="${empty teach}">
                      <a  class="row dropdown-item"  href="${path}/admin/selectOne/${admin.aid}" class=" btn border" target="win">修改个人信息</a>
                    </c:if>
                    <a class="row dropdown-item"  href="${path}/teach/exit" class=" btn border">退出</a>

                    <%--<a class="dropdown-item"  href="javascript:;">Help</a>
                    <a class="dropdown-item"  href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
              --%>    </div>
                </li>


              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col row" role="main">
          <iframe name="win"  id="iFrame" class="flexiframe" src="${path}/stuview.jsp" style="padding: 0;width:100%;" marginwidth="0" frameborder="no" scrolling="no"
                  height="2000px"></iframe>

        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
           <%-- Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>--%>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="${path}/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${path}/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="${path}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${path}/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${path}/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${path}/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${path}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="${path}/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="${path}/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${path}/vendors/Flot/jquery.flot.js"></script>
    <script src="${path}/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="${path}/vendors/Flot/jquery.flot.time.js"></script>
    <script src="${path}/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="${path}/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${path}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${path}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${path}/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${path}/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="${path}/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="${path}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="${path}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${path}/vendors/moment/min/moment.min.js"></script>
    <script src="${path}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${path}/build/js/custom.min.js"></script>


    <script>
      function setIframeHeight(iframe) {
        if (iframe) {
          var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
          if (iframeWin.document.body) {
            iframe.height = iframeWin.document.body.scrollHeight;
          }
        }
      };
      $(".flexiframe").each(function (index) {
        var that = $(this);
        (function () {
          setInterval(function () {
            setIframeHeight(that[0])
          }, 200)
        })(that)
      });
    </script>
  </body>
</html>
