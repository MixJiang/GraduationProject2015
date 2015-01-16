<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div id="container" class="container container--open">
	<div class="user__action">
	<% if(session.getAttribute("username") ==null ){ %>
		<button id="loginLink">登录</button>
		<button id="registerLink">注册</button>
	<%}%>
	</div>
	<header class="intro">
		<img class="intro__image" src="img/header03.jpg" alt="Iceland galcier"/>
		<div class="intro__content">
			<h1 class="intro__title">ZNEWS最图闻</h1>
			<div class="intro__subtitle">
				<div class="intro__description">
					<p class="title">ZNEWS最图闻——汇集最精彩的图片与新闻</p>
					<div class="demos">
						<%if(request.getAttribute("type").toString().equals("2")){ %>
						<a class="demos__item" href="news2/tech">科技</a>
						<%}else if(request.getAttribute("type").toString().equals("1")) {%>
						<a class="demos__item" href="news2/entertain">娱乐</a>
						<%}else if(request.getAttribute("type").toString().equals("3")){ %>
						<a class="demos__item" href="news2/military">军事</a>
						<%} %>
						<a href="news2/detail?id=${news.id}">|${news.title}</a>
					</div>
				</div>
				<% if(session.getAttribute("username") ==null ){ %>
				<button class="trigger">
					<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
						<g class="icon icon--grid">
							<rect x="32.5" y="5.5" width="22" height="22"/>
							<rect x="4.5" y="5.5" width="22" height="22"/>
							<rect x="32.5" y="33.5" width="22" height="22"/>
							<rect x="4.5" y="33.5" width="22" height="22"/>
						</g>
						<g class="icon icon--cross">
							<line x1="4.5" y1="55.5" x2="54.953" y2="5.046"/>
							<line x1="54.953" y1="55.5" x2="4.5" y2="5.047"/>
						</g>
					</svg>
					<span>View content</span>
				</button>
				<%}else{%>
				<div class="user__menu">
					<p><%=session.getAttribute("username")%></p>
					<a href="manage2/news">管理平台</a><a id="logoutBtn" href="javascript:void(0);">退出</a>
				</div>
				<a href="manage2/self"><img src="${session.headimg}" class="headimg50"></a>
					
				<%}%>
			</div>
		</div><!-- /intro__content -->
	</header><!-- /intro -->
	<section class="detail-wrap">
		<h1>${news.title}</h1>
		<p>
		  <span id="newsCreatetime"></span>
		  <script>
		  	$("#newsCreatetime").text(getLocalTime("${news.createtime}"));
		  </script>
		  
		  <span>编者:${news.author}</span>
		  <span class="collectionBtn pull-right">&hearts;收藏此文</span>  
		</p>
		<img src="${news.imgUrl}">
		<p>${news.content}</p>
	</section>
	<section class="comment-wrap">
		<div>
		<textarea rows="" cols="" id="comment-textarea"></textarea>
		<button class="commentBtn">我要评论</button>
		</div>
		<ul class="comment-list">
<!-- 			<li class="clearfix">
				<img src="img/userimg.jpg" class="userimg">
				<div class="comment-box">
					<p>武汉网友:<span class="pull-right">1月15日 18:30</span></p>
					<p>是啊啊啦啦啦啦啦啦啦！</p>
				</div>
			</li> -->
		</ul>
	</section>
<script type="text/javascript">
function find_comment_by_newsid(newsid){
	$.ajax({
		url:'api/find_comment_by_newsid?newsid='+newsid,
		dataType:'json',
		type:'get',
		success:function(data){
			if(data.code == 0){
				var list =data.list;
				for(var i=list.length-1;i>=0;i--){
					$(".comment-list").append('<li><div class="comment-box">'+
						'<p class="username">'+list[i].username+':<span class="pull-right">'+
						    getLocalTime(list[i].createtime)+'</span></p>'+
						'<p>'+list[i].content+'</p></div></li>');
				}
			}
			else{
				console.log("data error");
			}
		},
		error:function(data){
			console.log("server error");
		}
	});//ajax end
}
//提交评论
$(".commentBtn").click(function(){
	var postdata={
			username:"${session.username}",
			content:$("#comment-textarea").val(),
			createtime:new Date().getTime(),
			newsid:'${news.id}',
			newstitle:'${news.title}',
			//userid:"",
		};
	if(postdata.content.trim() ==""){
		alert("请输入评论内容~");
		return;
	}
	$(".commentBtn").text("正在提交...");
	$.ajax({
		url:'api/add_comment',
		dataType:'json',
		type:'post',
		data:postdata,
		success:function(data){
			if(data.code == 0){
				//success 及时刷新评论
				$(".commentBtn").text("评论成功");
				$("#comment-textarea").val("");
				if(postdata.username==""){postdata.username="匿名网友";}
				$(".comment-list").prepend('<li><div class="comment-box">'+
					'<p class="username">'+postdata.username+':<span class="pull-right">'+
					    getLocalTime(postdata.createtime)+'</span></p>'+
					'<p>'+postdata.content+'</p></div></li>');
			}
			else{
				console.log("data error");
				$(".commentBtn").text("评论失败，请稍后再试");
			}
	
		},
		error:function(data){
			console.log("server error");
			$(".commentBtn").text("评论失败，请稍后再试");
		}
	});//ajax end
});
$(document).ready(function(){
	find_comment_by_newsid('${news.id}');
});
</script>
<jsp:include page="template_footer.jsp" />