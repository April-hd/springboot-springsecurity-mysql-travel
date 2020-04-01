<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/loginManage.css">
</head>
<body>
<div class="main">
    <div class="top">
        <div class="header">
            <h1 class="logo">
                <a href=""><img src="../../images/旅游.png" alt=""></a>
            </h1>

            <div class="login">
                <form action="/loginManage.do" method="post">
                    <input type="text" name="username" placeholder="Username" required />
                    <input type="password" name="password" placeholder="Password" required />
                    <button type="submit">Login</button>
                </form>
            </div>
        </div>

        <h2>欢迎来到旅游网后台管理系统</h2>
        <h3>只有管理员才能进行登录</h3>

    </div>

    <div class="signup">
        <h4>SIGN UP</h4>
        <div style="color: red;">${message}</div>
        <form action="/loginManage.do" method="post">
            <div class="field">
                <input type="text" name="username" required />
                <span class="label">Full Name</span>
            </div>

            <div class="field">
                <input type="password" name="password" required />
                <span class="label">Your Password</span>
            </div>

            <div class="field">
                <button type="submit">Sign up</button>
            </div>
        </form>
    </div>

    <h5>2019/12/01 version:1.0</h5>

</div>
</body>
</html>
