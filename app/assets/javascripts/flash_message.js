$(document).ready(function() {
	$(".close").click(function(){
		$("#flash").hide();});
	setInterval(function(){
		$('#flash').slideUp();
	}, 10000);
});