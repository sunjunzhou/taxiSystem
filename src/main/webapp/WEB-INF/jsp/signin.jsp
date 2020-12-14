<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 注册页面 -->
---------------------------------注册-------------------------------------------
<form action = "signin" method = "post">
        请输入用户名：<input type = "text" name = "username" id = "username">
        请输入密码：    <input type = "password" name = "password" id = "pwd_1">
        请确认密码：    <input type = "password" name = "password_2" id = "pwd_2" onblur="fun()">
        <input type = "submit" value = "注册">
    </form>
    
    <script>
        function fun() {
            var pwd_1 = document.getElementById("pwd_1").value;
            var pwd_2 = document.getElementById("pwd_2").value;
            if(pwd_1 == pwd_2){
                var password = pwd_1;
            }else{
            	alert("两次输入密码不一致！错误！")
            }
            
        }
    
    </script>
</body>
</html>