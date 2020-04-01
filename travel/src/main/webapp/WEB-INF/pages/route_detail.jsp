<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>

<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>>路线管理>></strong>
                <span>${route.name}详情</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">路线基本信息</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th class="col-lg-1">id</th>
                            <th class="col-lg-2">路线编号</th>
                            <th class="col-lg-3">路线名称</th>
                            <th class="col-lg-1">价格</th>
                            <th class="col-lg-1">游玩天数</th>
                            <th class="col-lg-2">游玩季节</th>
                            <th class="col-lg-1">热门指数</th>
                            <th class="col-lg-1">路线状态</th>
                        </tr>
                        <tr>
                            <td>${route.id}</td>
                            <td>${route.num}</td>
                            <td>${route.name}</td>
                            <td>${route.price}</td>
                            <td>${route.time}</td>
                            <td>${route.season}</td>
                            <td>${route.heat}</td>
                            <td>${route.status}</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">路线描述，注意填写关键词</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>路线描述</th>
                        </tr>
                        <tr>
                            <td>${route.routeDesc}</td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">路线图片，不得多于4张</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-hover">
                        <tr class="info">
                            <th>路线图片</th>
                            <th>添加新图片</th>
                        </tr>
                        <tr>
                            <td>
                                <c:forEach items="${route.routePhotoList}" var="routePhoto">
                                    <img style="height: 163px;width: 244.5px;"  src="${routePhoto.url}" alt="...">
                                </c:forEach>
                            </td>
                            <td>
                                <input type="file" id="newImgFile">
                                <font></font>
                                <p>预览：</p>
                                <img id="newPreviewImg" style="width: 150px;height: 100px;">
                                <input type="hidden" value="${route.id}" id="routeId">
                                <button class="btn btn-success setting-save" id="uploadImg">确定</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </div>

</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/route_detail.js"></script>
