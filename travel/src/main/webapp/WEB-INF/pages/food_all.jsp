<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="food-all">
    <div class="container foods">
        <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading panel-head">
                    所有美食
                </div>
                <div class="panel-body">
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

    </div>
</div>

<%@ include file="public/foot.jsp"%>
