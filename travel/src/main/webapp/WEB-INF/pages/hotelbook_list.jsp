<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>酒店订单管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-11">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/bookhotel/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>订单编号</label>
                            <input type="text" class="form-control" name="bookHotelNum" placeholder="BookHotelNum" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${bookHotels != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th>id</th>
                                <th>订单编号</th>
                                <th>酒店名</th>
                                <th>下单时间</th>
                                <th>入住时间</th>
                                <th>离店时间</th>
                                <th>人数</th>
                                <th>总价</th>
                                <th>下单账号</th>
                                <th>订单状态</th>
                                <th>支付方式</th>
                            </tr>
                            <c:forEach items="${bookHotels}" var="bookHotel">
                                <tr>
                                    <td>${bookHotel.id}</td>
                                    <td>${bookHotel.num}</td>
                                    <td>${bookHotel.hotel.name}</td>
                                    <td>${bookHotel.createTime}</td>
                                    <td>${bookHotel.liveTime}</td>
                                    <td>${bookHotel.leaveTime}</td>
                                    <td>${bookHotel.peopleCount}</td>
                                    <td>${bookHotel.price}</td>
                                    <td>${bookHotel.userInfo.username}</td>
                                    <c:if test="${bookHotel.status == 0}">
                                        <td>未支付</td>
                                        <td>待定</td>
                                    </c:if>
                                    <c:if test="${bookHotel.status == 1}">
                                        <td>已支付</td>
                                        <c:if test="${bookHotel.payType == 1}">
                                            <td>支付宝支付</td>
                                        </c:if>
                                        <c:if test="${bookHotel.payType == 2}">
                                            <td>微信支付</td>
                                        </c:if>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${bookHotels.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有酒店订单</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th>id</th>
                                <th>订单编号</th>
                                <th>酒店名</th>
                                <th>下单时间</th>
                                <th>入住时间</th>
                                <th>离店时间</th>
                                <th>人数</th>
                                <th>总价</th>
                                <th>下单账号</th>
                                <th>订单状态</th>
                                <th>支付方式</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.num}</td>
                                    <td>${pageInfo.hotel.name}</td>
                                    <td>${pageInfo.createTime}</td>
                                    <td>${pageInfo.liveTime}</td>
                                    <td>${pageInfo.leaveTime}</td>
                                    <td>${pageInfo.peopleCount}</td>
                                    <td>${pageInfo.price}</td>
                                    <td>${pageInfo.userInfo.username}</td>
                                    <c:if test="${pageInfo.status == 0}">
                                        <td>未支付</td>
                                        <td>待定</td>
                                    </c:if>
                                    <c:if test="${pageInfo.status == 1}">
                                        <td>已支付</td>
                                        <c:if test="${pageInfo.payType == 1}">
                                            <td>支付宝支付</td>
                                        </c:if>
                                        <c:if test="${pageInfo.payType == 2}">
                                            <td>微信支付</td>
                                        </c:if>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="row">
                            <div class="col-lg-6 form-inline">
                                <div class="form-group lead-left">
                                    总共${pageInfo.pages}页，共${pageInfo.total}条数据。每页
                                    <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                        <option style="display: none">${pageInfo.pageSize}</option>
                                        <option>10</option>
                                        <option>15</option>
                                        <option>20</option>
                                        <option>25</option>
                                        <option>30</option>
                                    </select>
                                    条
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <nav aria-label="Page navigation" class="lead-right">
                                    <ul class="pagination">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/bookhotel/findAllBookHotel?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">尾页</span>
                                            </a>
                                        </li>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
            </c:if>

        </div>

    </div>


</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/hotelbook_list.js"></script>
