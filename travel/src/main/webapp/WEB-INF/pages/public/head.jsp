<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>旅游网</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="/js/head.js"></script>
    <script src="/js/waterFall.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/travel.css">
</head>
<body>

<!-- 巨幕 -->
<%--<div class="jumbotron">--%>
    <%--<div class="container">--%>
        <%--<h1>Hello, world!</h1>--%>
    <%--</div>--%>
<%--</div>--%>

<!--页头-->
<%--<hr>--%>
    <%--<div class="container">--%>
        <%--<div class="row header-info">--%>
            <%--<div class="col-lg-1"><a href="/travel">首页</a></div>--%>
            <%--<div class="col-lg-1">推荐路线</div>--%>
            <%--<div class="col-lg-1">自由行</div>--%>
            <%--<div class="col-lg-1">酒店</div>--%>
            <%--<div class="col-lg-1">机票</div>--%>
            <%--<div class="col-lg-1"></div>--%>
            <%--<div class="col-lg-1"></div>--%>
            <%--<div class="col-lg-1"></div>--%>
            <%--<div class="col-lg-1"></div>--%>
            <%--<div class="col-lg-1"></div>--%>
            <%--<div class="col-lg-2">--%>
                <%--<c:if test="${userInfo == null}">--%>
                    <%--<a target="_blank" href="${pageContext.request.contextPath}/login" class="btn btn-default">登录</a>--%>
                    <%--<a target="_blank" href="${pageContext.request.contextPath}/register" class="btn btn-info">注册</a>--%>
                <%--</c:if>--%>
                <%--<c:if test="${userInfo != null}">--%>
                    <%--<ul class="nav navbar-nav">--%>
                        <%--<li class="dropdown">--%>
                            <%--<img src="${userInfo.url}" alt="" class="img-rounded" style="width: 40px;height: 40px;" data-toggle="modal" data-target="#myModal" />--%>
                            <%--<span class="caret"></span>--%>
                            <%--<ul class="dropdown-menu">--%>
                                <%--<li><a href="#">我的主页</a></li>--%>
                                <%--<li><a href="#">我的订单</a></li>--%>
                                <%--<li><a href="#">设置</a></li>--%>
                                <%--<li role="separator" class="divider"></li>--%>
                                <%--<li><a href="#">帮助与反馈</a></li>--%>
                                <%--<li><a href="#">退出</a></li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</c:if>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--<hr>--%>

<%--页头--%>
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
            <ul class="nav navbar-nav faq-tabbable">
                <li><a href="${pageContext.request.contextPath}/travel">首页 <span class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/travel/route/findAll">推荐路线</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/freewalk/main">自由行</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/destination/findAll">目的地</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/scenery/findAll">景点</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/food/findAll">美食</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/cate/findAll">店铺</a></li>
                <li><a href="${pageContext.request.contextPath}/travel/hotel/main">订酒店</a></li>
                <li><a href="#">帮助</a></li>
            </ul>


            <%--<form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/login" method="post">--%>
                <%--<div class="form-group">--%>
                    <%--<div class="input-group">--%>
                        <%--<input type="text" name="serach" class="form-control" placeholder="Search"/>--%>
                        <%--<span class="input-group-btn">--%>
                            <%--<a href="#" class="btn btn-default">--%>
                                <%--<span class="glyphicon glyphicon-search"></span>--%>
                            <%--</a>--%>
			            <%--</span>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</form>--%>

            <ul class="nav navbar-nav navbar-right">
                <c:if test="${userInfo == null}">
                    <li><a target="_self" href="${pageContext.request.contextPath}/login" >登录</a></li>
                    <li><a target="_self" href="${pageContext.request.contextPath}/register" class="btn btn-default" style="padding: 6px 12px;margin-top: 8px;">注册</a></li>
                </c:if>
                <c:if test="${userInfo != null}">
                    <li class="dropdown">
                        <a href="#" style="padding: 0;" ><img src="${userInfo.url}" alt="" class="img-circle" data-toggle="modal" data-target="#myModal" style="width: 50px;height: 50px;padding: 5px;"/>
                            <span class="caret" style="margin-top: 5px;"></span>
                        </a>
                        <ul class="dropdown-menu user-more">
                            <li><a target="_self" href="${pageContext.request.contextPath}/travel/user/homepage">我的主页</a></li>
                            <li><a target="_self" href="${pageContext.request.contextPath}/travel/user/orders?page=1&size=5">路线订单</a></li>
                            <li><a target="_self" href="${pageContext.request.contextPath}/travel/user/bookhotels?page=1&size=5">酒店订单</a></li>
                            <li><a href="#">帮助与反馈</a></li>
                            <li><a href="${pageContext.request.contextPath}/logout">退出</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>


        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<!-- 用户信息 -->
<div class="modal fade" style="margin: 200px;" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document" style="width: 666px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabe" style="text-align: center;">个人信息</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-4"><img src="${userInfo.url}" class="img-thumbnail" style="width: 180px;height: 180px;" /></div>
                        <div class="col-lg-8">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">用户名:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" name="username" value="${userInfo.username}"  placeholder="Username" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">电话号码:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" name="phoneNum" value="${userInfo.phoneNum}" placeholder="PhoneNum" readonly="readonly" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-3 control-label">email:</label>
                                    <div class="col-lg-9">
                                        <input type="email" class="form-control" name="email" value="${userInfo.email}" placeholder="Email" readonly="readonly" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="/logout" class="btn btn-danger">退出</a>
            </div>
        </div>
    </div>
</div>
