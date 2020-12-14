<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import  = "com.snowsoft.bean.User"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<%--   <script type = "text/javascript" src = "${path}/plugins/layui/layui.js"></script> --%>
  <script type = "javascript"></script>
  <title>出租车管理系统</title>
  <link rel="stylesheet" href="${path}/plugins/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" id="logo">出租车管理系统</div>
    
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
          ${user.uName}
      </li>
      <li class="layui-nav-item"><a href="">安全退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
<!--         <li class="layui-nav-item layui-nav-itemed"> -->
          <c:forEach items = "${menulist}" var = "menu">
          	 <li class="layui-nav-item layui-nav-itemed">
          	 	<a href = "${menu.url}" class = "${menu.url}" >${menu.m_name}</a>
          	 </li>
          </c:forEach>
<!--         <li class="layui-nav-item"> -->
          
<!--         </li> -->
<!--         <li class="layui-nav-item"><a href="">云市场</a></li> -->
<!--         <li class="layui-nav-item"><a href="">发布商品</a></li> -->
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">内容主体区域</div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script src="${path}/plugins/layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>