<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>
<div class="cate-all">
    <div class="container">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading panel-head">
                    所有店铺
                </div>
                <div class="panel-body">
                    <div class="row">
                        <c:forEach items="${cates}" var="cate">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="${cate.url}" alt="...">
                                    <div class="caption">
                                        <h4><strong>${cate.name}</strong></h4>
                                        <p class="ellipsis" style="-webkit-line-clamp: 1;">${cate.location}</p>
                                        <p class="ellipsis" style="-webkit-line-clamp: 2;">${cate.catesDesc}</p>
                                        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
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
