<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>관리자 메인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<%@ include file="adminheader.jsp" %>
	<div class="row">
	<ol class="breadcrumb" style="background-color:white;">
		<li><a href="/jhta/home.do">Home</a></li>
		<li>관리자</li>
	</ol>		
		<div class="col-xs-offset-1 col-xs-3">
			<div class="well">
				<h4>콘서트 관리</h4>
				<p>현재 등록된 콘서트 수: ${concertCount }</p>
				<a href="managecon.do" class="btn btn-primary">콘서트 관리</a>
			</div>
		</div>
		<div class="col-xs-offset-1 col-xs-3">
			<div class="well">
				<h4>앨범 관리</h4>
				<p>현재 등록된 앨범 수: ${albumCount }</p>
				<a href="managealbum.do" class="btn btn-primary">앨범 관리</a>
			</div>
		</div>
		<div class="col-xs-offset-1 col-xs-3">
			<div class="well">
				<h4>회원 관리</h4>
				<p>현재 등록된 회원 수: ${userCount }</p>
				<a href="manageuser.do" class="btn btn-primary">회원 관리</a>
			</div>
		</div>
	</div>
<%@ include file="adminfooter.jsp" %>
</div>

</body>
</html>