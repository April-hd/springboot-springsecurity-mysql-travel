<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="container user-bookhotels">
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading panel-head">
                酒店订单
            </div>
            <div class="panel-body">
                <c:forEach items="${pageInfo.list}" var="bookHotel">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <h4>订单信息</h4>
                                <hr>
                                <div class="col-lg-4">
                                    订单编号：${bookHotel.num}
                                </div>
                                <div class="col-lg-3">
                                    下单时间：${bookHotel.createTime}
                                </div>
                                <div class="col-lg-2">
                                    <c:if test="${bookHotel.status == 0}">
                                        支付方式：未支付
                                    </c:if>
                                    <c:if test="${bookHotel.status == 1}">
                                        <c:if test="${bookHotel.payType == 1}">
                                            支付方式：微信支付
                                        </c:if>
                                        <c:if test="${bookHotel.payType == 2}">
                                            支付方式：支付宝支付
                                        </c:if>
                                    </c:if>
                                </div>
                                <div class="col-lg-2">
                                    下单账号：${bookHotel.userInfo.username}
                                </div>
                            </div>
                            <div class="row">
                                <h4>购买信息</h4>
                                <hr>
                                <div class="col-lg-3">${bookHotel.hotel.name}</div>
                                <div class="col-lg-2">人数：${bookHotel.peopleCount}人,共${bookHotel.price}元</div>
                                <div class="col-lg-2">居住时间：${bookHotel.liveTime}</div>
                                <div class="col-lg-2">离店时间：${bookHotel.leaveTime}</div>
                                <div class="col-lg-3">
                                    <c:if test="${bookHotel.status == 0}">
                                        <button class="btn btn-default">取消订单</button>
                                        <button class="btn btn-warning">立即支付</button>
                                    </c:if>
                                    <c:if test="${bookHotel.status == 1}">
                                        已支付
                                    </c:if>
                                    <c:if test="${bookHotel.status == 2}">
                                        已取消
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${pageInfo.size > 0}">
                    <div class="row">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="${pageContext.request.contextPath}/travel/user/bookhotels?page=1&size=5">
                                        <span aria-hidden="true">首页</span>
                                    </a>
                                </li>
                                <c:if test="${pageInfo.pageNum > 1}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/travel/user/bookhotels?page=${pageInfo.pageNum-1}&size=5" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                    <li><a href="${pageContext.request.contextPath}/travel/user/bookhotels?page=${pageNumber}&size=5">${pageNumber}</a></li>
                                </c:forEach>
                                <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/travel/user/bookhotels?page=${pageInfo.pageNum+1}&size=5" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <a href="${pageContext.request.contextPath}/travel/user/bookhotels?page=${pageInfo.pages}&size=5">
                                        <span aria-hidden="true">尾页</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

</div>

</body>
</html>
