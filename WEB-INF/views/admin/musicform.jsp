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
		<li>음악 관리</li>
	</ol>
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-8">
			<h3>음악 등록</h3>
			<div class="panel panel-info">
				<div class="panel-heading">음악 등록</div>
				<form method="post" action="regmusic.do" id="register-form" enctype="multipart/form-data">
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
							<label for="lyricist">작사가</label>
							<input type="text" class="form-control" id="lyricist" name="lyricist" placeholder="작사가" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="composer">작곡가</label>
							<input type="text" class="form-control" id="composer" name="composer" placeholder="작곡가" maxlength="50" />
						</div>
						<div class="form-group">
							<label for="length">곡 길이</label>
							<input type="text" class="form-control" id="length" name="lengths" placeholder="분:초" maxlength="6" />
						</div>
						<div class="form-group">
							<label for="years">발표년도</label>
							<input type="text" class="form-control" id="years" name="years" placeholder="발표년도 (숫자)" maxlength="4" />
						</div>
						<div class="form-group">
							<label for="cover-img">커버 이미지</label>
							<input type="file" class="form-control" id="cover-img" name="coverImage" accept="image/*" />
						</div>
						<div class="form-group">
							<label for="filename">재생파일</label>
							<input type="file" class="form-control" id="filename" name="musicfile" accept="audio/*" />
						</div>
						<div class="form-group">
							<label for="movie">무비클립</label>
							<input type="file" class="form-control" id="movie" name="movie" accept="video/*" />
						</div>
						<div class="form-group">
							<label for="album-no">앨범번호</label>
							<input type="text" class="form-control" id="album-no" name="albumNo" placeholder="아티스트" maxlength="50" value="${empty albumNo?'':albumNo }" />
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
		
		if (!$('#lyricist').val()) {
			alert('작사가를 입력하세요.');
			$('#lyricist').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#composer').val()) {
			alert('작곡가를 입력하세요.');
			$('#composer').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#length').val()) {
			alert('음악 길이를 입력하세요.');
			$('#length').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#years').val() || !check_number($('#years').val())) {
			alert('음악의 발표 년도를 입력하세요.');
			$('#years').focus().parents('.form-group').addClass("has-error");
			return false;
		}
		
		if (!$('#album-no').val()) {
			alert('음악이 들어있는 앨범을 입력하세요.');
			$('#album-no').focus().parents('.form-group').addClass("has-error");
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