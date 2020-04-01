<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>>用户管理界面>></strong>
                <span>${userInfo.username}用户详情</span>
            </h3>
        </div>

        <div class="panel-body">


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">用户信息</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th class="col-lg-1">用户名</th>
                            <th class="col-lg-2">头像</th>
                            <th class="col-lg-1">性别</th>
                            <th class="col-lg-1">电话号码</th>
                            <th class="col-lg-1">邮箱</th>
                            <th class="col-lg-3">简介</th>
                            <th class="col-lg-2">个人网站</th>
                            <th class="col-lg-1">可用状态</th>
                        </tr>
                        <tr>
                            <td>${userInfo.username}</td>
                            <td><img src="${userInfo.url}" width="100" height="100"></td>
                            <c:if test="${userInfo.gender == 0}">
                                <td>保密</td>
                            </c:if>
                            <c:if test="${userInfo.gender == 1}">
                                <td>男</td>
                            </c:if>
                            <c:if test="${userInfo.gender == 2}">
                                <td>女</td>
                            </c:if>
                            <td>${userInfo.phoneNum}</td>
                            <td>${userInfo.email}</td>
                            <td>${userInfo.intro}</td>
                            <td>${userInfo.website}</td>
                            <td>${userInfo.statusStr}</td>
                        </tr>
                    </table>
                </div>
            </div>

            <hr>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">用户所有角色</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th class="col-lg-4">角色id</th>
                            <th class="col-lg-4">角色名</th>
                            <th class="col-lg-4">角色描述</th>
                        </tr>
                        <c:forEach items="${userInfo.roles}" var="role">
                            <tr>
                                <td>${role.id}</td>
                                <td>${role.roleName}</td>
                                <td>${role.roleDesc}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <hr>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">用户下过的订单</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>id</th>
                            <th>订单编号</th>
                            <th>路线名</th>
                            <th>下单时间</th>
                            <th>出发时间</th>
                            <th>成年人数</th>
                            <th>儿童人数</th>
                            <th>总价</th>
                            <th>下单账号</th>
                            <th>订单状态</th>
                            <th>支付方式</th>
                        </tr>
                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.orderNum}</td>
                                <td>${order.route.name}</td>
                                <td>${order.orderTime}</td>
                                <td>${order.reserveTime}</td>
                                <td>${order.adult}</td>
                                <td>${order.child}</td>
                                <td>${order.totalPrice}</td>
                                <td>${userInfo.username}</td>
                                <c:if test="${order.orderStatus == 0}">
                                    <td>未支付</td>
                                    <td>待定</td>
                                </c:if>
                                <c:if test="${order.orderStatus == 1}">
                                    <td>已支付</td>
                                    <c:if test="${order.payType == 0}">
                                        <td>余额支付</td>
                                    </c:if>
                                    <c:if test="${order.payType == 1}">
                                        <td>支付宝支付</td>
                                    </c:if>
                                    <c:if test="${order.payType == 2}">
                                        <td>微信支付</td>
                                    </c:if>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${orders.size() == 0}">
                        <p style="text-align: center">该用户暂无订单</p>
                    </c:if>
                </div>
            </div>

        </div>

    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/user_detail.js"></script>