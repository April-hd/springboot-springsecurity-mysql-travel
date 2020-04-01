<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp" %>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>风景店管理页面</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加景点
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=1&size=5" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/scenery/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>景点名</label>
                            <input type="text" class="form-control" name="sName" placeholder="sceneryName" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${sceneries != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">风景名</th>
                                <th class="col-lg-2">位置</th>
                                <th class="col-lg-1">等级</th>
                                <th class="col-lg-1">开放时间</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${sceneries}" var="scenery">
                                <tr>
                                    <td>${scenery.id}</td>
                                    <td>${scenery.name}</td>
                                    <td>${scenery.location}</td>
                                    <td>${scenery.level}</td>
                                    <td>${scenery.openTime}</td>
                                    <td>${scenery.price}</td>
                                    <td>${scenery.destination.name}</td>
                                    <td><img style="width: 150px;height: 100px" src="${scenery.url}"></td>
                                    <td><button sceneryId="${scenery.id}" sceneryName="${scenery.name}" sceneryLocation="${scenery.location}" sceneryLevel="${scenery.level}" sceneryOpenTime="${scenery.openTime}" sceneryPrice="${scenery.price}" sceneryUrl="${scenery.url}" sceneryDestId="${scenery.destId}" type="button" class="btn btn-primary updateScenery" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button sceneryId="${scenery.id}" sceneryName="${scenery.name}" type="button" class="btn btn-danger deleteScenery" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${sceneries.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有风景</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">风景名</th>
                                <th class="col-lg-2">位置</th>
                                <th class="col-lg-1">等级</th>
                                <th class="col-lg-1">开放时间</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.name}</td>
                                    <td>${pageInfo.location}</td>
                                    <td>${pageInfo.level}</td>
                                    <td>${pageInfo.openTime}</td>
                                    <td>${pageInfo.price}</td>
                                    <td>${pageInfo.destination.name}</td>
                                    <td><img style="width: 150px;height: 100px" src="${pageInfo.url}"></td>
                                    <td><button sceneryId="${pageInfo.id}" sceneryName="${pageInfo.name}" sceneryLocation="${pageInfo.location}" sceneryLevel="${pageInfo.level}" sceneryOpenTime="${pageInfo.openTime}" sceneryPrice="${pageInfo.price}" sceneryUrl="${pageInfo.url}" sceneryDestId="${pageInfo.destId}" type="button" class="btn btn-primary updateScenery" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button sceneryId="${pageInfo.id}" sceneryName="${pageInfo.name}" type="button" class="btn btn-danger deleteScenery" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
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
                                        <option>5</option>
                                        <option>6</option>
                                        <option>7</option>
                                        <option>8</option>
                                        <option>9</option>
                                    </select>
                                    条
                                </div>
                            </div>

                            <div class="col-lg-6">

                                <nav aria-label="Page navigation" class="lead-right">
                                    <ul class="pagination">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/scenery/findAllScenery?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
                    <h4 class="modal-title" id="myModalLabel1">添加新景点</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newSceName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点地址:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newSceLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点等级:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newSceLevel" />
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点开放时间:</label>
                            <div class="col-lg-7">
                                <div class="input-group date"  id="newOpenTime">
                                    <input type="text" class="form-control timeInput" id="newSceOpenTime"  />
                                    <font></font>
                                    <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newScePrice" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点图片:</label>
                            <div class="col-lg-7">
                                <input type="file" id="newImgFile">
                                <font></font>
                                <p>预览：</p>
                                <img id="newPreviewImg" style="width: 150px;height: 100px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点所属目的地:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="newSceDestId">
                                    <option style="display: none;"></option>
                                    <c:forEach items="${destinations}" var="destination">
                                        <option value="${destination.id}">${destination.name}</option>
                                    </c:forEach>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addScenery">确定添加</button>
                </div>
            </div>
        </div>
    </div>

    <%--修改模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改景点信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="sceId" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="sceName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点位置:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="sceLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点等级:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="sceLevel" />
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">景点开放时间:</label>
                            <div class="col-lg-7">
                                <%--<input type="text" class="form-control" id="sceOpenTime" />--%>
                                <%--<font></font>--%>
                                <div class="input-group date"  id="updateOpenTime">
                                    <input type="text" class="form-control" id="sceOpenTime"  />
                                    <font></font>
                                    <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="scePrice" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">图片:</label>
                            <div class="col-lg-4">
                                <p>原图片：</p>
                                <img id="sceUrl" style="width: 150px;height: 100px;" >
                            </div>
                            <div class="col-lg-3">
                                <p>预览：</p>
                                <img src="" alt="" id="updatePreviewImg" width="150" height="100">
                                <input type="file" id="updateImgUrl">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">所属目的地:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="sceDestId">
                                    <c:forEach items="${destinations}" var="destination">
                                        <option value="${destination.id}">${destination.name}</option>
                                    </c:forEach>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateScenery">保存修改</button>
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
                        是否确定删除风景<span id="sceneryId"></span><span id="sceneryName"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteScenery">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp" %>
<script src="/js/common.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="/js/scenery_list.js"></script>
