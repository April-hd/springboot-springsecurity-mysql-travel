<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <script src="/js/login.js"></script>
</head>
<body>
    <div class="error" id="error" ></div>
    <div class="box">
        <div class="box-head">
            <a target="_self" class="login" href="${pageContext.request.contextPath}/login">登录</a>
            <b style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;·&nbsp;&nbsp;&nbsp;&nbsp;</b>
            <a target="_self" class="register" href="${pageContext.request.contextPath}/register">注册</a>
        </div>
        <div class="input-group">
            <input type="text" id="username" placeholder="Username" />
        </div>
        <div class="input-group">
            <input type="password" id="password" placeholder="Password" />
        </div>
        <%--<div class="box-info">--%>
            <%--<div class="remeber-btn">--%>
                <%--<input type="checkbox" value="true" checked="checked"><span>记住我</span>--%>
            <%--</div>--%>
            <%--<div class="forget-btn">--%>
                <%--<a href="">忘记密码？</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="input-group">
            <input type="button" id="submit" value="登录">
        </div>
    </div>
</body>
</html>
