<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>

<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>网站首页管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <%--添加轮播图--%>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加轮播图
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=1&size=5" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/carousel/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>中文名</label>
                            <input type="text" class="form-control" name="chinese" placeholder="chinese" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${carousels != null}">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">查询结果</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-bordered">
                        <tr class="info">
                            <th class="col-lg-1">id</th>
                            <th class="col-lg-1">中文名</th>
                            <th class="col-lg-1">英文名</th>
                            <th class="col-lg-3">简介</th>
                            <th class="col-lg-2">创建时间</th>
                            <th class="col-lg-2">图片</th>
                            <th class="col-lg-2">更多操作</th>
                        </tr>
                        <c:forEach items="${carousels}" var="carousel">
                            <tr>
                                <td>${carousel.id}</td>
                                <td>${carousel.chinese}</td>
                                <td>${carousel.english}</td>
                                <td>${carousel.carDesc}</td>
                                <td><fmt:formatDate value="${carousel.createTime}" pattern="d/MM.yyyy"></fmt:formatDate></td>
                                <td><img src="${carousel.url}" width="150" height="100"></td>
                                <td>
                                    <button carouselId="${carousel.id}" carouselChinese="${carousel.chinese}" carouselEnglish="${carousel.english}" carouselDesc="${carousel.carDesc}" carouselUrl="${carousel.url}" type="button" class="btn btn-primary updateCarousel" data-toggle="modal" data-target="#myModal">编辑</button>
                                    <button carouselId="${carousel.id}" carouselName="${carousel.chinese}" type="button" class="btn btn-danger deleteCarousel" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <c:if test="${carousels.size() == 0}">
                        <p style="text-align: center;">未查询到相关信息</p>
                    </c:if>
                </div>
            </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有页面轮播图</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-hover table-bordered">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">中文名</th>
                                <th class="col-lg-1">英文名</th>
                                <th class="col-lg-3">简介</th>
                                <th class="col-lg-2">创建时间</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.chinese}</td>
                                    <td>${pageInfo.english}</td>
                                    <td>${pageInfo.carDesc}</td>
                                    <td><fmt:formatDate value="${pageInfo.createTime}" pattern="d/MM.yyyy"></fmt:formatDate></td>
                                    <td><img src="${pageInfo.url}" width="150" height="100"></td>
                                    <td><button carouselId="${pageInfo.id}" carouselChinese="${pageInfo.chinese}" carouselEnglish="${pageInfo.english}" carouselDesc="${pageInfo.carDesc}" carouselUrl="${pageInfo.url}" type="button" class="btn btn-primary updateCarousel" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button carouselId="${pageInfo.id}" carouselName="${pageInfo.chinese}" type="button" class="btn btn-danger deleteCarousel" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>

                        <div class="row">
                            <div class="col-lg-6 form-inline">
                                <div class="form-group lead-left">
                                    总共${pageInfo.pages}页，共条${pageInfo.total}数据。每页
                                    <select class="form-control" id="changePageSize" onchange="changePageSize()">
                                        <option style="display: none;">${pageInfo.pageSize}</option>
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
                                            <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <li>
                                            <c:if test="${pageInfo.pageNum > 1}">
                                                <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </c:if>
                                        </li>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <li>
                                            <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                                <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </c:if>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/carousel/findAllCarousel?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
                    <h4 class="modal-title" id="myModalLabel1">添加新轮播图</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">中文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newChinese" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">英文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newEnglish" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">简介:</label>
                            <div class="col-lg-7">
                                <textarea id="newCarDesc" class="form-control" rows="5"></textarea>
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
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addCarousel">确定添加</button>
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
                    <h4 class="modal-title" id="myModalLabel">修改轮播图片信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">轮播图id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cId" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">中文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cChinese" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">英文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="cEnglish" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">简介:</label>
                            <div class="col-lg-7">
                                <textarea id="cDesc" rows="5" class="form-control"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">图片:</label>
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
                    <button type="button" class="btn btn-primary" id="updateCarousel">保存修改</button>
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
                        是否确定删除轮播图<span id="carouselId"></span><span id="carouselName"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteCarousel">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>

<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/carousel_list.js"></script>
