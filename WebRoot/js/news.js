$(document).ready(function(){
	//header
	$(".hiddenBoxMask").click(function(){
		$(".hiddenBox").css({'display':'none'});
	});
	$("#loginLink").click(function(){
		console.log("loginlink");
		$(".hiddenBox").css({'display':'block'});
		$(".hiddenBoxMask").css({'display':'block'});
		$("#loginBox").css({'display':'block'});
	});
	$("#registerLink").click(function(){
		console.log("registerlink");
		$(".hiddenBox").css({'display':'block'});
		$(".hiddenBoxMask").css({'display':'block'});
		$("#registerBox").css({'display':'block'});
	});
	$("#loginSubmit").click(function(){
		var postdata={
			username:$("#username").val(),
			password:$("#password").val()
		};
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
					location.href="news/home";
				}
				else if(data.code == -1){
					$("#password + .form-tips").text("password is not zhengque.");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});
	});
	$("#registerSubmit").click(function(){
		var postdata={
			username:$("#r_username").val(),
			password:$("#r_password").val()
		};
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
					location.href="news/home";
				}
				else if(data.code == -1){
					$("#r_username + .form-tips").text("this name is in used!");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});
	});
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
				location.href="news/home";
			}
		});
	});//logout over
	
	//fix newsimg
});