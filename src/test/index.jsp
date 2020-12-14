<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <title>登录</title>
    <link rel="stylesheet" href="./index.css">
</head>
<body>
<canvas class="cavs" width="1536" height="668"></canvas>
<img src="bg.jpg" height="100%", width="100%">
<form action = "loginCtr/index" method = "post" style = "display:inline">
<div class="loginmain">
    <div class="login-title">
        <span>出租车管理系统</span>
    </div>

    <div class="login-con">
        <div class="login-user">
            <div class="icon">
                <img src="./cd-icon-username.png" alt="">
            </div>
            <input type="text" name="username" placeholder="用户名" autocomplete="off" value="">
        </div>
        <div class="login-pwd">
            <div class="icon">
                <img src="./cd-icon-password.png" alt="">
            </div>
            <input type="password" name="password" placeholder="密码" autocomplete="off" value="">
        </div>
        <div class="login-btn">
            <input type="submit" value="登录">
        </div>
    </div>

</div>
</form>

<form action = "to_signin" method = "post" style = "display:inline">
	<input type = "submit" value = "注册">
</form>

<script src="./jquery-1.7.2.js"></script>
<script src="./ban.js"></script>
</body></html>