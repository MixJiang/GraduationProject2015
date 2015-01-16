// manage2.js
// switch controller
(function(){
	var i;
	var tabs = $(".switch-tab").children();
	var contents = $(".switch-content").children();
	$(".switch-tab").delegate("button","click",function(){
		for(i=0;i< tabs.length;i++){
			$(tabs[i]).removeClass("current");
		}
		$(this).addClass("current");

		for(i=0;i< contents.length;i++){
			$(contents[i]).css('display','none');
		}
		$("#"+this.id+"-ctr").css('display','block');
	});//event end

	for(i=1;i< contents.length;i++){
		$(contents[i]).css('display','none');
	}
})();