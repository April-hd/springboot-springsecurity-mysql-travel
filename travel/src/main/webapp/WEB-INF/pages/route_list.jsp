<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>旅游路线管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <%--添加路线--%>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加路线
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=1&size=10" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/route/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>路线编号</label>
                            <input type="text" class="form-control" name="routeNum" placeholder="RouteNum" />
                        </div>
                        <div class="form-group">
                            <label>路线名</label>
                            <input type="text" class="form-control" name="routeName" placeholder="RouteName" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${routes != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-2">路线编号</th>
                                <th class="col-lg-2">路线名称</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">游玩天数</th>
                                <th class="col-lg-1">游玩季节</th>
                                <th class="col-lg-1">热门指数</th>
                                <th class="col-lg-1">路线状态</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${routes}" var="route">
                                <tr>
                                    <td>${route.id}</td>
                                    <td>${route.num}</td>
                                    <td>${route.name}</td>
                                    <td>${route.price}</td>
                                    <td>${route.time}</td>
                                    <td>${route.season}</td>
                                    <td>${route.heat}</td>
                                    <c:if test="${route.status == 1}">
                                        <td>已开启</td>
                                    </c:if>
                                    <c:if test="${route.status == 0}">
                                        <td>未开启</td>
                                    </c:if>
                                    <td><button routeId="${route.id}" routeNum="${route.num}" routeName="${route.name}" routePrice="${route.price}" routeTime="${route.time}" routeSeason="${route.season}" routeDesc="${route.routeDesc}" routeHeat="${route.heat}" routeStatus="${route.status}" type="button" class="btn btn-primary updateRoute" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button routeId="${route.id}" routeNum="${route.num}" type="button" class="btn btn-danger deleteRoute" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${routes.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有路线</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">路线编号</th>
                                <th class="col-lg-2">路线名称</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">游玩天数</th>
                                <th class="col-lg-1">游玩季节</th>
                                <th class="col-lg-1">热门指数</th>
                                <th class="col-lg-1">路线状态</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.num}</td>
                                    <td>${pageInfo.name}</td>
                                    <td>${pageInfo.price}</td>
                                    <td>${pageInfo.time}</td>
                                    <td>${pageInfo.season}</td>
                                    <td>${pageInfo.heat}</td>
                                    <c:if test="${pageInfo.status == 1}">
                                        <td>已开启</td>
                                    </c:if>
                                    <c:if test="${pageInfo.status == 0}">
                                        <td>未开启</td>
                                    </c:if>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manage/route/detail?routeId=${pageInfo.id}" class="btn btn-info">查看详情</a>
                                        <button routeId="${pageInfo.id}" routeNum="${pageInfo.num}" routeName="${pageInfo.name}" routePrice="${pageInfo.price}" routeTime="${pageInfo.time}" routeSeason="${pageInfo.season}" routeDesc="${pageInfo.routeDesc}" routeHeat="${pageInfo.heat}" routeStatus="${pageInfo.status}" type="button" class="btn btn-primary updateRoute" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button routeId="${pageInfo.id}" routeNum="${pageInfo.num}" type="button" class="btn btn-danger deleteRoute" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
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
                                        <option>11</option>
                                        <option>12</option>
                                        <option>13</option>
                                        <option>14</option>
                                    </select>
                                    条
                                </div>
                            </div>
                            <div class="col-lg-6">

                                <nav aria-label="Page navigation" class="lead-right">
                                    <ul class="pagination">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/route/findAllRoute?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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

    <%--添加模态框--%>
    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">添加新路线</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线编号:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRouteNum" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRouteName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRoutePrice" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线天数:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRouteTime" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线季节:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRouteSeason" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线描述:</label>
                            <div class="col-lg-7">
                                <textarea class="form-control" rows="5" id="newRouteDesc"></textarea>
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线状态:</label>
                            <div class="col-lg-7">
                                <%--<input type="text" class="form-control" id="newRouteStatus" />--%>
                                <%--<font></font>--%>
                                <select class="form-control" id="newRouteStatus">
                                    <option style="display: none;"></option>
                                    <option value="0">关闭</option>
                                    <option value="1">开启</option>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">路线链接:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newRouteHref" />
                                <font></font>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addRoute">确定添加</button>
                </div>
            </div>
        </div>
    </div>

    <%--编辑模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改路线信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-3 control-label">路线id:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rId" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">路线编号:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rNum">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">路线名:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rName">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">价格:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rPrice">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">天数:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rTime">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">季节:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rSeason">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">路线描述:</div>
                            <div class="col-lg-7">
                                <textarea class="form-control" id="rDesc" rows="5"></textarea>
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">热度指数:</div>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rHeat">
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>不能为空</div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-3 control-label">开启状态:</div>
                            <div class="col-lg-7">
                                <select class="form-control" id="rStatus">
                                    <option value="0">关闭</option>
                                    <option value="1">开启</option>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateRoute">保存修改</button>
                </div>
            </div>
        </div>
    </div>

    <%--删除模态框--%>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySmallModalLabel">
                        是否确定删除路线<span id="routeId"></span>编号<span id="routeNum"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteRoute">确定</button>
                </div>
            </div>
        </div>
    </div>


</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/route_list.js"></script>
