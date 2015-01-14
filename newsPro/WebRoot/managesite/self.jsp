<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div id="manage">
	<div class="response-ctr content clearfix">
		<ul class="pull-left" id="manage-nav-list">
			<li><a href="manage/news">新闻管理</a></li>
			<%if ( session.getAttribute("type") == "0"){ %>
			<li><a href="manage/user">用户管理</a></li>
			<%} %>
			<li><a href="manage/commit">评论管理</a></li>
			<li><a href="manage/collection">收藏管理</a></li>
			<li class="current"><a href="manage/self">个人管理</a></li>
		</ul>
		<div class="main">
			<h1>个人信息管理</h1>
			<form  id="selfInfoForm" class="simpleform">
			  <div class="input-control">
			  	<label>用户名</label>
			  	<span><%=session.getAttribute("username")%></span>
			  	<p class="form-tips"></p>
			  </div>
			  <div  class="input-control">
			    <label>头像</label>
			    <img alt="100x100" src="" id="headimg100" class="headimg">
			    <img alt="50x50" src="" id="headimg50" class="headimg">
			  	<span id="qiniu_upload_container">
			  		<button id="qiniu_upload_pickfiles">上传新头像</button>
			  	</span>
			  	<p class="form-tips"></p>
			  </div>
			  <div  class="input-control">
			    <label>性别</label>
			  	<input type="radio" name="sex" value="m" checked>男
			  	<input type="radio" name="sex" value="f">女 
			  	<p class="form-tips"></p>
			  </div>
			  <div  class="input-control">
			    <label>手机号码</label>
			  	<input type="text" name="phone"/>
			  	<p class="form-tips"></p>
			  </div>	
			  <div class="input-control">
			  	<input type="button" id="modifyselfSubmit" value="确认修改个人信息" />
			  </div>	
			</form>
			<h1>修改密码</h1>
			<form  id="modifyPassForm" class="simpleform">
			  <div class="input-control">
			  	<label>原密码</label>
			  	<input type="password" name="password"/>
			  	<p class="form-tips"></p>
			  </div>
			  <div class="input-control">
			  	<label>新密码</label>
			  	<input type="password" name="newspassword"/>
			  	<p class="form-tips"></p>
			  </div>
			  <div class="input-control">
			  	<label>确认新密码</label>
			  	<input type="password"/>
			  	<p class="form-tips"></p>
			  </div>
			  <div>
			  	<input type="button" id="modifyPassSubmit" value="确认修改密码" />
			  </div>
			</form>
		</div>
	</div>	
</div>
<!-- 引入七牛SDK -->
<script type="text/javascript" src="js/qiniu/moxie.js"></script>
<script type="text/javascript" src="js/qiniu/plupload.dev.js"></script>
<script type="text/javascript" src="js/qiniu/qiniu.js"></script>
<script type="text/javascript" src="js/upload.js"></script>
<script type="text/javascript">
    //init qiniu uploader
    var uploader = QiniuUploaderFactoray({
	        'UploadProgress': function(up, file) {
	        	$("#qiniu_upload_pickfiles").text("正在上传中...");
	        	//console.log("UploadProgress");
	        },
	        'FileUploaded': function(up, file, info) {
	                var domain = up.getOption('domain');
	                var res = $.parseJSON(info);
	                var url = domain + res.key; 
	                $("#headimg100")[0].src= url+"-head100";
	                $("#headimg50")[0].src= url+"-head50"; 
	                $("#qiniu_upload_pickfiles").text("上传成功")
	        }
	});
	$("#modifyselfSubmit").click(function(){
		var postdata={
			username:'<%=session.getAttribute("username")%>',
			phone:$("input[name='phone']").val(),
			headimg:$("#headimg100")[0].src
		};
		if($("#selfInfoForm input[name='sex']")[0].checked){
			postdata.sex=$($("#selfInfoForm input[name='sex']")[0]).val();
		}
		else{
			postdata.sex=$($("#selfInfoForm input[name='sex']")[1]).val();
		}
		//发送前还需做数据验证
		$.ajax({
			url:'api/modify_userinfo',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					//success
					alert("修改成功");
				}
				else{
					console.log("data error");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});//ajax end
	});//modify userinfo end
	$("#modifyPassSubmit").click(function(){
		var postdata={
			username:'<%=session.getAttribute("username")%>',
			password:$("input[name='password']").val(),
			newpassword:$("input[name='newspassword']").val()
		};
		//发送前还需做数据验证
		$.ajax({
			url:'api/modify_password',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					//success
					alert("修改成功");
				}
				else{
					alert("原密码错误");
					console.log("data error");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});//ajax end
	});//modify password end
	$(document).ready(function(){
		$.ajax({
			url:'api/get_userinfo',
			dataType:'json',
			type:'post',
			data:{
				username:'<%=session.getAttribute("username")%>'
			},
			success:function(data){
				if(data.code == 0){
					//success
					var user=data.user;
					$("#selfInfoForm input[name='username']").val(user.username);
					$("#selfInfoForm input[name='imgUrl']").val(user.imgUrl);
					$("#selfInfoForm input[name='phone']").val(user.phone);
					if(user.sex == 'f'){
						$("#selfInfoForm input[name='sex']")[1].checked=true;
					}
					$("#headimg100")[0].src=$("#headimg50")[0].src=user.headimg;
				}
				else{
					console.log("data error");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});//ajax end
	});
	
	
</script>
<jsp:include page="template_footer.jsp" />