<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>

<div class="freewalk-addOrder">
    <div class="container">

        <div class="panel panel-default">
            <div class="panel-body">
                <div class="progress" style="height: 40px;">
                    <div class="progress-bar progress-bar-success progress-bar-striped" style="width: 33.3%">
                        <span style="vertical-align: middle;line-height: 40px;font-size: 16px;">第一步：确认产品和个人信息</span>
                    </div>
                    <div class="progress-bar progress-bar-warning progress-bar-striped" id="p2">
                        <span style="vertical-align: middle;line-height: 40px;font-size: 16px;">第二步：生成订单并支付</span>
                    </div>
                    <div class="progress-bar progress-bar-danger progress-bar-striped" id="p3">
                        <span style="vertical-align: middle;line-height: 40px;font-size: 16px;">第三步：支付结果</span>
                    </div>
                </div>

                <%--第一步--%>
                <div class="step1" id="step1">
                    <!-- 路线下单 -->
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <h2 class="page-header" style="text-align: center;">请确认信息</h2>
                            <div class="alert alert-danger">
                                <a href="#" class="close" data-dismiss="alert">&times;</a>
                                <strong>警告！</strong><span>在下单之前，请先确认您的个人登录信息，产品信息以及环境安全</span>
                            </div>
                            <div class="form-inline">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="form-group">
                                            <label>出发</label>
                                            <div class="input-group date"  id="reserve">
                                                <input type="text" class="form-control" name="reserveTime" id="reserveTime" placeholder="reserveTime"  />
                                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>成人</label>
                                            <select class="form-control" id="adult" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="请注意：" data-content="成年人人数不能为0！">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>儿童</label>
                                            <select class="form-control" id="child">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                            </select>
                                            <ins class="child-tip" data-toggle="tooltip" data-placement="bottom" title="2--12周岁（不含）不占床，含所选机票旅游车位，其余当地产生一切费用（如餐费、门票、小交通、体验费、住宿费等均自理，儿童/婴儿入住遵循酒店规则）">2-12周岁(不含12周岁)（半价）</ins>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="form-group">
                                            <label>总价：<span id="totalPrice">00</span>元</label>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-default" id="order">立即预定</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--登录者信息--%>
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-inline">
                                <div class="form-group">
                                    <label>下单账号：</label>
                                    <input type="text" class="form-control" value="${userInfo.username}" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>电话号码：</label>
                                    <input type="text" class="form-control" value="${userInfo.phoneNum}" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>电子邮箱：</label>
                                    <input type="text" class="form-control" value="${userInfo.email}" readonly="readonly">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <input type="hidden" id="routeId" value="${route.id}">
                                <div class="col-lg-3"><img src="../../images/路线.jpg"><a href="" >${route.name}</a></div>
                                <div class="col-lg-2"><img src="../../images/日历.jpg"><span>游玩时间：${route.time}天</span></div>
                                <div class="col-lg-3"><img src="../../images/太阳.jpg"><span>最佳季节：${route.season}月</span></div>
                                <div class="col-lg-2"><img src="../../images/价格.jpg"><span>价格：<span id="price">${route.price}</span>元</span></div>
                                <c:if test="${route.status == 1}">
                                    <div class="col-lg-2"><a target="_blank" href="${pageContext.request.contextPath}${route.href}?routeId=${route.id}" class="btn btn-warning">查看路线详情</a></div>
                                </c:if>
                                <c:if test="${route.status == 0}">
                                    <div class="col-lg-2"><button class="btn btn-warning" disabled="disabled">查看路线详情</button></div>
                                </c:if>
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

                    <button class="btn btn-warning" style="float: right;" id="addFreeWalkOrder">确定</button>
                </div>

                <%--第二步--%>
                <div class="step2" id="step2">
                </div>

                <%--第三步--%>
                <div class="step3" id="step3">
                    <h4><img src="../../images/支付失败.png" />支付失败</h4>
                    <p>本网站仅供浏览，不支持支付功能。</p>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
<script src="/js/freewalk_addOrder.js"></script>