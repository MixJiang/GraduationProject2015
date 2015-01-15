$(document).ready(function(){
	$("#loginBtn").click(function(){
		var postdata={
			username:$("#username").val(),
			password:$("#password").val()
		};
		$.ajax({
			url:'api/login_admin',
			dataType:'json',
			type:'post',
			data:postdata,
			success:function(data){
				if(data.code == 0){
					//success
					setCookie('username',data.username);
					location.href="manage/news";
				}
				else if(data.code == -1){
					$("#password + .form-tips").text("password is not zhengque.");
				}
		
			},
			error:function(data){
				console.log("server error");
			}
		});
	});//login over
	$("#logoutBtn").click(function(){
		$.ajax({
			url:'api/logout',
			dataType:'json',
			type:'POST',
			data:{
				username:getCookie("username")
			},
			success:function(data){
				console.log(data);
				document.cookie="";
				location.href="manage/login";
			}
		});
	});//logut over
	//============================news.jsp=================
	$("#newsListBtn").click(function(){
		$("#newsListBox").fadeIn();
		$("#createNewsBox").fadeOut();
	});
	$("#createNewsBtn").click(function(){
		$("#createNewsBox").fadeIn();
		$("#newsListBox").fadeOut();
	});
});