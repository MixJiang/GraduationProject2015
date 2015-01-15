<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>最图闻发布平台</title>
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
	<link rel="stylesheet" type="text/css" href="css/manage.css">
	
    <!--<script src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>-->
    <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js" type="text/javascript"><\/script>');</script>
    <script src="js/base.js"></script>
	<script src="js/manage.js"></script>
</head>
<body>
<% if(session.getAttribute("username") !=null ){ %>
<div class="header">
	<div class="response-ctr clearfix">
		<h1 class="pull-left">最图文新闻发布平台</h1>
		<div class="pull-right">
			<p> ${sessionScope.username}<button id="logoutBtn">退出</button></p>
		</div>
	</div>
</div>
<%}%>