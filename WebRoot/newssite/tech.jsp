<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div id="main" class="response-ctr">
	<div id="page-tech">
		<!-- <section><a href="news/detail?id=20150111">
			<img class="newspic" alt="" src="http://www.tmtpost.com/wp-content/uploads/2014/12/14183417041-560x376.jpg">
			<p class="title">专车的寒冬,创新的窘境</p></a>	
		</section> -->
	</div>
</div>
<script type="text/javascript">
$($("#news-nav-list").children()[2]).addClass("current");
$.ajax({
	url:'api/get_news_by_type?type=2',
	dataType:'json',
	type:'get',
	success:function(data){
		var list = data.news;
		var domstr,i;
		for(i=0;i<list.length;i++){
			domstr='<section><a href="news/detail?id='+list[i].id+'">'+
				'<img class="newspic" alt="" src="'+list[i].imgUrl+'">'+
				'<p class="title">'+list[i].title+'</p></a><section>';
			$("#page-tech").append(domstr);
		}
	}
});
</script>
<jsp:include page="template_footer.jsp" />