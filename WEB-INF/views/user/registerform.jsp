<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	
<!-- <link href="../resources/css/nav.css" rel="stylesheet"> -->
<link href="../resources/css/user/mwLogin.css" rel="stylesheet">
<link href="../resources/css/user/registration.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../resources/bootstrap/js/bootstrap.min.js"></script>
<script src="../resources/js/nav.js"></script>
<script src="../resources/js/user/mwLogin.js"></script>
<script src="../resources/js/user/registration.js"></script>
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
<title></title>
</head>
<body>
<%@ include file="../include/main-nav.jsp"%>
	<div class="container">
		<h1>회원가입</h1>
		<form:form action="register.do" class="form" method="post" modelAttribute="userform">
			<fieldset>
				<legend>
					<span class="icon">&raquo;</span> 필수 입력 정보
				</legend>
				<ul>
					<li>
						<label for="id" class="iLabel">아이디</label> 
						<form:input id="id" type="text" path="id" class="iText" oninput="chkMbId()" autocomplete="off"/> 
						<form:errors path="id" cssClass="error"></form:errors>
						<!-- <span class="btnRegist"><a href="#">중복확인</a></span> <span style="display: block" id="messge"></span> -->
						<span  style="display:block" id="messge"></span>
						<p class="desc">
							<em>4글자 </em> 이상으로 구성되어야합니다.
						</p>
					</li>
					<li>
						<label for="password" class="iLabel">비밀번호</label> 
						<form:input type="password" path="password" id="password5" class="iText" oninput="pwdchk()"/>
						<form:errors path="password" cssClass="error"></form:errors>
						<span class="desc"><em>(소문자,특수문자/숫자, 8~16자)</em>로 구성해 주세요.</span>
					</li>
					<li>
						<label for="password2" class="iLabel">비밀번호 확인</label> 
						<input type="password" name="password2"  id="password2" class="iText" oninput="pwdchk()"/>
						<span style="display: block" id="pwd-messge"></span> 
						<span class="desc">비밀번호를 한 번 더 입력해 주세요.</span></li>
					<li>
						<label for="name" class="iLabel">이름</label> 
						<form:input  path="name" type="text"  class="iText"/>
						<form:errors path="name" cssClass="error"></form:errors> 
						<span class="desc"><em>2~10자</em>로 구성해 주세요.</span>
					</li>
					<li>
						<label for="nick" class="iLabel">닉네임</label> 
						<form:input  path="nickname" type="text" class="iText"/>
						<form:errors path="nickname" cssClass="error"></form:errors>  
						<span class="desc"><em>2~10자</em>로 구성해 주세요.</span>
					</li>
					
					<li>
						<input name="gender" type="radio" value="M" id="geder_m" class="iRadio" checked="checked"> 
								<label for="gender">남자</label> 
						<input name="gender" type="radio" id="gender_w" value="W" class="iRadio">
								<label for="gender">여지</label>
					
					</li>
					
					
					<li>
						<label for="birthday" class="iLabel">생일</label>
						<form:input  path="birthday" type="text"  class="iText" />
						<form:errors path="birthday" cssClass="error"></form:errors>
						<span class="desc"><em>YYYY-MM-DD</em>로 입력하시오</span>
					</li>
					
				</ul>
			</fieldset>
			<fieldset>
				<legend>
					<span class="icon">&raquo;</span> 선택 입력 정보
				</legend>
				<ul>
					<li>
						<p class="question">이름과 닉네임 가운데 무엇으로 활동하시겠습니까?</p>
						<p class="answer">
							<input name="authorName" type="radio" value="name" id="useName" class="iRadio" checked="checked"> 
								<label for="useName">이름</label> 
							<input name="authorName" type="radio" id="useNick" value="nick" class="iRadio">
								<label for="useNick">닉네임</label>
						</p>
					</li>
					<!-- 
					<li>
						<label for="profile" class="tLabel">프로필 사진 :</label> 
						<input name="" type="file" id="profile" class="iFile"> 
						<span class="desc">권장 이미지 크기는 가로 80px 세로 80px 입니다.</span>
					</li> 
					-->
					
					
					
					
					<li>
						<strong class="tLabel">관심분야 :</strong> 
						<input name="interest" type="checkbox" id="interest1" class="iCheck"> 
						<label for="interest1">콘서트</label> 
						<input name="interest" type="checkbox" id="interest2" class="iCheck"> 
						<label for="interest2">연극</label>
						<input name="interest" type="checkbox" id="interest3" class="iCheck">
						<label for="interest3">뮤지컬</label> 
						<input name="interest" type="checkbox" id="interest4" class="iCheck"> 
						<label for="interest4">아트</label>
						<input name="interest" type="checkbox" id="interest5" class="iCheck">
						<label for="interest5">...</label>
					</li>
					<!--
				 	<li>
						<strong class="tLabel">메일수신 :</strong> 
						<input name="" type="checkbox" id="optin" class="iCheck"> 
						<label for="optin">체크하면 공지 메일을 받습니다.</label>
					</li> 
					-->
				</ul>
			</fieldset>
			<div class="btnArea">
				<span class="btnRegist strong" style="width: 50px; height: 50px;">
				<input name="" type="submit" value="등록" id="btnSend"></span>
			</div>
		</form:form>
	</div>

<%@ include file="../include/footer.jsp" %>
</body>
</html>