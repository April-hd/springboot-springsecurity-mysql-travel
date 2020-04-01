<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>
<div class="scenery-all">
    <div class="container">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading panel-head">
                    所有景点
                </div>
                <div class="panel-body">
                    <div class="row">
                        <c:forEach items="${sceneries}" var="scenery">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="${scenery.url}" alt="...">
                                    <div class="caption">
                                        <h3>${scenery.name}</h3>
                                        <p>${scenery.location}</p>
                                        <p>${scenery.openTime}</p>
                                        <span>${scenery.level}&nbsp;&nbsp;|&nbsp;&nbsp;${scenery.price}</span>
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
