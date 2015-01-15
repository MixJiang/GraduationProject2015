<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div id="main" class="response-ctr">
	<div id="page-detail" class="clearfix">
		<div class="pull-left comment-side">
			<img src="img/bg-home.jpg">
			<ul class="commentList">
				<%for(int i=0;i<10;i++){ %>
				<li>
					<p>网友:2015.1.20</p>
					<p>这里是评论内容</p>
				</li>
				<%} %>
			</ul>
			<div class="commentBox">
				<form>
					<textarea>
					</textarea>
					<input type="submit">
				</form>
			</div>
		</div>
		<div class="news-side">
			<h1>专车的寒冬,创新的窘境</h1>
			<p><span>2015-01-11 18:23:48</span><span>来自百度</span></p>
			<div class="news-content">
			<%for(int i=0;i<100;i++){ %>
				我从来不造假新闻
			<%} %>
			</div>
			<p>编辑：李全锋</p>
			<div>
				<a href="">上一条</a>
				<a href="">下一条</a>
			</div>
		</div>
		
	</div>
</div>
<jsp:include page="template_footer.jsp" />