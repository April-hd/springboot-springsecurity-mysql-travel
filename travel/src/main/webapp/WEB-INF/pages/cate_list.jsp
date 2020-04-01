<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>美食店管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <%--添加美食店--%>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加美食店
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=1&size=5" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/cate/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>美食店名</label>
                            <input type="text" class="form-control" name="cName" placeholder="cname" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${cates != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">美食店名</th>
                                <th class="col-lg-2">位置</th>
                                <th class="col-lg-3">美食店描述</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">美食店图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${cates}" var="cate">
                                <tr>
                                    <td>${cate.id}</td>
                                    <td>${cate.name}</td>
                                    <td>${cate.location}</td>
                                    <td>${cate.catesDesc}</td>
                                    <td>${cate.destination.name}</td>
                                    <td><img src="${cate.url}" style="width: 150px;height: 100px;"></td>
                                    <td><button cateId="${cate.id}" cateName="${cate.name}" cateLocation="${cate.location}" catesDesc="${cate.catesDesc}" cateDestId="${cate.destId}" cateUrl="${cate.url}" type="button" class="btn btn-primary updateCate" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button cateId="${cate.id}" cateName="${cate.name}" type="button" class="btn btn-danger deleteCate" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${cates.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有美食店</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">美食店名</th>
                                <th class="col-lg-2">位置</th>
                                <th class="col-lg-3">美食店描述</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">美食店图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.name}</td>
                                    <td>${pageInfo.location}</td>
                                    <td>${pageInfo.catesDesc}</td>
                                    <td>${pageInfo.destination.name}</td>
                                    <td><img src="${pageInfo.url}" style="width: 150px;height: 100px;"></td>
                                    <td><button cateId="${pageInfo.id}" cateName="${pageInfo.name}" cateLocation="${pageInfo.location}" catesDesc="${pageInfo.catesDesc}" cateDestId="${pageInfo.destId}" cateUrl="${pageInfo.url}" type="button" class="btn btn-primary updateCate" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button cateId="${pageInfo.id}" cateName="${pageInfo.name}" type="button" class="btn btn-danger deleteCate" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
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
                                            <a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/cates/findAllCate?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
                    <h4 class="modal-title" id="myModalLabel1">添加新美食店</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newCateName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店地址:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newCateLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店描述:</label>
                            <div class="col-lg-7">
                                <textarea id="newCateDesc" class="form-control" rows="5"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店图片:</label>
                            <div class="col-lg-7">
                                <input type="file" id="newImgFile">
                                <font></font>
                                <p>预览：</p>
                                <img id="newPreviewImg" style="width: 150px;height: 100px;">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店所属目的地:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="newCateDestId">
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
                    <button type="button" class="btn btn-primary" id="addCate">确定添加</button>
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
                    <h4 class="modal-title" id="myModalLabel">修改美食店信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cId" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店地址:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店描述:</label>
                            <div class="col-lg-7">
                                <textarea id="cDesc" rows="5" class="form-control"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">所属目的地:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="cDestId">
                                    <c:forEach items="${destinations}" var="destination">
                                        <option value="${destination.id}">${destination.name}</option>
                                    </c:forEach>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">美食店图片:</label>
                            <div class="col-lg-4">
                                <p>原图片：</p>
                                <img id="cUrl" style="width: 150px;height: 100px;" >
                            </div>
                            <div class="col-lg-3">
                                <p>预览：</p>
                                <img src="" alt="" id="updatePreviewImg" width="150" height="100">
                                <input type="file" id="updateImgUrl">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateCate">保存修改</button>
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
                        是否确定删除美食店<span id="cateId"></span><span id="cateName"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteCate">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/cate_list.js"></script>
