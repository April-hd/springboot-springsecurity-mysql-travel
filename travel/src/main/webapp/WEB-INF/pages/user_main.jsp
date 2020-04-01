<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="public/head.jsp"%>
<div class="container user-main">

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading panel-head">
                我的主页
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="user-aside">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tab vertical-tab" role="tablist">
                            <li role="presentation" class="active"><a href="#basic" aria-controls="basic" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;个人资料</a></li>
                            <li role="presentation"><a href="#messages" aria-controls="toggle" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a></li>
                        </ul>

                    </div>

                    <div class="user-right">
                        <div class="result" id="result"></div>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="basic">
                                <div>
                                    <input type="hidden" id="userId" value="${userInfo.id}">
                                    <table class="table">
                                        <tr>
                                            <td class="col-lg-2 table-head"><img src="${userInfo.url}" style="width: 100px;height: 100px;"></td>
                                            <td class="col-lg-6 table-head">
                                                <button type="button" class="btn btn-success setting-save" data-toggle="modal" data-target="#myModal1">更改头像</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">用户名</td>
                                            <td class="col-lg-6">${userInfo.username}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">电子邮件</td>
                                            <td class="col-lg-6">${userInfo.email}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">手机</td>
                                            <td class="col-lg-6">${userInfo.phoneNum}</td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">性别</td>
                                            <td class="col-lg-6">
                                                <c:if test="${userInfo.gender == 0}">
                                                    <label class="radio-inline"><input type="radio" name="gender" value="1">男性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="2">女性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="0" checked="checked">保密</label>
                                                </c:if>
                                                <c:if test="${userInfo.gender == 1}">
                                                    <label class="radio-inline"><input type="radio" name="gender" value="1" checked="checked">男性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="2">女性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="0">保密</label>
                                                </c:if>
                                                <c:if test="${userInfo.gender == 2}">
                                                    <label class="radio-inline"><input type="radio" name="gender" value="1">男性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="2" checked="checked">女性</label>
                                                    <label class="radio-inline"><input type="radio" name="gender" value="0">保密</label>
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">个人简介</td>
                                            <td class="col-lg-6">
                                                <textarea id="intro" class="mytextarea" placeholder="填写你的个人简历（不超过100个字）">${userInfo.intro}</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-lg-2">个人网站</td>
                                            <td class="col-lg-6">
                                                <input type="text" id="website" class="website" value="${userInfo.website}" placeholder="http://你的网址">
                                                <p>填写后会在个人主页显示</p>
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="button" class="btn btn-success setting-save" id="updateUserInfo" value="保存"/>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="messages">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">原密码：</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" id="oldpwd">
                                            <font></font>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">新密码：</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" id="newpwd">
                                            <font></font>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">确认新密码：</label>
                                        <div class="col-lg-9">
                                            <input type="password" class="form-control" id="connewpwd">
                                            <font></font>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-4 col-lg-offset-2">
                                            <input type="submit" class="btn btn-success setting-save" id="updatepwd" value="确认"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--上传头像模态框--%>
                        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">更换头像</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div>
                                            <input type="file" name="file" id="imgFile" >
                                            <br>
                                            <span>原头像：</span>
                                            <img src="${userInfo.url}" class="img-thumbnail" alt="" height="100" width="100">
                                            <font></font>
                                            <span>预览：</span>
                                            <img src="" class="img-thumbnail" id="previewImg" height="100" width="100">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="button" class="btn btn-default" id="updateHeaderImg">提交</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>



</div>
</body>
</html>
<script src="/js/common.js"></script>
<script src="/js/user_main.js"></script>