<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
<link href="../resources/css/mypage/mypage.css" rel="stylesheet">
<%@ include file="../include/resource.jsp" %>
<script type="text/javascript">
	function chkMbId() {
		var checknum = 0;
		var inputId = $("[name=id]").val();

		$.ajax({
			data : {
				"id" : inputId
			},
			type : 'post',
			url : "idCheck.do",
			dataType:'text',
			success : function(result) {
			console.log(result);
				if (result == 1) {
					$("#btnSend").prop("disabled", true);
					$("#messge").css("color", "#de1010");
					$("#messge").text('아이디 중복');

				} else if (result == 0) {
					$("#btnSend").prop("disabled", false);
					$("#messge").css("color", "#3316ca");
					$("#messge").text('아이디  사용가능');

				} else if (inputId == "") {
					$("#messge").text('아이디를 입력하시오');
				}
			},

			error : function(xhr, status, error) {

			}

		});
	}
	function pwdchk() {
		var password1 = $("#password5").val();
		var password2 = $("#password2").val();
		/*
			하나 이상의 영문 대문자 (?=.*?[AZ])
			적어도 하나의 영문 소문자 (?=.*?[az])
			하나 이상의 숫자 (?=.*?[0-9])
			하나 이상의 특수 문자 (?=.*?[#?!@$%^&*-])
			최소 길이 8 인치 .{8,} (앵커 포함)
		
		 */
		 var regExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			/* (비밀번호를 동일하게 정확히 입력해주십시오.) */
			if (password2 === "" && (password1 !== password2 || password1 === "")) {
				$('#btnSend').prop("disabled", true);
				$("#pwd-messge").css("color", "#de1010");
				$('#pwd-messge').text("(비밀번호를 동일하게 정확히 입력해주십시오.)");

			} else if (!regExp.test(password2) && !regExp.test(password1)) {
				$('#btnSend').prop("disabled", true);
				$("#pwd-messge").css("color", "#de1010");
				$('#pwd-messge').text("적어도 하나의 소문자,특수문자 입력");

			} else if (password2 !== password1) {
				$('#btnSend').prop("disabled", true);
				$('#pwd-messge').text("(비밀번호를 동일하게 정확히 입력해주십시오.)");
			} else if (regExp.test(password2) && regExp.test(password1)) {
				if (password1 === password2) {
					$('#btnSend').prop("disabled", false);
					$("#pwd-messge").css("color", "#3316ca");
					$('#pwd-messge').text("적합한 비밀번호");
				}
			}

	}
