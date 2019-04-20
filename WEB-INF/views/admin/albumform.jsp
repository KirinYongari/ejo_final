<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>음악 등록</title>
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
		<li>앨범 관리</li>
	</ol>		
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-8">
			<h3>앨범 등록</h3>
			<div class="panel panel-info">
				<div class="panel-heading">앨범 등록</div>
				<form method="post" action="regalbum.do" id="register-form" enctype="multipart/form-data">
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
							<label for="cover-img">커버 이미지</label>
							<input type="file" class="form-control" id="cover-img" name="coverImg" accept="image/*" />
						</div>
						<div class="form-group">
							<label for="year">발매년도</label>
							<input type="text" class="form-control" id="year" name="year" placeholder="발매년도 (숫자)" maxlength="4" />
						</div>
						<div class="form-group">
							<label for="artist">장르</label>
							<input type="text" class="form-control" id="genre" name="genre" placeholder="장르" maxlength="50" />
						</div>
						
					</div>
					<div class="panel-footer">
						<div class="text-right">
							<input type="reset" class="btn btn-default" value="새로 입력" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" class="btn btn-primary" value="음악 등록" />
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
		
		if (!$('#title').val()) {
			alert('타이틀을 입력하세요.');
			$('#title').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#artist').val()) {
			alert('아티스트를 입력하세요.');
			$('#artist').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#year').val() || !check_number($('#year').val())) {
			alert('앨범의 발매년도를 입력하세요.');
			$('#year').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#genre').val()) {
			alert('앨범의 장르를 입력하세요.');
			$('#genre').focus().parents('.form-group').addClass("has-error");
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