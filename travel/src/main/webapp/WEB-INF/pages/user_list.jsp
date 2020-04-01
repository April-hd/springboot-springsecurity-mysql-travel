<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>用户管理界面</span>
            </h3>
        </div>
        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/user/findAllUser?page=1&size=10" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-11">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/user/fuzzyQuery?page=1&size=10" method="get" class="form-inline">
                        <div class="form-group">
                            <label>用户名</label>
                            <input type="text" class="form-control" name="userName" placeholder="Username" />
                        </div>
                        <div class="form-group">
                            <label>电话号码</label>
                            <input type="text" class="form-control" name="phoneNum" placeholder="PhoneNum" />
                        </div>
                        <div class="form-group">
                            <label>电子邮箱</label>
                            <input type="text" class="form-control" name="email" placeholder="Email" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${userInfos != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-2">用户名</th>
                                <th class="col-lg-2">电话号码</th>
                                <th class="col-lg-2">邮箱</th>
                                <th class="col-lg-2">可用状态</th>
                                <th class="col-lg-3">更多操作</th>
                            </tr>
                            <c:forEach items="${userInfos}" var="userInfo">
                                <tr>
                                    <td>${userInfo.id}</td>
                                    <td>${userInfo.username}</td>
                                    <td>${userInfo.phoneNum}</td>
                                    <td>${userInfo.email}</td>
                                    <td>${userInfo.statusStr}</td>
                                    <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/manage/user/findDetailsById?id=${userInfo.id}">详情</a>
                                        <a class="btn btn-success" href="${pageContext.request.contextPath}/manage/user/findUserByIdAndAllRole?id=${userInfo.id}">添加角色</a>
                                        <c:if test="${userInfo.statusStr == '可使用'}">
                                            <%--<a class="btn btn-danger" href="${pageContext.request.contextPath}/manage/user/forbidById?id=${userInfo.id}">禁用</a>--%>
                                            <button userId="${userInfo.id}" username="${userInfo.username}" type="button" class="btn btn-danger forbiden-user" data-toggle="modal" data-target=".bs-example-modal-sm">禁用</button>
                                        </c:if>
                                        <c:if test="${userInfo.statusStr == '已禁用'}">
                                            <%--<a class="btn btn-warning" href="${pageContext.request.contextPath}/manage/user/openById?id=${userInfo.id}">启用</a>--%>
                                            <button userId="${userInfo.id}" username="${userInfo.username}" type="button" class="btn btn-warning open-user" data-toggle="modal" data-target=".bs-example-modal-sm1">启用</button>
                                        </c:if>
                                        <button userId="${userInfo.id}" username="${userInfo.username}" phoneNum="${userInfo.phoneNum}" email="${userInfo.email}" class="btn btn-info updateUserInfo" data-toggle="modal" data-target="#myModal">
                                            编辑
                                        </button></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${userInfos.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>


            <%--所有查询结果--%>
            <c:if test="${pageInfo != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有用户</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-2">用户名</th>
                                <th class="col-lg-2">电话号码</th>
                                <th class="col-lg-2">邮箱</th>
                                <th class="col-lg-2">可用状态</th>
                                <th class="col-lg-3">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.username}</td>
                                    <td>${pageInfo.phoneNum}</td>
                                    <td>${pageInfo.email}</td>
                                    <td>${pageInfo.statusStr}</td>
                                    <td><a class="btn btn-primary" href="${pageContext.request.contextPath}/manage/user/findDetailsById?id=${pageInfo.id}">详情</a>
                                        <a class="btn btn-success" href="${pageContext.request.contextPath}/manage/user/findUserByIdAndAllRole?id=${pageInfo.id}">添加角色</a>
                                        <c:if test="${pageInfo.statusStr == '可使用'}">
                                            <%--<a class="btn btn-danger" href="${pageContext.request.contextPath}/manage/user/forbidById?id=${pageInfo.id}">禁用</a>--%>
                                            <button userId="${pageInfo.id}" username="${pageInfo.username}" type="button" class="btn btn-danger forbiden-user" data-toggle="modal" data-target=".bs-example-modal-sm">禁用</button>
                                        </c:if>
                                        <c:if test="${pageInfo.statusStr == '已禁用'}">
                                            <%--<a class="btn btn-warning" href="${pageContext.request.contextPath}/manage/user/openById?id=${pageInfo.id}">启用</a>--%>
                                            <button userId="${pageInfo.id}" username="${pageInfo.username}" type="button" class="btn btn-warning open-user" data-toggle="modal" data-target=".bs-example-modal-sm1">启用</button>
                                        </c:if>
                                        <button userId="${pageInfo.id}" username="${pageInfo.username}" phoneNum="${pageInfo.phoneNum}" email="${pageInfo.email}" class="btn btn-info updateUserInfo" data-toggle="modal" data-target="#myModal">
                                            编辑
                                        </button></td>
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
                                            <a id="start" href="${pageContext.request.contextPath}/manage/user/findAllUser?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a id="pre" href="${pageContext.request.contextPath}/manage/user/findAllUser?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a id="number" href="${pageContext.request.contextPath}/manage/user/findAllUser?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a id="next" href="${pageContext.request.contextPath}/manage/user/findAllUser?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a id="last" href="${pageContext.request.contextPath}/manage/user/findAllUser?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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

    <!-- 禁用模态框 -->
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySmallModalLabel">
                        <input type="hidden" id="forbiden-id" readonly="readonly">
                        是否确定禁用用户<span id="forbiden-user"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="forbiden-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 启用模态框 -->
    <div class="modal fade bs-example-modal-sm1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel1">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySmallModalLabel1">
                        <input type="hidden" id="open-id" readonly="readonly">
                        是否确定启用用户<span id="open-user"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="open-confirm">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 编辑模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="uid" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="uname" readonly="readonly" />
                                <font ></font>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">电话号码:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="uphone" />
                                <font ></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">电子邮箱:</label>
                            <div class="col-lg-7">
                                <input type="email" class="form-control" id="uemail" />
                                <font ></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateUserInfo">保存修改</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/user_list.js"></script>