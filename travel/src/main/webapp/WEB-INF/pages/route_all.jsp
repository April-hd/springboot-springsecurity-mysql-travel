<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="route-all">
    <div class="container">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading panel-head">
                    所有路线
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-1"><a target="_self" class="btn btn-warning" href="${pageContext.request.contextPath}/travel/route/findAll?page=1&size=5" >按默认排序</a></div>
                        <div class="col-lg-1"><a target="_self" class="btn btn-warning" href="${pageContext.request.contextPath}/travel/route/findAllByHeat?page=1&size=5" >按热度排序</a></div>
                        <div class="col-lg-1"><a target="_self" class="btn btn-warning" href="${pageContext.request.contextPath}/travel/route/findAllByPrice?page=1&size=5" >按价格排序</a></div>
                        <div class="col-lg-1"><a target="_self" class="btn btn-warning" href="${pageContext.request.contextPath}/travel/route/findAllByTime?page=1&size=5" >按天数排序</a></div>
                    </div>
                    <c:forEach items="${pageInfo.list}" var="pageInfo">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-3"><img src="../../images/路线.jpg"><span class="route-img-span"><a href="" >${pageInfo.name}</a></span></div>
                                    <div class="col-lg-2"><img src="../../images/太阳.jpg"><span class="route-img-span">最佳季节：${pageInfo.season}月</span></div>
                                    <div class="col-lg-2"><img src="../../images/日历.jpg"><span class="route-img-span">游玩时间：${pageInfo.time}天</span></div>
                                    <div class="col-lg-2"><img src="../../images/价格.jpg"><span class="route-img-span">价格：${pageInfo.price}元</span></div>
                                    <div class="col-lg-3"><img src="../../images/热度.jpg"><span class="route-img-span">热度：${pageInfo.heat}</span>
                                        <c:if test="${pageInfo.status == 1}">
                                            <span><a target="_blank" href="${pageContext.request.contextPath}${pageInfo.href}?routeId=${pageInfo.id}" class="btn btn-warning">查看路线详情</a></span>
                                        </c:if>
                                        <c:if test="${pageInfo.status == 0}">
                                            <span><a href="" class="btn btn-warning" disabled="disabled">查看路线详情</a></span>
                                        </c:if>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <c:forEach items="${pageInfo.routePhotoList}" var="routePhoto">
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
                    <div class="row">
                        <div class="col-lg-6 col-lg-offset-6">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}${window.location.pathname}?page=1&size=5">
                                            <span aria-hidden="true">首页</span>
                                        </a>
                                    </li>
                                    <c:if test="${pageInfo.pageNum > 1}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}${window.location.pathname}?page=${pageInfo.pageNum-1}&size=5" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                        <li><a href="${pageContext.request.contextPath}${window.location.pathname}?page=${pageNumber}&size=5">${pageNumber}</a></li>
                                    </c:forEach>
                                    <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}${window.location.pathname}?page=${pageInfo.pageNum+1}&size=5" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <li>
                                        <a href="${pageContext.request.contextPath}${window.location.pathname}?page=${pageInfo.pages}&size=5">
                                            <span aria-hidden="true">尾页</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<%@ include file="public/foot.jsp"%>