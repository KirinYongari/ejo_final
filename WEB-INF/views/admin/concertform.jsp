<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>콘서트 등록</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<%@ include file="adminheader.jsp" %>	
	<ol class="breadcrumb" style="background-color:white;">
		<li><a href="/jhta/home.do">Home</a></li>
		<li>관리자</li>
		<li>콘서트 관리</li>
	</ol>
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-8">
			<h3>콘서트 등록</h3>
			<div class="panel panel-info">
				<div class="panel-heading">콘서트 등록</div>
				<form method="post" action="regconcert.do" id="register-form" enctype="multipart/form-data">
				<div class="panel-body">
						<div class="form-group">
							<label for="title">타이틀</label>
							<input type="text" class="form-control" id="title" name="title" placeholder="타이틀" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="artist">아티스트</label>
							<input type="text" class="form-control" id="artist" name="artist" placeholder="아티스트" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="agency">기획사</label>
							<input type="text" class="form-control" id="agency" name="agency" placeholder="기획사" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="genre">장르</label>
							<input type="text" class="form-control" id="genre" name="genre" placeholder="장르" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="content">설명 내용</label>
							<input type="text" class="form-control" id="content" name="content" placeholder="내용" maxlength="100" />
						</div>
						<div class="form-group" id="cover-div">
							<label for="cover-img">커버 이미지</label>
							<input type="file" class="form-control" id="cover-img" name="coverImageFile" accept="image/*" />
						</div>
						<div class="form-group" id="content-div">
							<label for="content-img">상세 이미지</label>
							<input type="file" class="form-control" id="content-img" name="descImageFile" accept="image/*" />
						</div>
						<div class="row" id="concert-day">
							<div class="col-xs-6">
						<div class="form-group">
							<label for="concert-start">콘서트 시작일</label>
							<input type="date" class="form-control" id="concert-start" name="openDate" />
						</div>
							
							</div>
							<div class="col-xs-6">
						<div class="form-group">
							<label for="concert-end">콘서트 종료일</label>
							<input type="date" class="form-control" id="concert-end" name="closeDate" />
						</div>
							
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6" id="ticket-day">
						<div class="form-group">
							<label for="ticket-start">티켓판매 시작일</label>
							<input type="date" class="form-control" id="ticket-start" name="ticketOpenDate" />
						</div>
							
							</div>
							<div class="col-xs-6">
						<div class="form-group">
							<label for="ticket-end">티켓판매 종료일</label>
							<input type="date" class="form-control" id="ticket-end" name="ticketCloseDate" />
						</div>
							
							</div>
						</div>
						<div class="form-group">
							<label for="price">판매가</label>
							<input type="text" class="form-control" id="price" name="price" placeholder="금액 (숫자)" maxlength="10" />
						</div>
						<div class="form-group">
							<label for="cate-no1" class="radio-inline"><input type="radio" id="cate-no1" name="cateNo" value="1" /> 콘서트</label>
							<label for="cate-no2" class="radio-inline"><input type="radio" id="cate-no2" name="cateNo" value="2" /> 연극</label>
						</div>
						
					</div>
					<div class="panel-footer">
						<div class="text-right">
							<input type="reset" class="btn btn-default" value="새로 입력" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" class="btn btn-primary" value="공연 등록" />
						</div>
				
					</div>
				</form>
			</div>
		</div> 
	</div>
<%@ include file="adminfooter.jsp" %>
</div>

<script type="text/javascript">
$(function() {
	
	$('#titlee').blur(function() {
		if ($('#title').val().length < 2) {
			$('#error-title').text('타이틀을 2자 이상 입력하세요.').attr('style', 'color:red');
		}
	});
	$('#titlee').change(function() {
		$('#error-title').text('&nbsp;');
	});
	
	$(".form-control").keydown(function() {
		$(this).parents('.form-group').removeClass('has-error');
	})
	
	$('#register-form').submit(function() {
		
		if ($('#title').val().length < 2) {
			alert('타이틀을 입력하세요.');
			$('#title').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if ($('#artist').val().length < 1) {
			alert('아티스트를 입력하세요.');
			$('#artist').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if ($('#agency').val().length < 1) {
			alert('기획사를 입력하세요.');
			$('#agency').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if ($('#genre').val().length < 1) {
			alert('장르를 입력하세요.');
			$('#genre').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if ($('#content').val().length < 1) {
			alert('콘서트 설명을 입력하세요.');
			$('#content').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#cover-img').val()) {
			alert('커버 이미지를 등록하세요.');
			$('#cover-img').focus();
			return false;
		}
		
		if (!$('#content-img').val()) {
			alert('상세 이미지를 등록하세요.');
			$('#content-div').focus();
			return false;
		}
		
		if (!$('#concert-start').val()) {
			alert('콘서트 시작일을 등록하세요.');
			$('#concert-day').focus();
			return false;
		}
		
		if (!$('#concert-end').val()) {
			alert('콘서트 종료일을 등록하세요.');
			$('#concert-day').focus();
			return false;
		}
		
		if ($('#concert-end').val() < $('#concert-start').val()) {
			alert('콘서트 종료일은 시작일 이전일 수 없습니다.');
			$('#concert-day').focus();
			return false;
		}
		
		if (!$('#ticket-start').val()) {
			alert('티켓 판매 시작일을 등록하세요.');
			$('#ticket-day').focus();
			return false;
		}
		
		if ($('#ticket-start').val() > $('#concert-start').val()) {
			alert('티켓 판매 시작일은 콘서트 시작일 이전이어야 합니다.');
			$('#ticket-day').focus();
			return false;
		}
		
		if (!$('#ticket-end').val()) {
			alert('티켓 판매 종료일을 등록하세요.');
			$('#ticket-day').focus();
			return false;
		}
		
		if ($('#ticket-end').val() > $('#concert-end').val()) {
			alert('티켓 판매 종료일은 콘서트 종료일 이전이어야 합니다.');
			$('#ticket-day').focus();
			return false;
		}
		
		if ($('#ticket-end').val() < $('#ticket-start').val()) {
			alert('티켓 판매 종료일은 시작일 이전일 수 없습니다.');
			$('#concert-day').focus();
			return false;
		}
		
		if (!$('#price').val() || !check_number($('#price').val())) {
			alert('티켓 판매 가격을 입력하세요. (숫자)');
			$('#price').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#cate-no1').is(':checked') && !$('#cate-no1').is(':checked')) {
			alert('콘서트 / 연극 중 하나를 선택하세요.');
			$('#cate-no1').focus();
			return false;
		}
	});
	
});
	
	function check_number(value) {
		var regex=/^[0-9]+$/;
	    return (value != '' && value != 'undefined' && regex.test(value));
	}

</script>
</body>
</html>