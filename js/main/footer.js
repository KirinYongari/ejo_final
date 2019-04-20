/* 맨밑으로 내려오면 올라가는 Top 버튼 활성화 및 기능 */
$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 500) {
			$('#move-top-btn').fadeIn();
		} else {
			$('#move-top-btn').fadeOut();
		}
	});
	
	$("#move-top-btn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
});