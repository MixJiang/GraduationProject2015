<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<% if(session.getAttribute("username") ==null ){ %>
<div id="container" class="container">
<%}else{%>
<div id="container" class="container container--open">
<%}%>
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
						<a class="demos__item demos__item--current" href="news2/home">焦点</a>
						<a class="demos__item" href="news2/tech">科技</a>
						<a class="demos__item" href="news2/entertain">娱乐</a>
						<a class="demos__item" href="news2/military">军事</a>
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
				<a href="manage2/self"><img src="img/userimg.jpg" class="headimg50"></a>
					
				<%}%>
			</div>
		</div><!-- /intro__content -->
	</header><!-- /intro -->
	<section class="items-wrap">
		<!-- <a href="#" class="item">
			<img class="item__image" src="img/item01.jpg" alt="item01"/>
			<h2 class="item__title">Magnificence</h2>
		</a> -->
	</section>
<script type="text/javascript">
$.ajax({
	url:'api/get_news_by_type?type=0',
	dataType:'json',
	type:'get',
	success:function(data){
		var list = data.news;
		var domstr,i;
		for(i=0;i<list.length;i++){
			domstr='<a href="news/detail?id='+list[i].id+'" class="item">'+
				'<img class="item__image" alt="" src="'+list[i].imgUrl+'">'+
				'<h2 class="item__title">'+list[i].title+'</h2></a>';
			$(".items-wrap").append(domstr);
		}
	}
});

</script>
<jsp:include page="template_footer.jsp" />