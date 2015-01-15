<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
					图片新闻发布网站
					<div class="demos">
						<a class="demos__item" href="news2/home">首页</a>
						<a class="demos__item demos__item--current" href="news2/tech">科技</a>
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
getNewsByType($(".items-wrap"),2);
</script>
<jsp:include page="template_footer.jsp" />