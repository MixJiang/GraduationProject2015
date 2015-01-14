<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div class="wrapper">
	<header class="response-ctr" id="header">
		<img alt="" src="img/logo-large.png" class="logo-large">
		<h1>新闻发布平台</h1>
	</header>
	<div id="main" class="response-ctr">
		<form  id="loginForm">
		  <div class="input-control">
		  	<input type="text" placeholder="用户名(邮箱/手机号)" name="username" id="username"/>
		  	<p class="form-tips"> </p>
		  </div>
		  <div  class="input-control">
		  	<input type="password" placeholder="账户密码" name="password" id="password"/>
		  	<p class="form-tips form-tips-error"> </p>
		  </div>	
		  <div class="clearfix">
		  	<input type="button" id="loginBtn" value="登录" class="pull-left"/>
			<input type="button" id="registerBtn" value="没有账号?" class="pull-right"/>
		  </div>	
		</form>
	</div>
</div>
<script type="text/javascript">
	$("#loginBtn").click(function(){
		var postdata={
			username:$("#username").val(),
			password:$("#password").val()
		};
		if(postdata.username ==""){
			$("#username + .form-tips").text("请输入账号");
			return;
		}
		if(postdata.password == ""){
			$("#password + .form-tips").text("请输入密码");
			return;
		}
		$.ajax({
			url:'api/login_admin',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					location.href="manage/news";
				}
				else if(data.code == -1){
					$("#password + .form-tips").text("账号或密码错误");
				}
		
			},
			error:function(data){
				console.log("server error");
				alert("服务端错误");
			}
		});
	});
	$("#registerBtn").click(function(){
		alert("该页面为管理员专用登录页面，申请管理员账号请联系机智的大熊猫smart@panda.com");
	});
</script>
<jsp:include page="template_footer.jsp" />