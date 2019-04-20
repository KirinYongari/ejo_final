<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공연 등록</title>
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
		<li>공연 관리</li>
	</ol>
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-8">
			<h3>공연 수정</h3>
			<div class="panel panel-info">
				<div class="panel-heading">공연 수정</div>
				<form method="post" action="modifyperf.do" id="register-form">
				<input type="hidden" id="concert-no" name="concNo" value="${performance.concert.no }" />
				<input type="hidden" id="time" name="time" value="${performance.time }" />
				<div class="panel-body">
						<div class="form-group">
							<label for="no">공연 등록번호</label>
							<input type="text" class="form-control" id="no" name="no" maxlength="10" value="${performance.no }" readonly />
						</div>
						<div class="form-group">
							<label for="title">콘서트 타이틀</label>
							<input type="text" class="form-control" id="concert-title" name="concertTitle" value="${performance.concert.title }" readonly />
						</div>
						<div class="form-group">
							<label for="day">공연날짜</label>
						<div class="row">
							<div class="col-xs-6">
								<input type="date" class="form-control" id="day" name="day" value="<fmt:formatDate value="${performance.day }" pattern="yyyy-MM-dd" />" />
							</div>
							<div class="col-xs-3">
								<select class="form-control" id="time-hour" name="timeHour">
									<option value=""> 시각
								<c:forEach var="i" begin="0" end="23" step="1">
									<option value="<fmt:formatNumber type="number" pattern="00" value="${i }" />" ${performance.time.substring(0,2) == i?"selected":"" }> <fmt:formatNumber type="number" pattern="00" value="${i }" /> 시
								</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<select class="form-control" id="time-minute" name="timeMinute">
									<option value=""> 분
								<c:forEach var="i" begin="0" end="55" step="5">
									<option value="<fmt:formatNumber type="number" pattern="00" value="${i }" />" ${performance.time.substring(3,5) == i?"selected":"" }> <fmt:formatNumber type="number" pattern="00" value="${i }" /> 분
								</c:forEach>
								</select>
							</div>
						</div>
						</div>
						<div class="form-group">
							<label for="hall">공연장</label>
							<select class="form-control" id="hall" name="hallNo">
								<option value=""> 선택</option>
							<c:forEach var="hall" items="${halls }">
								<option value="${hall.no }"  ${performance.hall.no == hall.no?"selected":"" }> ${hall.name }</option>
							</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="seatnumber">좌석수</label>
							<input type="text" class="form-control" id="seatnumber" name="restSeatCount" maxlength="5" value="${performance.hall.seatNumber }" readonly />
						</div>
					</div>
					<div class="panel-footer">
						<div class="text-right">
							<input type="reset" class="btn btn-default" value="복원" />&nbsp;&nbsp;&nbsp;&nbsp;
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
	
	$('#hall').change(function() {
		var no = $('#hall').val();
		$.ajax({
			type: 'POST',
			url: 'showseatnumber.do',
			data: {hallNo:no},
			dataType: 'json',
			success: function(hall) {
				$('#seatnumber').val(hall.seatNumber);
			}
		});
	});
	
	$('#register-form').submit(function() {
		
		if (!$('#day').val()) {
			alert('공연 날짜를 입력하세요.');
			$('#day').focus();
			return false;
		}
		
		if (!$('#day').val()) {
			alert('공연 날짜를 입력하세요.');
			$('#day').focus();
			return false;
		}
		
		if (!$('#time-hour').val()) {
			alert('공연 시각을 입력하세요.');
			$('#time-hour').focus();
			return false;
		}
		
		if (!$('#time-minute').val()) {
			alert('공연 분을 입력하세요.');
			$('#time-minute').focus();
			return false;
		}
		
		if (!$('#hall').val()) {
			alert('공연장을 선택하세요.');
			$('#hall').focus();
			return false;
		}
		
		$('#time').val($('#time-hour').val() +':'+ $('#time-minute').val());
		return true;
	});
	
});

</script>
</body>
</html>