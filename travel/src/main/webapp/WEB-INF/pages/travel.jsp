<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<!-- 轮播图片 -->
<div class="carousel-bg">
    <div class="container-fluid" style="padding: 0;">
        <div class="carousel slide" id="slidershow" data-ride="carousel">
        <!--设置轮播图片的顺序-->
        <ol class="carousel-indicators">
            <li class="active" data-target="#slidershow" data-slide-to="0"></li>
            <li data-target="#slidershow" data-slider-to="1"></li>
            <li data-target="#slidershow" data-slider-to="2"></li>
            <li data-target="#slidershow" data-slider-to="3"></li>
            <li data-target="#slidershow" data-slider-to="4"></li>
            <li data-target="#slidershow" data-slider-to="5"></li>
            <li data-target="#slidershow" data-slider-to="6"></li>
            <li data-target="#slidershow" data-slider-to="7"></li>
            <li data-target="#slidershow" data-slider-to="8"></li>
            <li data-target="#slidershow" data-slider-to="9"></li>
        </ol>
        <!--设置轮播图片-->
        <div class="carousel-inner">
            <c:forEach items="${carousels}" var="carousel">
                <div class="item">
                    <img src="${carousel.url}" alt="" />
                    <div class="carousel-caption">
                        <h4><fmt:formatDate value="${carousel.createTime}" pattern="d/MM.yyyy"></fmt:formatDate>&nbsp;&nbsp;${carousel.chinese}&nbsp;&nbsp;${carousel.english}</h4>
                        <h3>${carousel.carDesc}</h3>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!--设置轮播图片控制器-->
        <a href="#slidershow" data-slide="prev" class="left carousel-control" role="button">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#slidershow" data-slide="next" class="right carousel-control" role="button">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
    </div>
</div>

<div class="container destination" style="margin-top: 20px;">
    <div class="panel panel-default">
        <div class="panel-body destination">
            <!-- 热门旅游目的地 -->
            <h3 class="page-header" style="text-align: center;margin-top: 0;">热门目的地<span style="font-size: 14px;"><a target="_blank" href="${pageContext.request.contextPath}/travel/destination/findAll">查看更多</a></span></h3>
            <div class="row">
                <c:forEach items="${destinations}" var="destination">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6">
                        <div class="thumbnail">
                            <img src="${destination.url}" alt="...">
                            <div class="caption">
                                <h3>${destination.name}</h3>
                                <p class="ellipsis">${destination.destiDesc}</p>
                                <c:if test="${destination.status == 1}">
                                    <p><a target="_blank" href="${destination.href}?id=${destination.id}" class="btn btn-warning" role="button">点击查看景点</a></p>
                                </c:if>
                                <c:if test="${destination.status == 0}">
                                    <p><button class="btn btn-warning disabled" role="button" disabled="disabled">暂未开通</button></p>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<div class="container route">
    <div class="panel panel-default">
        <div class="panel-body route">
            <!-- 热门旅游路线 -->
            <h3 class="page-header" style="text-align: center;margin-top: 0;">热门旅游路线<span style="font-size: 14px;"><a target="_blank" href="${pageContext.request.contextPath}/travel/route/findAll?page=1&size=5">查看更多</a></span></h3>
            <c:forEach items="${routes}" var="route">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-3"><img src="../../images/路线.jpg"><a href="" >${route.name}</a></div>
                            <div class="col-lg-2"><img src="../../images/日历.jpg"><span>游玩时间：${route.time}天</span></div>
                            <div class="col-lg-2"><img src="../../images/太阳.jpg"><span>最佳季节：${route.season}月</span></div>
                            <div class="col-lg-2"><img src="../../images/价格.jpg"><span>价格：${route.price}元</span></div>
                            <c:if test="${route.status == 1}">
                                <div class="col-lg-2"><a target="_blank" href="${pageContext.request.contextPath}${route.href}?routeId=${route.id}" class="btn btn-warning">查看路线详情</a></div>
                            </c:if>
                            <c:if test="${route.status == 0}">
                                <div class="col-lg-2"><button class="btn btn-warning" disabled="disabled">查看路线详情</button></div>
                            </c:if>
                            <div class="col-lg-1"><img src="${route.url}"></div>
                        </div>
                        <hr>
                        <div class="row">
                            <c:forEach items="${route.routePhotoList}" var="routePhoto">
                                <div class="col-xs-6 col-md-3">
                                    <a href="#" class="thumbnail">
                                        <img style="height: 163px;" src="${routePhoto.url}" alt="...">
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="container foods">
    <div class="panel panel-default">
        <div class="panel-body">
            <!-- 美食 -->
            <h3 class="page-header" style="text-align: center;margin-top: 0;" >美食<span style="font-size: 14px;"><a target="_blank" href="${pageContext.request.contextPath}/travel/food/findAll">查看更多</a></span></h3>
            <div class="items">
                <c:forEach items="${foods}" var="food">
                    <div class="item">
                        <img src="${food.url}" alt="" class="img-thumbnail"/>
                        <div class="avater">
                            <h5>${food.name}</h5>
                            <p>${food.price}</p>
                            <p class="ellipsis">${food.foodDesc}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 住宿 -->
<%--<div class="accommodation">--%>
    <%--<div class="container">--%>
        <%--<h2 class="page-header" style="text-align: center">住宿</h2>--%>
    <%--</div>--%>
<%--</div>--%>

<%@ include file="public/foot.jsp"%>