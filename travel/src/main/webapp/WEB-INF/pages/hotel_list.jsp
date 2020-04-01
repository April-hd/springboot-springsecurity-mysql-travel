<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>酒店管理</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="row">
                <div class="col-lg-1">
                    <%--添加酒店--%>
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal1">
                        添加酒店
                    </button>
                </div>
                <div class="col-lg-1">
                    <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=1&size=5" class="btn btn-warning">查看所有</a>
                </div>
                <div class="col-lg-10">
                    <%--模糊查询--%>
                    <form action="${pageContext.request.contextPath}/manage/hotel/fuzzyQuery" method="get" class="form-inline">
                        <div class="form-group">
                            <label>酒店名</label>
                            <input type="text" class="form-control" name="hName" placeholder="hname" />
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span>查询</button>
                        </div>
                    </form>
                </div>
            </div>

            <%--模糊查询结果--%>
            <c:if test="${hotels != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">查询结果</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">酒店名</th>
                                <th class="col-lg-1">英文名</th>
                                <th class="col-lg-2">描述</th>
                                <th class="col-lg-1">地址</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${hotels}" var="hotel">
                                <tr>
                                    <td>${hotel.id}</td>
                                    <td>${hotel.name}</td>
                                    <td>${hotel.english}</td>
                                    <td>${hotel.hotelDesc}</td>
                                    <td>${hotel.location}</td>
                                    <td>${hotel.price}</td>
                                    <td>${hotel.destination.name}</td>
                                    <td><img src="${hotel.url}" style="width: 150px;height: 100px;"></td>
                                    <td><button hotelId="${hotel.id}" hotelName="${hotel.name}" hotelEnglish="${hotel.english}" hotelDesc="${hotel.hotelDesc}" hotelLocation="${hotel.location}" hotelPrice="${hotel.price}" hotelUrl="${hotel.url}" hotelDestId="${hotel.destId}" type="button" class="btn btn-primary updateHotel" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button hotelId="${hotel.id}" hotelName="${hotel.name}" type="button" class="btn btn-danger deleteHotel" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <c:if test="${hotels.size() == 0}">
                            <p style="text-align: center;">未查询到相关数据</p>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <c:if test="${pageInfo != null}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">所有酒店</h3>
                    </div>
                    <div class="panel-body">
                        <table class="table table-bordered table-hover">
                            <tr class="info">
                                <th class="col-lg-1">id</th>
                                <th class="col-lg-1">酒店名</th>
                                <th class="col-lg-1">英文名</th>
                                <th class="col-lg-2">描述</th>
                                <th class="col-lg-1">地址</th>
                                <th class="col-lg-1">价格</th>
                                <th class="col-lg-1">所属目的地</th>
                                <th class="col-lg-2">图片</th>
                                <th class="col-lg-2">更多操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.list}" var="pageInfo">
                                <tr>
                                    <td>${pageInfo.id}</td>
                                    <td>${pageInfo.name}</td>
                                    <td>${pageInfo.english}</td>
                                    <td>${pageInfo.hotelDesc}</td>
                                    <td>${pageInfo.location}</td>
                                    <td>${pageInfo.price}</td>
                                    <td>${pageInfo.destination.name}</td>
                                    <td><img src="${pageInfo.url}" style="width: 150px;height: 100px;"></td>
                                    <td><button hotelId="${pageInfo.id}" hotelName="${pageInfo.name}" hotelEnglish="${pageInfo.english}" hotelDesc="${pageInfo.hotelDesc}" hotelLocation="${pageInfo.location}" hotelPrice="${pageInfo.price}" hotelUrl="${pageInfo.url}" hotelDestId="${pageInfo.destId}" type="button" class="btn btn-primary updateHotel" data-toggle="modal" data-target="#myModal">编辑</button>
                                        <button hotelId="${pageInfo.id}" hotelName="${pageInfo.name}" type="button" class="btn btn-danger deleteHotel" data-toggle="modal" data-target=".bs-example-modal-sm">删除</button>
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
                                            <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=1&size=${pageInfo.pageSize}">
                                                <span aria-hidden="true">首页</span>
                                            </a>
                                        </li>
                                        <c:if test="${pageInfo.pageNum > 1}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNumber">
                                            <li><a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=${pageNumber}&size=${pageInfo.pageSize}">${pageNumber}</a></li>
                                        </c:forEach>
                                        <c:if test="${pageInfo.pageNum < pageInfo.pages}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/manage/hotel/findAllHotel?page=${pageInfo.pages}&size=${pageInfo.pageSize}">
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
                    <h4 class="modal-title" id="myModalLabel1">添加新酒店</h4>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newHotelName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">英文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newHotelEnglish" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店描述:</label>
                            <div class="col-lg-7">
                                <textarea id="newHotelDesc" class="form-control" rows="5"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店地址:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newHotelLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="newHotelPrice" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店图片:</label>
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
                                <select class="form-control" id="newHotelDestId">
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
                    <button type="button" class="btn btn-primary" id="addHotel">确定添加</button>
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
                    <h4 class="modal-title" id="myModalLabel">修改酒店信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="hId" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="hName" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">英文名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="hEnglish" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店描述:</label>
                            <div class="col-lg-7">
                                <textarea id="hDesc" rows="5" class="form-control"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店地址:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="hLocation" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="hPrice" />
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">所属目的地:</label>
                            <div class="col-lg-7">
                                <select class="form-control" id="hDestId">
                                    <c:forEach items="${destinations}" var="destination">
                                        <option value="${destination.id}">${destination.name}</option>
                                    </c:forEach>
                                </select>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">酒店图片:</label>
                            <div class="col-lg-4">
                                <p>原图片：</p>
                                <img id="hUrl" style="width: 150px;height: 100px;" >
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
                    <button type="button" class="btn btn-primary" id="updateHotel">保存修改</button>
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
                        是否确定删除酒店<span id="hotelId"></span><span id="hotelName"></span>？
                    </h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="deleteHotel">确定</button>
                </div>
            </div>
        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/hotel_list.js"></script>