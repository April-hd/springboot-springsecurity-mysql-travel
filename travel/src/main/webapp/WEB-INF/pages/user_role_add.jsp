<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/managehead.jsp"%>
<div class="right">

    <div class="panel panel-primary">

        <div class="panel-heading">
            <h3 class="panel-title">
                <strong>您现在所在的位置>>用户管理界面>></strong>
                <span>为${userInfo.username}添加新角色</span>
            </h3>
        </div>

        <div class="panel-body">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">${userInfo.username}用户已有角色</h3>
                </div>
                <div class="panel-body">
                    <table class="table table-hover table-bordered">
                        <tr class="info">
                            <th>id</th>
                            <th>角色名称</th>
                            <th>角色描述</th>
                        </tr>
                        <c:forEach items="${userInfo.roles}" var="role">
                            <tr>
                                <td>${role.id}</td>
                                <td>${role.roleName}</td>
                                <td>${role.roleDesc}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <hr>

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">为${userInfo.username}添加新角色</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/manage/user/addRoleToUser" method="post">
                        <!-- 用户id，提交时会自动作为参数返回给控制器，还有下面的ids参数 name=value -->
                        <!-- 比如：/user/addRoleToUser?userId=1&ids=3&ids=4 -->
                        <input type="hidden" name="userId" value="${userInfo.id}">

                        <table class="table table-hover table-bordered">
                            <tr class="info">
                                <th>可多选</th>
                                <th>id</th>
                                <th>角色名称</th>
                                <th>角色描述</th>
                            </tr>
                            <c:forEach items="${roles}" var="role">
                                <tr>
                                    <td><input name="ids" type="checkbox" value="${role.id}"></td>
                                    <td>${role.id}</td>
                                    <td>${role.roleName}</td>
                                    <td>${role.roleDesc}</td>
                                </tr>
                            </c:forEach>
                        </table>

                        <c:if test="${roles == null}">
                            <p style="text-align: center">暂无更多</p>
                        </c:if>

                        <c:if test="${roles != null}">
                            <div class="form-group">
                                <div class="col-lg-1 col-lg-offset-5">
                                    <button type="submit" class="btn btn-info">提交</button>
                                </div>
                            </div>
                        </c:if>

                    </form>
                </div>
            </div>

        </div>
    </div>

</div>
<%@ include file="public/managefoot.jsp"%>