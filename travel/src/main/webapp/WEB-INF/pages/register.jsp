<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/register.css">
    <script src="/js/register.js"></script>
</head>
<body>
<div class="result" id="result"></div>
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
    <div class="input-group">
        <input type="password" id="confirmPassword" placeholder="ConfirmPassword" />
    </div>
    <div class="input-group">
        <input type="text" id="phoneNum" placeholder="PhoneNum" />
    </div>
    <div class="input-group">
        <input type="email" id="email" placeholder="Email" />
    </div>
    <div class="input-group">
        <input type="button" id="submit" value="注册">
    </div>
</div>
</body>
</html>