</script>
<style>
.form{ margin:0; padding:0; font-size:12px; font-family:Tahoma, Geneva, sans-serif;}
.form fieldset{ margin:0 0 30px 0; padding:0; _padding-bottom:30px; border:0;}
.form legend{ margin:0; padding:5px 0; font:bold 14px Dotum, 돋움;}
.form legend .icon{ font-weight:normal; font-size:16px; color:#999; vertical-align:middle;}
.form input,
.form textarea,
.form select,
.form button{ font-size:12px; font-family:Tahoma, Geneva, sans-serif;}
.form em{ font-style:normal; color:#f60;}
.form label{ color:#666; margin:0 10px 0 0; cursor:pointer;}
.form ul{ position:relative; overflow:hidden; margin:0; padding:0; color:#666; list-style:none; border-top:2px solid #999; border-bottom:1px solid #ccc; *zoom:1;}
.form li{ position:relative; clear:both; border:1px solid #eee; border-left:0; border-right:0; margin:-1px 0; padding:8px 0; vertical-align:top; *zoom:1;}
.form li:after{ content:""; display:block; clear:both;}
.form li .btnRegist{ margin:2px 10px 2px 0;}
.form .iText{ position:relative; padding:0 4px; margin:2px 0; border:1px solid #b7b7b7; border-right-color:#e1e1e1; border-bottom-color:#e1e1e1; background:transparent; color:#666;}
.form input.iText{ width:200px; height:30px; line-height:22px; vertical-align:middle; margin-right:10px;}
.form input.iFile{ margin:2px 10px 2px 0; vertical-align:middle;}
.form input.address{ width:500px;}
.form textarea.sign{ width:590px; height:60px; padding:3px 4px;}
.form .iCheck,
.form .iRadio{ margin:0; padding:0; width:13px; height:13px; vertical-align:middle;}
.form .tLabel{ font-weight:bold; margin:0 10px 0 0; color:#333;}
.form .iLabel{ display:block; position:static; top:15px; left:5px; color:#333; font-weight:bold;}
.form .iLabel em{ font-weight:normal;}
.form .desc{ margin:0; color:#666; line-height:22px; vertical-align:middle;}
.form .question{ font-weight:bold; color:#333; margin:0 0 5px 0;}
.form .answer{ margin:0;}
.form .btnArea{ margin:1em 0; text-align:center; *zoom:1;}
.form .btnArea:after{ content:""; display:block; clear:both;}
.form .btnArea .fLeft{ float:left;}
.form .btnArea .fRight{ float:right;}
.form .btnRegist,
.form .btnRegist *{ position:relative; display:inline-block; vertical-align:top; height:24px; line-height:24px; border:0; overflow:visible; background:url(btnRegistration.gif) no-repeat; white-space:nowrap; cursor:pointer;}
.form .btnRegist{ background-position:left top; margin-right:2px;}
.form .btnRegist *{ background-position:right top; left:2px; padding:0 8px 0 6px; font-size:12px; color:#333; text-decoration:none !important;}
.form .btnRegist.strong *{ font-weight:bold;}
</style>
</head>
<body>
<%@ include file="../include/main-nav.jsp" %>
	<!-- 배경사진 넣는곳 -->
	<c:choose>
		<c:when test="${empty theme.picture }">
			<div class="main-photo" style="background-image: url(../resources/images/theme/basic-theme.jpg);">
		</c:when>
		<c:otherwise>
			<div class="main-photo" style="background-image: url(../resources/images/theme/${theme.picture});">
		</c:otherwise>
	</c:choose>

	<!-- 프로필 사진 넣는곳 -->
	<c:choose>
		<c:when test="${empty theme.img }" >
			<img src="../resources/images/profile/basic-profile.jpg">			
		</c:when>
		<c:otherwise>
			<img src="../resources/images/profile/${theme.img }">					
		</c:otherwise>
	</c:choose>
	<div class="my-info">
	    <div class="my-info-section">
	        <ul class="left">
	        <c:choose>
		        <c:when test="${not empty LOGIN_USER }">
    	            <li>
        	            <p>로그인 사용자 : ${LOGIN_USER.getNickname()}님 (${LOGIN_USER.getId()})</p>
            	        <p>회원등급    : 일반회원</p>
                	</li>
	        	</c:when>
	        </c:choose>
	        </ul>
	        <ul class="right">
                <li>
                    <p><button value="전송하기" id="profile-change">프로필사진 바꾸기</button></p>
                    <p><button value="전송하기" id="theme-change">배경사진 바꾸기</button></p>
                </li>
	        </ul>
	      
	    </div>
	</div>
</div>
<div class="bottom-wrap">
    <div class="bottom-menu">
        <ul>
    		<input type="hidden" id="detail-list" name="tab" value="my-detail">
            <li><a href="javascript:void(0);" id="ticket-reserve" class="on">티켓예매내역</a></li>
            <li><a href="javascript:void(0);" id="my-pick">마이픽</a></li>
            <li><a href="javascript:void(0);" id="my-info-change">개인정보수정</a></li>
            <li><a href="javascript:void(0);" id="withdrawal">회원탈퇴</a></li>
        </ul>    
    </div>
</div>
<!-- 내용 비어져있음 위에서 버튼 선택하면 내용이 채워짐 -->
<div class="bottom-cont" style="height:620px;">


	

</div>




<!-- 프로필 변경하기 모달 -->
<div id="profile-change-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">
	
	    <!-- Modal content-->
	    <form action="fileUpload.do" method="post" enctype="multipart/form-data" >
		    <div class="modal-content">
		      	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        	<h4 class="modal-title">프로필 사진 변경하기</h4>
		      	</div>
		      	<div class="modal-body">
		        	<div class="form-group">
		        		<label>사진</label>
		        		<input type="file" class="form-control" name="photofile" />
		        	</div>
		      	</div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary" >변경</button>
		      	</div>
		    </div>
		</form>
	</div>
</div>


<!-- 배경사진 변경하기 모달 -->
<div id="theme-change-modal" class="modal fade" role="dialog">
	<div class="modal-dialog">

    <!-- Modal content-->
	    <form action="fileUpload2.do" method="post" enctype="multipart/form-data">
		    <div class="modal-content">
		      	<div class="modal-header">
		        	<button type="button" class="close" data-dismiss="modal">&times;</button>
		        	<h4 class="modal-title">테마 사진 변경하기</h4>
		      	</div>
		      	<div class="modal-body">
		        	<div class="form-group">
			        	<label>사진</label>
			        	<input type="file" class="form-control" name="photothemefile" />
		        	</div>
		      	</div>
		      	<div class="modal-footer">
			        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        <button type="submit" class="btn btn-primary" >변경</button>
      			</div>
	    	</div>
		</form>
  	</div>
</div>



<%@ include file="../include/footer.jsp" %>
</body>
<script>
$(function() {
	$('#profile-change').click(function() {
		$('#profile-change-modal').modal('show')
	});
	$('#theme-change').click(function() {
		$('#theme-change-modal').modal('show')
	});
	
	if ($('#detail-list').val() == 'my-detail')
	

	
	/* 티켓예매내역 */
	$("#ticket-reserve").click(function() {
		
		displayReserveList(1);
	});
	
	$(".bottom-cont").on('click', '#reserve-page-list a', function(event) {
		event.preventDefault();
		displayReserveList($(this).attr('href'))	// 숫자에 해당하는 화면을 보여주기 위해 조회
	})
	
	/* ajax로 티켓예매내역과 페이징처리를 보여주기 */
	function displayReserveList(pageNo) {
		$(".bottom-cont").empty();
		$.ajax ({
			type:"GET",
			url:"myticketinfo.do",
			data:{cp:pageNo}, 
			/* {userNo=100&concertno=100} */
			dataType:"json",
			success:function(result) {
				console.log(result.pagination);
				var tickets = result.tickets;
				var pagination = result.pagination;
				var ticketHtml = "";
				console.log(tickets);
				if (tickets.length) {
					ticketHtml += '<div class="col-xs-offset-3 col-xs-6">';
					ticketHtml += '		<div class="row">';
					ticketHtml += '			<h3 style="margin-top:40px;font-weight: bold;">예매 내역</h3>';
					ticketHtml += '			<div class="box-cont" style="border:1px solid #eee; height:400px;">';					
					ticketHtml += '					<table style="margin:auto;">';
					ticketHtml += '						<thead style="border-bottom:1px solid #eee;">';
					ticketHtml += '							<tr>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">티켓번호</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">좌석번호</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">구매자</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">콘서트제목</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">티켓구매일</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">공연날짜</th>';
					ticketHtml += '								<th style="padding:20px 20px; text-align:center;">공연시간</th>';	
					ticketHtml += '							</tr>';
					ticketHtml += '						</thead>';
					ticketHtml += '						<tbody>';
					
					$.each(tickets, function(index, item) {
						ticketHtml += '						<tr>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.no+'</td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.seatInfo.seatName+'</td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.user.name+'</td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;"><a href="/jhta/con/detail.do?conNo='+item.concert.no+'">'+item.concert.title+'</a></td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.createDate+'</td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.performance.day+'</td>';
						ticketHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.performance.time+'</td>';
						ticketHtml += '						</tr>';
					})
						ticketHtml += '					</tbody>';
						ticketHtml += '				</table>';
						ticketHtml += '				<div class="row text-center">';
						ticketHtml += '					<div class="col-xs-12">';
						ticketHtml += '						<ul class="pagination" id="reserve-page-list" style="margin: 40px 0;">';
																if(pagination.cp > 1){
						ticketHtml += '								<li><a href="'+(pagination.cp - 1)+'">&laquo;</a></li>';
																}
																for(var num=pagination.beginPageIndex; num<=pagination.endPageIndex; num++) {
																	if (num == pagination.cp) {
						ticketHtml += '									<li class="active"><a href="'+num+'">'+num+'</a></li>';																		
																	} else {
						ticketHtml += '									<li><a href="'+num+'">'+num+'</a></li>';																		
																	}
																}
																if(pagination.cp < pagination.totalBlocks) {
						ticketHtml += '								<li><a href="'+(pagination.cp + 1)+'">&raquo;</a></li>';
																}
						ticketHtml += '						</ul>';
						ticketHtml += '					</div>';
						ticketHtml += '				</div>';
						
					
					ticketHtml += '			</div>';
					ticketHtml += '		</div>';
					ticketHtml += '</div>';	
					$(".bottom-cont").append(ticketHtml);				 
					
				} else {
					ticketHtml += '<div class="col-xs-offset-3 col-xs-6">';
					ticketHtml += '		<div class="row">';
					ticketHtml += '			<h3 style="margin-top:40px;font-weight: bold;">최근 예매 / 취소</h3>';
					ticketHtml += '			<div class="box-cont" style="border:1px solid #eee; height:350px;">';
					ticketHtml += '				<p style="text-align:center; font-size:20px; margin: 150px;">예매확인 / 취소내역이 없습니다.<p>';
					ticketHtml += '			</div>';
					ticketHtml += '		</div>';
					ticketHtml += '</div>';
					$(".bottom-cont").html(ticketHtml);
				}
				
			}
		})
	}
	
	/* 첫 화면 티켓 예매 내역 보여주기 */
	displayReserveList();	
	
	/* 마이픽 - 담은 플래너 보여주기 */
	$("#my-pick").click(function(event) {
		event.preventDefault();
		$(".bottom-cont").empty();
		
		$.ajax ({
			type: "GET",
			url: "mypick.do",
			dataType: "json",
			success: function(result) {
				console.log(result);
				var mypick = result.planners;
				var mypickHtml = "";
				console.log(mypick);
				
				if (result.length) {
					mypickHtml += '<div class="col-xs-offset-3 col-xs-6">';
					mypickHtml += '		<div class="row">';
					mypickHtml += '			<h3 style="margin-top:40px;font-weight: bold;">내가 담은 공연 플래너</h3>';
					mypickHtml += '			<div class="box-cont" style="border:1px solid #eee; height:400px;">';					
					mypickHtml += '					<table style="margin:auto;">';
					mypickHtml += '						<thead style="border-bottom:1px solid #eee;">';
					mypickHtml += '							<tr>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;"></th>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;">공연제목</th>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;">공연가수</th>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;">장르</th>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;">에이전시</th>';
					mypickHtml += '								<th style="padding:20px 20px; text-align:center;" colspan="2">공연날짜</th>';
					mypickHtml += '							</tr>';
					mypickHtml += '						</thead>';
					mypickHtml += '						<tbody>';
					
					$.each(result, function(index, item) {
						mypickHtml += '						<tr>';
						mypickHtml += '							<td style="padding:9px 9px; text-align:center;"><a href="/jhta/art/detail.do?concertno='+item.concert.no+'"><img src="/jhta/resources/images/concerts/'+item.concert.coverImg+'" style="width:50px;height:68px;"></a></td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;"><a href="/jhta/art/detail.do?concertno='+item.concert.no+'">'+item.concert.title+'</a></td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.concert.artist+'</td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;"><a>'+item.concert.genre+'</a></td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.concert.agency+'</td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.concert.openDate+'</td>';
						mypickHtml += '							<td style="padding:10px 10px; text-align:center;">'+item.concert.closeDate+'</td>';
						mypickHtml += '						</tr>';
					})
					mypickHtml += '					</tbody>';
					mypickHtml += '				</table>';
					mypickHtml += '			</div>';
					mypickHtml += '		</div>';
					mypickHtml += '</div>';	
					$(".bottom-cont").append(mypickHtml);				 
					
				} else {
					mypickHtml += '<div class="col-xs-offset-3 col-xs-6">';
					mypickHtml += '		<div class="row">';
					mypickHtml += '			<h3 style="margin-top:40px;font-weight: bold;">공연 플래너</h3>';
					mypickHtml += '			<div class="box-cont" style="border:1px solid #eee; height:350px;">';
					mypickHtml += '				<p style="text-align:center; font-size:20px; margin: 150px;">담은 플래너가 없습니다.<p>';
					mypickHtml += '			</div>';
					mypickHtml += '		</div>';
					mypickHtml += '</div>';
					$(".bottom-cont").html(mypickHtml);
				}
			}
		})
		
	})
	
	
	/* 개인정보 수정하기 */
	$("#my-info-change").click(function(event) {
		$(".bottom-cont").empty();
		var userNo = ${LOGIN_USER.no};
		
		$.ajax ({
			type: "POST",
			url: "myinfo.do",
			/* data: {userNo:userNo}, */
			dataType: "json",
			success: function(result) {
			console.log(result);
			var item = result;
			var myinfoHtml = '<div class="col-xs-offset-3 col-xs-6">';
			
					myinfoHtml += '		<div class="row">';
					myinfoHtml += '			<h3 style="margin-top:30px">개인정보수정</h3>';
					myinfoHtml += '			<form action="myinfo-modify.do" class="form" method="POST">';
					myinfoHtml += '				<fieldset>';
					myinfoHtml += '					<ul>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="id" class="iLabel">아이디</label>';
					myinfoHtml += '							<p class="desc">'+item.id+'</p>';
					myinfoHtml += '						</li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="password" class="iLabel">비밀번호</label>';
					myinfoHtml += '							<input type="password" name="password" id="password5" class="iText" oninput="pwdchk()"/>';
					myinfoHtml += '							<span class="desc"><em>(소문자,특수문자/숫자, 8~16자)</em>로 구성해 주세요.</span>';
					myinfoHtml += '						</li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="password2" class="iLabel">비밀번호 확인</label>';
					myinfoHtml += '							<input type="password" name="password2"  id="password2" class="iText" oninput="pwdchk()"/>';
					myinfoHtml += '							<span style="display: block" id="pwd-messge"></span> ';
					myinfoHtml += '							<span class="desc">비밀번호를 한 번 더 입력해 주세요.</span></li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="name" class="iLabel">이름</label>';
					myinfoHtml += '							<input name="name" type="text"  class="iText"/>';
					myinfoHtml += '							<span class="desc"><em>2~10자</em>로 구성해 주세요.</span>';
					myinfoHtml += '						</li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="nick" class="iLabel">닉네임</label>';
					myinfoHtml += '							<input name="nickname" type="text" class="iText"/>';
					myinfoHtml += '							<span class="desc"><em>2~10자</em>로 구성해 주세요.</span>';
					myinfoHtml += '						</li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label class="iLabel">성별</label>';
					myinfoHtml += '							<input name="gender" type="radio" value="M" id="geder_m" class="iRadio" checked="checked"> ';
					myinfoHtml += '							<label for="gender">남자</label>';
					myinfoHtml += '							<input name="gender" type="radio" id="gender_w" value="W" class="iRadio">';
					myinfoHtml += '							<label for="gender">여자</label>';
					myinfoHtml += '						</li>';
					myinfoHtml += '						<li>';
					myinfoHtml += '							<label for="birthday" class="iLabel">생일</label>';
					myinfoHtml += '							<input name="birthday" type="text"  class="iText" />';
					myinfoHtml += '							<span class="desc"><em>YYYY-MM-DD</em>로 입력하시오</span>';
					myinfoHtml += '						</li>';
					myinfoHtml += '					<ul>';
					myinfoHtml += '				</fieldset>';
					myinfoHtml += '				<div class="btnArea">';
					myinfoHtml += '					<span class="btnRegist strong" style="width: 50px; height: 50px;">';
					myinfoHtml += '					<input name="" type="submit" value="수정하기" id="btnSend"></span>';
					myinfoHtml += '				</div>';
					myinfoHtml += '			</form>';
					myinfoHtml += '		</div>';
				
				myinfoHtml += "</div>";
				$('.bottom-cont').html(myinfoHtml);
			}
		}); 
	})
	
	/* 회원탈퇴 버튼 동작 */
	$("#withdrawal").click(function() {
		$(".bottom-cont").empty();
		
		$.ajax({
			type:"GET",
			url:"mywithraw.do",
			data:{userAvail:"Y"},
			/* dataType:"json", */
			success:function(result) {
				console.log(result);
				var withrawHtml = '<div class="col-xs-offset-3 col-xs-6">';
		
					withrawHtml +='		<div class="row">';
					withrawHtml +='			<div class="box-cont" style="border:1px solid #eee; height:350px; margin-top:50px;">';
					withrawHtml +='				<p style="text-align: center; font-size: 19px; margin: 130px auto 15px;">한번 회원탈퇴 하시면 복구하기 어렵습니다. 그래도 회원탈퇴를 하시겠습니까?</p>';
					withrawHtml +='				<a href="#" id="withraw" type="button" class="btn btn-danger" style="margin: auto 460px; padding: 15px;">회원탈퇴</a>';
					withrawHtml +='			</div>';
					withrawHtml +='		</div>';					
					withrawHtml +='</div>';
				
				$(".bottom-cont").append(withrawHtml);
			}			
		})	
	}) 
	
		/* function withrawbutton() {
			if (!confirm("해제하시겠습니까?")) {
				return false;
			}
		} */

});
</script>
</html>