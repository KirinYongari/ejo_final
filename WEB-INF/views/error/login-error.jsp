2<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $(function(){
	 $("#btn-login").click(function(){
		location.href = "user/login.do";	 
	 });
 });

</script>
<title></title>

</head>
<body>
	<div class="container">
       <h1>로그인 에러</h1>
		<p>
			아아디 혹은 비밀번호가 올바르지 않습니다
			<button id="btn-login">로그인 페이지로 이동</button>
		</p>
	</div>
</body>
</html>

