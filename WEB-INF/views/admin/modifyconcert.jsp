<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>콘서트 정보 수정</title>
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
			<h3>콘서트 정보 수정</h3>
			<div class="panel panel-info">
				<div class="panel-heading">콘서트 정보 수정</div>
				<form method="post" action="modifycon.do" id="register-form" enctype="multipart/form-data">
				<div class="panel-body">
						<div class="form-group">
							<label for="no">콘서트 등록번호</label>
							<input type="text" class="form-control" id="no" name="no" maxlength="10" value="${concert.no }" readonly />
						</div>
						<div class="form-group">
							<label for="title">타이틀</label>
							<input type="text" class="form-control" id="title" name="title" placeholder="타이틀" maxlength="50" value="${concert.title }" />
						</div>
						<div class="form-group">
							<label for="artist">아티스트</label>
							<input type="text" class="form-control" id="artist" name="artist" placeholder="아티스트" maxlength="50" value="${concert.artist }" />
						</div>
						<div class="form-group">
							<label for="agency">기획사</label>
							<input type="text" class="form-control" id="agency" name="agency" placeholder="기획사" maxlength="50" value="${concert.agency }" />
						</div>
						<div class="form-group">
							<label for="genre">장르</label>
							<input type="text" class="form-control" id="genre" name="genre" placeholder="장르" maxlength="50" value="${concert.genre }" />
						</div>
						<div class="form-group">
							<label for="content">설명 내용</label>
							<input type="text" class="form-control" id="content" name="content" placeholder="내용" maxlength="100" value="${concert.content }" />
						</div>
						<div class="form-group">
							<label for="cover-img">커버 이미지</label>
							${concert.coverImg }<input type="file" class="form-control" id="cover-img" name="coverImageFile" />
						</div>
						<div class="form-group">
							<label for="content-img">상세 이미지</label>
							${concert.contentImg }<input type="file" class="form-control" id="content-img" name="descImageFile" />
						</div>
						<div class="row">
							<div class="col-xs-6">
						<div class="form-group">
							<label for="ticket-start">티켓판매 시작일</label>
							<input type="date" class="form-control" id="ticket-start" name="ticketOpenDate" value="<fmt:formatDate value="${concert.ticketOpenDate }" pattern="yyyy-MM-dd" />" />
						</div>
							
							</div>
							<div class="col-xs-6">
						<div class="form-group">
							<label for="ticket-end">티켓판매 종료일</label>
							<input type="date" class="form-control" id="ticket-end" name="ticketCloseDate" value="<fmt:formatDate value="${concert.ticketCloseDate }" pattern="yyyy-MM-dd" />" />
						</div>
							
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6">
						<div class="form-group">
							<label for="concert-start">콘서트 시작일</label>
							<input type="date" class="form-control" id="concert-start" name="openDate" value="<fmt:formatDate value="${concert.openDate }" pattern="yyyy-MM-dd" />" />
						</div>
							
							</div>
							<div class="col-xs-6">
						<div class="form-group">
							<label for="concert-end">콘서트 종료일</label>
							<input type="date" class="form-control" id="concert-end" name="closeDate" value="<fmt:formatDate value="${concert.closeDate }" pattern="yyyy-MM-dd" />" />
						</div>
							
							</div>
						</div>
						<div class="form-group">
							<label for="price">판매가</label>
							<input type="text" class="form-control" id="price" name="price" placeholder="금액 (숫자)" maxlength="10" value="${concert.price }" />
						</div>
						<div class="form-group">
							<label for="cate-no1" class="radio-inline"><input type="radio" id="cate-no1" name="cateNo" value="1" ${concert.category.no=="1"?"checked":"" } /> 콘서트</label>
							<label for="cate-no2" class="radio-inline"><input type="radio" id="cate-no2" name="cateNo" value="2" ${concert.category.no=="2"?"checked":"" } /> 연극</label>
						</div>
						<div class="form-group">
							<label for="available-y" class="radio-inline"><input type="radio" id="available-y" name="available" value="Y" ${concert.available=="Y"?"checked":"" } /> 공개</label>
							<label for="available-n" class="radio-inline"><input type="radio" id="available-n" name="available" value="N" ${concert.available=="N"?"checked":"" } /> 비공개</label>
						</div>
						
					</div>
					<div class="panel-footer">
						<div class="text-right">
							<input type="reset" class="btn btn-default" value="복원" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" class="btn btn-primary" value="공연 수정" />
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
		
		if (!$('#ticket-end').val()) {
			alert('티켓 판매 종료일을 등록하세요.');
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