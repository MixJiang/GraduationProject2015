<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<base href="/newsPro/">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>ZNEWS</title>
		<meta name="description" content="A simple grid layout with an initial fullscreen intro" />
		<meta name="keywords" content="fullscreen image, grid layout, flexbox grid, transition" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/layout-simple.css" />
		<!--[if IE]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<!--<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>-->
   		<script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js" type="text/javascript"><\/script>');</script>
   		<script type="text/javascript" src="js/base.js"></script>
	</head>
	<body>
	<div class="hiddenBox">
   	<div id="loginBox">
   		<form  id="loginForm">
		  <div class="input-control">
		  	<input type="text" placeholder="用户名(邮箱/手机号)" name="username" id="username"/>
		  	<p class="form-tips"></p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" name="password" id="password"/>
		  	<p class="form-tips"></p>
		  </div>	
		  <div class="clearfix">
		  	<input type="button" id="loginSubmit" value="登录" class="pull-left"/>
		  	<input type="button" class="cancelSubmit" value="取消">
		  </div>	
		</form>
   	</div>
   	<div id="registerBox">
   		<form  id="registerForm">
		  <div class="input-control">
		  	<input type="text" placeholder="用户名(邮箱/手机号)" name="username" id="r_username"/>
		  	<p class="form-tips"></p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" name="password" id="r_password"/>
		  	<p class="form-tips"></p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="请确认密码" id="r_repassword"/>
		  	<p class="form-tips"></p>
		  </div>	
		  <div class="clearfix">
		  	<input type="button" id="registerSubmit" value="注册" class="pull-left"/>
		  	<input type="button" class="cancelSubmit" value="取消">
		  </div>	
		</form>
   	</div>
   </div>
   <script type="text/javascript">
$(document).ready(function(){
	$(".hiddenBoxMask").click(function(){
		$(".hiddenBox").css({'display':'none'});
	});
	$("#loginLink").click(function(){
		$(".hiddenBox").css({'display':'block'});
		$("#loginBox").css({'display':'block'});
		$("#registerBox").css({'display':'none'});
	});
	$("#registerLink").click(function(){
		$(".hiddenBox").css({'display':'block'});
		$("#registerBox").css({'display':'block'});
		$("#loginBox").css({'display':'none'});
	});
	$(".cancelSubmit").click(function(){
		$(".hiddenBox").css('display','none');
	});
	$("#loginSubmit").click(function(){
		var postdata={
			username:$("#username").val(),
			password:$("#password").val()
		};
		if(!validater.testLogin($("#username"),$("#password"))){
			return;
		}
		$.ajax({
			url:'api/login',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					//success
					$(".hiddenBox").css({'display':'none'});
					setCookie('username',data.username);
					$("#container").removeClass("container--open");
					location.href="news2/home";
				}
				else if(data.code == -1){
					$("#password").next().text("账号或密码错误");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});
	});//login end
	$("#registerSubmit").click(function(){
		var postdata={
			username:$("#r_username").val(),
			password:$("#r_password").val()
		};
		if(!validater.testRegister($("#r_username"),$("#r_password"),$("#r_repassword"))){
			return;
		}
		$.ajax({
			url:'api/register',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					//success
					$(".hiddenBox").css({'display':'none'});
					setCookie('username',data.username);
					$("#container").removeClass("container--open");
					location.href="news2/home";
				}
				else if(data.code == -1){
					$("#r_username").next().text("this name is in used!");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});
	});//register end
	$("#logoutBtn").click(function(){
		$.ajax({
			url:'api/logout',
			dataType:'json',
			type:'POST',
			data:{
				username:getCookie('username')
			},
			success:function(data){
				console.log(data);
				document.cookie="";
				$("#container").addClass("container--open");
				location.href="news2/home";
			}
		});
	});//logout end
	
});
   </script>