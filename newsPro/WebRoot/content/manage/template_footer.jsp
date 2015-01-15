<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<section class="related">
		<p>&copy;2015 华中科技大学2号卓越实验室 会管家</p>
		<a href="#">新闻发布系统</a><br />
		<a href="#">最图闻管理平台</a>
	</section>
</div><!-- /container -->
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/validater.js"></script>
<script type="text/javascript" src="js/manage2.js"></script>
<script>
	$(document).ready(function(){
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
					$("#container").addClass("container--open");
					location.href="news2/home";
				}
			});
		});//logout end
		
	});
</script>
</body>
</html>
