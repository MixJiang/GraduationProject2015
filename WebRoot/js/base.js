$(document).ready(function(){
	fixFooter();
	fixHeader();
});
function getCookie(c_name){
	if (document.cookie.length>0){
	  c_start=document.cookie.indexOf(c_name + "=");
	  if (c_start!=-1){ 
	    c_start=c_start + c_name.length+1 ;
	    c_end=document.cookie.indexOf(";",c_start);
	    if (c_end==-1) c_end=document.cookie.length;
	    	return unescape(document.cookie.substring(c_start,c_end));
	    } 
	  }
	return "";
}
function setCookie(c_name,value){
	document.cookie=c_name+ "=" +escape(value)+";";
}
function fixFooter () {
	var wh = $(window).height(),
		bh = $("body").height(),
		fh = $("#footer").height();
	
	if(bh < wh){
		$("html").css({"height":"100%"});
		$("body").css({"position":"relative","height":"100%"});
		$("#footer").css({"position":"fixed","bottom":"0","width":"100%"});
	}
}

function fixHeader (){
	// $("#header").delegate("li","mouseover",function(){
	// 	$(this).addClass("current");
	// });
	// $("#header").delegate("li","mouseout",function(){
	// 	$(this).removeClass("current");
	// });

	// $("#header li").removeClass("selected");
	// var navname = location.pathname.split("/")[1];
	// $("#nav-"+navname).addClass("selected");

}
