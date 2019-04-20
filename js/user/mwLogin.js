jQuery(function($){
	var loginWindow = $('.mwLogin');
	var login = $('#login');
	var uid = $('.iText.uid');
	var upw = $('.iText.upw');
	var oid = $('.iText.oid');
	
	// Show Hide
	$('.loginTrigger').click(function(){
		loginWindow.addClass('open');
	});
	$('#login .close').click(function(){
		loginWindow.removeClass('open');
	});
	$('#login .btn-cancel').click(function(){
		loginWindow.removeClass('open');
	});
	// oLogin
	$('.oAnchor').click(function(){
		login.removeClass('gLogin');
		login.addClass('oLogin');
	});
	// gLogin
	$('.gAnchor').click(function(){
		login.removeClass('oLogin');
		login.addClass('gLogin');
	});
	// Warning
	$('#keepid').change(function(){
		if($('#keepid[checked]')){
			$('.warning').toggleClass('open');
		};
	});
	// Input Clear
	var iText = $('.item>.iLabel').next('.iText');
	$('.item>.iLabel').css('position','absolute');
	iText
		.focus(function(){
			$(this).prev('.iLabel').css('visibility','hidden');
		})
		.blur(function(){
			if($(this).val() == ''){
				$(this).prev('.iLabel').css('visibility','visible');
			} else {
				$(this).prev('.iLabel').css('visibility','hidden');
			}
		})
		.change(function(){
			if($(this).val() == ''){
				$(this).prev('.iLabel').css('visibility','visible');
			} else {
				$(this).prev('.iLabel').css('visibility','hidden');
			}
		})
		.blur();
	// Validation
	$('#login>.gLogin input[type=submit]').click(function(){
		if($("#userid").val() == ''){
			$('#msg-login').text('ID를 입력하세요.').css('color', 'red');
			return false;
		}
		else if($("#pwd").val() == ''){
			$('#msg-login').text('PASSWORD를 입력하세요.').css('color', 'red');
			return false;
		}
	});
	
	// ESC Event
	$(document).keydown(function(event){
		if(event.keyCode != 27) return true;
		if (loginWindow.hasClass('open')) {
			loginWindow.removeClass('open');
		}
		return false;
	});
	// Hide Window
	loginWindow.find('>.bg').mousedown(function(event){
		loginWindow.removeClass('open');
		return false;
	});
	
	$("#gLogin").submit(function(event){
		event.preventDefault();
		var userid = $("#userid").val();
		var password = $("#pwd").val();
		var autoLogin = false;
		var autoId = false;
		
		if($("[name='autoLogin']").is(":checked")== true){
			autoLogin = true;
		}
		
		if($("[name='autoId']").is(":checked")==true){
			autoId = true;
		}
		
		$.ajax({
			data : {'userid':userid, 'pwd':password, 'autoLogin':autoLogin, 'autoId': autoId},
			type:'post',
			url:'/jhta/user/login.do',
			dataType:'text',				
			success :function(result){
				location.href="/jhta/home.do"
			},
			error: function(xhr, status, error) {
				$('#msg-login').text('ID 또는 PASSWORD가 올바르지 않습니다.').css('color', 'red');
				return false;
	        }
		});
	})
	
});


