<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>热门目的地管理界面</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加目的地
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="/manage/destination/findAllDestination?page=1&size=5" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/destination/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>目的地名</label>
                            <input type="text" class="form-control" name="desName" placeholder="Desname" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${destinations != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">目的地</th>
                                <th class="col-lg-3">目的地描述</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">链接路径</th>
                                <th class="col-lg-1">状态</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${destinations}" var="destination">
                                <tr>
                                    <td>${destination.id}</td>
                                    <td>${destination.name}</td>
                                    <td>${destination.destiDesc}</td>
                                    <td><img src="${destination.url}" alt="" style="width: 150px;height: 100px;"></td>
                                    <td>${destination.href}</td>
                                    <c:if test="${destination.status == 0}">
                                        <td>关闭</td>
                                    </c:if>
                                    <c:if test="${destination.status == 1}">
                                        <td>开启</td>
                                    </c:if>
                                    <td><button destinationId="${destination.id}" destinationName="${destination.name}" destinationDesc="${destination.destiDesc}" destinationUrl="${destination.url}" destinationHref="${destination.href}" destinationStatus="${destination.status}" type="button" class="btn btn-primary updateDestination" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button destinationId="${destination.id}" destinationName="${destination.name}" type="button" class="btn btn-danger deleteDestination" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${destinations.size() == 0}">
                            <p style="text-align: center">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有目的地</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">目的地</th>
                                <th class="col-lg-3">目的地描述</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">链接路径</th>
                                <th class="col-lg-1">状态</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.name}</td>
                                    <td>${pageInfo.destiDesc}</td>
                                    <td><img src="${pageInfo.url}" alt="" style="width: 150px;height: 100px;"></td>
                                    <td>${pageInfo.href}</td>
                                    <c:if test="${pageInfo.status == 0}">
                                        <td>关闭</td>
                                    </c:if>
                                    <c:if test="${pageInfo.status == 1}">
                                        <td>开启</td>
                                    </c:if>
                                    <td><button destinationId="${pageInfo.id}" destinationName="${pageInfo.name}" destinationDesc="${pageInfo.destiDesc}" destinationUrl="${pageInfo.url}" destinationHref="${pageInfo.href}" destinationStatus="${pageInfo.status}" type="button" class="btn btn-primary updateDestination" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button destinationId="${pageInfo.id}" destinationName="${pageInfo.name}" type="button" class="btn btn-danger deleteDestination" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
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
                                            <a href="${pageContext.request.contextPath}/manage/destination/findAllDestination?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/destination/findAllDestination?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/destination/findAllDestination?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/destination/findAllDestination?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/destination/findAllDestination?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
                    <h4 class="modal-title" id="myModalLabel1">添加新目的地</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">目的地名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newDesName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">目的地描述:</label>
                            <div class="col-lg-7">
                                <textarea id="newDesDesc" class="form-control" rows="5"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">图片:</label>
                            <div class="col-lg-7">
                                <input type="file" id="newImgFile">
                                <font></font>
                                <p>预览：</p>
                                <img id="newPreviewImg" style="width: 150px;height: 100px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">链接路径:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newDesHref"/>
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">状态:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="newDesStatus">
                                    <option style="display: none;"></option>
                                    <option value="0">关闭</option>
                                    <option value="1">开启</option>
                                </select>
                                <font></font>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addDestination">确定添加</button>
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
                    <h4 class="modal-title" id="myModalLabel">修改目的地信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">目的地id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="desId" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">目的地名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="desName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">目的地描述:</label>
                            <div class="col-lg-7">
                                <textarea id="desDesc" class="form-control" rows="5"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">图片:</label>
                            <div class="col-lg-4">
                                <p>原图片：</p>
                                <img id="desUrl" style="width: 150px;height: 100px;" >
                            </div>
                            <div class="col-lg-3">
                                <p>预览：</p>
                                <img src="" alt="" id="updatePreviewImg" width="150" height="100">
                                <input type="file" id="updateImgUrl">
                                <font></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">链接路径:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="desHref" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">状态:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="desStatus">
                                    <option value="0">关闭</option>
                                    <option value="1">开启</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateDestination">保存修改</button>
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
                        是否确定删除目的地<span id="destinationId"></span><span id="destinationName"></span>？
                    </h4>
                </div>
                <div class="modal-body">
                    <p>在删除该目的地之前，请先确认美食店和风景点没有对该目的地的引用</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteDestination">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/destination_list.js"></script>