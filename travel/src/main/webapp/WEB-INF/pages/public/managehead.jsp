<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>欢迎进入后台管理页面</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="/js/managehead.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/manage.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Travel</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页<span class="sr-only">(current)</span></a></li>
                <li><a href="#">Link</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">帮助 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
            </ul>
            <%--<form class="navbar-form navbar-left">--%>
                <%--<div class="form-group">--%>
                    <%--<input type="text" class="form-control" placeholder="Search">--%>
                <%--</div>--%>
                <%--<button type="submit" class="btn btn-default">Submit</button>--%>
            <%--</form>--%>
            <%--<ul class="nav navbar-nav navbar-right">--%>
                <%--<li><a href="#">Link</a></li>--%>
                <%--<li class="dropdown">--%>
                    <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                        <%--<li><a href="#">Action</a></li>--%>
                        <%--<li><a href="#">Another action</a></li>--%>
                        <%--<li><a href="#">Something else here</a></li>--%>
                        <%--<li role="separator" class="divider"></li>--%>
                        <%--<li><a href="#">Separated link</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
            <%--</ul>--%>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
    <div class="left">
        <div class="left-top">
            <img src="${ADMINSESSION.url}" class="img-circle"/>
            <p><security:authentication property="principal.username"></security:authentication></p>
            <p><a href="/logoutManage" class="btn btn-danger">退出</a></p>
        </div>
        <div class="left-bottom">
            <div class="list-group faq-tabbable">
                <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel" class="list-group-item">网站首页管理</a>
                <a href="${pageContext.request.contextPath}/manage/user/findAllUser" class="list-group-item">用户管理</a>
                <a href="${pageContext.request.contextPath}/manage/role/findAllRole" class="list-group-item">角色管理</a>
                <a href="${pageContext.request.contextPath}/manage/destination/findAllDestination" class="list-group-item">目的地管理</a>
                <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery" class="list-group-item">景点管理</a>
                <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel" class="list-group-item">酒店管理</a>
                <a href="${pageContext.request.contextPath}/manage/cates/findAllCate" class="list-group-item">美食店管理</a>
                <a href="${pageContext.request.contextPath}/manage/food/findAllFood" class="list-group-item">美食管理</a>
                <a href="${pageContext.request.contextPath}/manage/route/findAllRoute" class="list-group-item">路线管理</a>
                <a href="${pageContext.request.contextPath}/manage/order/findAllOrder" class="list-group-item">路线订单管理</a>
                <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel" class="list-group-item">酒店订单管理</a>
                <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord" class="list-group-item">留言管理</a>
                <a href="${pageContext.request.contextPath}/manage/syslog/findAll" class="list-group-item">系统日志管理</a>
            </div>
        </div>
    </div>