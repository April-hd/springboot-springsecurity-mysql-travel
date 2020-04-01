<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>留言管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=1&size=10" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-11">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/leaveword/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>留言人</label>
                            <input type="text" class="form-control" name="leaveWordName" placeholder="leaveWordName" />
                        </div>
                        <div class="form-group">
                            <label>留言文本</label>
                            <input type="text" class="form-control" name="leaveWordTxt" placeholder="leaveWordName" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${leaveWords != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-2">路线名</th>
                                <th class="col-lg-1">留言人</th>
                                <th class="col-lg-5">留言文本</th>
                                <th class="col-lg-2">留言时间</th>
                                <th class="col-lg-1">更多操作</th>
                            </tr>
                            <c:forEach items="${leaveWords}" var="leaveWord">
                                <tr>
                                    <td>${leaveWord.id}</td>
                                    <td>${leaveWord.route.name}</td>
                                    <td>${leaveWord.userInfo.username}</td>
                                    <td>${leaveWord.txt}</td>
                                    <td>${leaveWord.createTime}</td>
                                    <td><button leaveId="${leaveWord.id}" type="button" class="btn btn-danger deleteLeaveWord" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${leaveWords.size() == 0}">
                            <p style="text-align: center;">该用户不存在，请准确填写用户名</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <hr>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有留言</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-2">路线名</th>
                                <th class="col-lg-1">留言人</th>
                                <th class="col-lg-5">留言文本</th>
                                <th class="col-lg-2">留言时间</th>
                                <th class="col-lg-1">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.route.name}</td>
                                    <td>${pageInfo.userInfo.username}</td>
                                    <td>${pageInfo.txt}</td>
                                    <td>${pageInfo.createTime}</td>
                                    <td><button leaveId="${pageInfo.id}" type="button" class="btn btn-danger deleteLeaveWord" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button></td>
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
                                            <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/leaveWord/findAllLeaveWord?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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

    <%--删除模态框--%>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="mySmallModalLabel">
                        是否确定删除留言<span id="leaveId"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteLeaveWord">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/leaveword_list.js"></script>