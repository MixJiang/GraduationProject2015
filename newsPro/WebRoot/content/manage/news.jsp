<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="template_header.jsp" />
<div id="container" class="container container--open">
	<header class="intro">
		<img class="intro__image" src="img/header03.jpg" alt="Iceland galcier"/>
		<div class="intro__content">
			<h1 class="intro__title">ZNEWS最图闻</h1>
			<div class="intro__subtitle">
				<div class="intro__description">
					最图闻新闻管理平台
					<div class="demos">
						<a class="demos__item demos__item--current" href="manage2/news">新闻管理</a>
						<a class="demos__item" href="manage2/comment">评论管理</a>
						<a class="demos__item" href="manage2/collection">我的收藏</a>
						<a class="demos__item" href="manage2/self">个人信息</a>
					</div>
				</div>
				<div class="user__menu">
					<p><%=session.getAttribute("username")%></p>
					<a href="news2/home">回到首页</a><a id="logoutBtn" href="javascript:void(0);">退出</a>
				</div>
				<a href="manage2/self"><img src="img/userimg.jpg" class="headimg50"></a>
			</div>
		</div><!-- /intro__content -->
	</header><!-- /intro -->
	<section class="manage-wrap">
		<div class="switch-tab">
			<button class="current" id="newslist">新闻列表</button>
			<button id="newscreate">新建新闻</button>
		</div>
		<div class="switch-content">
			<div id="newslist-ctr">
				<table id="newsListBox">
				<tr>
					<th>新闻标题</th>
					<th>类别</th>
					<th>发布时间</th>
					<th>发布作者</th>
					<th>操作</th>
				</tr>
				<%for(int i=0;i<10;i++){ %>
				<tr>
					<td>中国快递的五毛时代</td>
					<td>科技</td>
					<td>2015/01/12 09:30</td>
					<td>大熊猫</td>
					<td>
						<button>详细</button><button>审核</button>
					</td>
				</tr>
				<%} %>
			</table>
			</div>
			<div id="newscreate-ctr">
				<form id="createNewsBox" class="simpleform">
				  <div class="input-control">
				    <label>新闻标题</label>
				  	<input type="text"  name="title"/>
				  	<p class="form-tips"> </p>
				  </div>
				  <div  class="input-control">
				    <label>封面图片</label>
				  	<img alt="建议使用大图" src="#" id="newsimg">
				  	<p id="qiniu_upload_container">
				  		<input type="button" value="上传封面" id="qiniu_upload_pickfiles">
				  	</p>
				  </div>
				  <div  class="input-control">
				    <label>新闻类别</label>
				  	<select id="newstype">
				  		<option value="1">娱乐</option>
				  		<option value="2">科技</option>
				  		<option value="3">军事</option>
				  	</select>
				  	<p class="form-tips"> </p>
				  </div>
				  <div  class="input-control">
				    <label>内容</label>
				  	<textarea id="newscontentarea"></textarea>
				  	<p class="form-tips"> </p>
				  </div>
				  <div  class="input-control">
				  	<input type="button" value="新建" id="createNewsSubmitBtn"/>
				  	<p class="form-tips"></p>
				  </div>
				</form>
			</div>
		</div>
	</section>
<!-- 引入七牛SDK -->
<script type="text/javascript" src="js/qiniu/moxie.js"></script>
<script type="text/javascript" src="js/qiniu/plupload.dev.js"></script>
<script type="text/javascript" src="js/qiniu/qiniu.js"></script>
<script type="text/javascript" src="js/upload.js"></script>
<script type="text/javascript" >
	//manage news
	
    //init qiniu uploader
    var uploader = QiniuUploaderFactoray({
	        'UploadProgress': function(up, file) {
	        	$("#qiniu_upload_pickfiles").val("正在上传中...");
	        	//console.log("UploadProgress");
	        },
	        'FileUploaded': function(up, file, info) {
                var domain = up.getOption('domain');
                var res = $.parseJSON(info);
                var url = domain + res.key; 
                var img= new Image();
                img.src=url+"-news";
                $("#qiniu_upload_pickfiles").val("上传成功，正在获取...");
                img.onload=function(){
                	$("#newsimg")[0].src= img.src;
                	$("#qiniu_upload_pickfiles").val("修改图片");
                };
	       }
    });
    //create news
	$("#createNewsSubmitBtn").click(function(){
		var postdata={
			title:$("#createNewsBox input[name='title']").val(),
			content:$("#newscontentarea").val(),
			author:'<%=session.getAttribute("username")%>',
			type:$("#createNewsBox #newstype").find("option:selected").val(),
			imgUrl:$("#createNewsBox #newsimg")[0].src,
			createtime:new Date().getTime()
		};
		$.ajax({
			url:'api/createnews',
			dataType:'json',
			type:'POST',
			data:postdata,
			success:function(data){
				alert("创建成功");
			}
		});
	});//create news over
</script>
<jsp:include page="template_footer.jsp" />