<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<section class="related">
		<p class="link_title">友情链接</p>
		<div class="footer__link__wrap">
			<div>
				<a href="http://www.12371.cn/">中国共产党网</a>
				<a href="http://news.sina.com.cn/">新浪新闻</a>
				<a href="http://news.qq.com/">腾讯新闻</a>
			</div>
			<div>
				<a href="http://www.xinhuanet.com/">新华网</a>
				<a href="http://news.sohu.com/">搜狐新闻</a>
				<a href="http://www.huanqiu.com/">环球网</a>
			</div>
			<div>
				<a href="http://news.163.com/">网易新闻</a>
				<a href="http://www.time.com/">美国时代周刊</a>
				<a href="http://news.ifeng.com/">凤凰资讯</a>
			</div>
		</div>
		<p>&copy;2015 华中科技大学2号卓越实验室 会管家组 新闻发布系统</p>
	</section>
</div><!-- /container -->
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/validater.js"></script>
<script>
	(function() {
		
		function toggleContent() {
			if($("#container").hasClass("container--open")){
				$("#container").removeClass("container--open");
				$("button.trigger").removeClass("trigger--active");
				$(".intro__title").css('display','block');
				window.addEventListener("scroll",noscroll);
			}
			else{
				$("#container").addClass("container--open");
				$("button.trigger").addClass("trigger--active");
				$(".intro__title").css('display','none');
				window.removeEventListener("scroll",noscroll);
			}
		}

		function noscroll() {
			window.scrollTo( 0, 0 );
		}

		// reset scrolling position
		document.body.scrollTop = document.documentElement.scrollTop = 0;

		// disable scrolling
		if(document.cookie =="" && location.href.search("home") > 0){
			window.addEventListener( 'scroll', noscroll );
		}
		$("button.trigger").click(toggleContent);

		// For Demo purposes only (prevent jump on click)
		[].slice.call( document.querySelectorAll('.items-wrap a') ).forEach( function(el) { el.onclick = function() { return false; } } );
	})();
</script>
</body>
</html>
