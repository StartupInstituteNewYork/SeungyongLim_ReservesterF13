$(document).ready(function(){
	$("button").bind("click",function(){
		$("#dropbox").toggle("slow")
	});
	$("img").bind("hover",function(){
		$(this).addclass("picture")
	});

});

