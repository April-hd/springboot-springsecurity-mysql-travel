<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>系统用户日志管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有日志</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-3">请求路径</th>
                                <th class="col-lg-2">请求IP</th>
                                <th class="col-lg-1">请用用户</th>
                                <th class="col-lg-1">请求方法</th>
                                <th class="col-lg-1">请求参数</th>
                                <th class="col-lg-3">创建时间</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.requestServletPath}</td>
                                    <td>${pageInfo.requestRemoteAddr}</td>
                                    <td>${pageInfo.requestUsername}</td>
                                    <td>${pageInfo.requestMethod}</td>
                                    <td>${pageInfo.requestQueryString}</td>
                                    <td>${pageInfo.createTime}</td>
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
                                            <a href="${pageContext.request.contextPath}/manage/syslog/findAll?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/syslog/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/syslog/findAll?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/syslog/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/syslog/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
<script src="/js/syslog_list.js"></script>
