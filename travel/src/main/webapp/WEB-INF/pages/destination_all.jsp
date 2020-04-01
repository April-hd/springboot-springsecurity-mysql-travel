<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>
<div class="destination-all">
    <div class="container">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading panel-head">
                    所有目的地
                </div>
                <div class="panel-body">
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
    </div>
</div>
<%@ include file="public/foot.jsp"%>
