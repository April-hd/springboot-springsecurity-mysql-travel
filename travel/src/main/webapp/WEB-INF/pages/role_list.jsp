<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>></strong>
                <span>角色管理界面</span>
            </h3>
        </div>

        <div class="panel-body">

            <table class="table table-bordered table-hover">
                <tr class="info">
                    <th class="col-lg-1">id</th>
                    <th class="col-lg-5">角色名称</th>
                    <th class="col-lg-5">角色描述</th>
                    <th class="col-lg-1">更多操作</th>
                </tr>
                <c:forEach items="${roles}" var="role">
                    <tr>
                        <td>${role.id}</td>
                        <td>${role.roleName}</td>
                        <td>${role.roleDesc}</td>
                        <td><button roleId="${role.id}" roleName="${role.roleName}" roleDesc="${role.roleDesc}" type="button" class="btn btn-primary updateRole" data-toggle="modal" data-target="#myModal">
                            编辑
                            </button></td>
                    </tr>
                </c:forEach>
            </table>

        </div>
    </div>

    <%--编辑模态框--%>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">修改角色信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">角色id:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rid" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">角色名:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="rname" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">角色描述:</label>
                            <div class="col-lg-7">
                                <textarea id="rdesc" rows="3" class="form-control"></textarea>
                                <font></font>
                            </div>
                            <div class="col-lg-2"><span style="color: red;vertical-align: middle;">*</span>必填</div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateRole">保存修改</button>
                </div>
            </div>
        </div>
    </div>


</div>
<%@ include file="public/managefoot.jsp"%>
<script src="/js/common.js"></script>
<script src="/js/role_list.js"></script>