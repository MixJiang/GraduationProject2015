<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>最图闻</title>
    <meta charset="utf-8">
    <base href="/newsPro/">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, user-scalable=0">
    <meta name="author" content="机智的大熊猫,开源小熊猫" />
    <meta name="renderer" content="webkit">
    <meta name="description" content=" " />
    <meta name="Keywords" content="">

    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/base.css">
	<link rel="stylesheet" type="text/css" href="css/news.css">
	
    <!--<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js" type="text/javascript"><\/script>');</script>
    <script src="js/base.js"></script>
    <script src="js/news.js"></script>

</head>
<body>
<!-- header -->
<div id="header">
<div class="response-ctr ">
   <ul class="pull-left" id="news-nav-list">
    <li><a href="news/home">焦点</a></li>
    <li><a href="news/entertainment">娱乐</a></li>
    <li><a href="news/tech">科技</a></li>
    <li><a href="news/military">军事</a></li>
   </ul>
   <div class="pull-right">
       <!-- <a href=""><img src="img/logo-b.png"></a> -->
       <% if(session.getAttribute("username") ==null ){ %>
       <span id="loginLink">登录</span>
       <span id="registerLink">注册</span>
       <%}else{%>
       <a href="manage/news"><%= session.getAttribute("username")%>个人管理</a>
   		<span id="logoutBtn">退出</span>
       <%} %>
   </div>
   <div class="hiddenBox">
   	<div class="hiddenBoxMask"> </div>
   	<div id="loginBox">
   		<h1>用户登录</h1>
   		<form  id="loginForm">
		  <div class="input-control">
		  	<input type="text" placeholder="用户名(邮箱/手机号)" name="username" id="username"/>
		  	<p class="form-tips">请输入用户名</p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" name="password" id="password"/>
		  	<p class="form-tips form-tips-error">请输入密码</p>
		  </div>	
		  <div class="clearfix">
		  	<input type="button" id="loginSubmit" value="登录" class="pull-left"/>
		  </div>	
		</form>
   	</div>
   	<div id="registerBox">
   		<h1>用户注册</h1>
   		<form  id="registerForm">
		  <div class="input-control">
		  	<input type="text" placeholder="用户名(邮箱/手机号)" name="username" id="r_username"/>
		  	<p class="form-tips">请输入用户名</p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" name="password" id="r_password"/>
		  	<p class="form-tips form-tips-error">请输入密码</p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" id="r_repassword"/>
		  	<p class="form-tips form-tips-error">确认密码</p>
		  </div>	
		  <div class="clearfix">
		  	<input type="button" id="registerSubmit" value="注册" class="pull-left"/>
		  </div>	
		</form>
   	</div>
   </div>
</div>
</div>