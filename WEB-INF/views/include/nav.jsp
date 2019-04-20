<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<div class="header_wrap">
    <div class="main_header">
      <div class="util_menu">
        <div class="top_left"><a href="" class="btn_gnb btn_g_link1"><span>멜론</span></a> </div>
        <div class="top_right">
          <ul>
          <c:choose>
          	<c:when test="${empty LOGIN_USER}">
            <li><span class="border-type"><a href="#login" id="loginAnchor" class="loginTrigger btn_gnb btn_g_login" accesskey="L"
			title="Accesskey(L)">로그인</a></span></li>     
          	</c:when>
			<c:otherwise>
	         	<li><span class="border-type"><a href="/jhta/user/logout.do" class="btn_gnb">로그아웃</a></span></li>				
			</c:otherwise>          		
          </c:choose>
            <li><span class="border-type"><a href="/jhta/user/registerform.do" class="btn_gnb btn_g_join">회원가입</a></span></li>
          </ul>
        </div>
      </div>
      <h1 class="logo"><a>로그</a></h1>
      <div class="srch_set">
        검색
      </div>
      <div class="etc_banner">배너이미지 </div>
    </div>

  </div>
<div class="menubar">
<ul>
 <li><a href="#" style="margin-left:275px">콘서트</a>
  <ul>
    <li>
      <div class="first-content">콘서트
      <hr>

        <div class="list-content">
          <table class="first-table">
           <colgroup>
             <col width="10%">
             <col width="10%">
           </colgroup>
           <tbody>
             <tr>
               <td>발라드</td>
               <td>내한공연</td>
             </tr>
             <tr>
               <td>발라드</td>
               <td>내한공연</td>
             </tr>
             <tr>
               <td>발라드</td>
               <td>내한공연</td>
             </tr>

             <tr>

             </tr>
             </tbody>
           </table>
           <span>티켓오픈공지</span>
           <span>지역별/날짜별</span>
        </div>
      </div>

      <div class="second-content">
          <div class="depth">
           <div>콘서트 추천</div>
           <div class="images" style="margin-left:21px;">
             <img src="resources/images/nav/img_avatar.png" >
             <img src="resources/images/nav/img_avatar.png" >
             <img src="resources/images/nav/img_avatar.png" >
              <img src="resources/images/nav/img_avatar.png" >
              <img src="resources/images/nav/img_avatar.png" >
              <img src="resources/images/nav/img_avatar.png" >
              <img src="resources/images/nav/img_avatar.png" >
           </div>
         </div>

      </div>
    </li>
  </ul>
 </li>
 <li><a href="#" id="current">연극</a>
	<ul>
     <li><a href="#">Sliders</a></li>
    </ul>
 </li>
 <li><a href="#">테마</a>
   <ul>
    <li><a href="#"></a></li>
  </ul>

 </li>
 <li><a href="#">랭킹</a></li>
  <li><a href="#">티켓오픈공지</a></li>
  <li style="margin-left:481px"><a href="#">For U</a></li>
  <li><a href="#">마이티켓</a></li>
</ul>
</div>

	<p>
		
	</p>
	<div class="mwLogin">
		<div class="bg"></div>
		<div id="login" class="gLogin">
			<a href="#loginAnchor" class="close" title="로그인 레이어 닫기">X</a>
			<form action="" method="post" id="gLogin" class="gLogin">
				<fieldset>
					<legend>Login</legend>
					<div class="item">
						<label for="userid" class="iLabel">ID</label><input name="userid"
							type="text" value="" id="userid" class="iText uid" />
					</div>
					<div class="item">
						<label for="pwd" class="iLabel">PASSWORD</label><input name="pwd"
							type="password" value="" id="pwd" class="iText upw" />
					</div>
					<p class="keeping">
						<input type="checkbox" value="Y" name="autoLogin" class="iCheck" id="keepid1" />
						<label for="autoLogin">로그인 유지</label> 
						
						<input  type="checkbox" value="Y" name="autoId" class="iCheck" id="keepid2" />
						<label for="autoId">아이디 기억하기</label>
						
						<span class=""><input name="" type="submit" id="btn-submit" class="ejobtn ejobtn-success"
						value="로그인" />
						<input type="button" class="btn btn-default" value="취소" onClick="location.href='/jhta/home.do'">
						</span>
					</p>
					<p class="warning">브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다. 로그인 유지 기능을
						사용할 경우 다음 접속부터는 로그인을 하실 필요가 없습니다. 단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가
						유출될 수 있으니 꼭 로그아웃을 해주세요.</p>
					
					<ul class="help">
						<li class="first"><a href="#">아이디/비밀번호 찾기</a></li>
						<li><a href="/jhta/user/registerform.do">회원 가입</a></li>
						
					</ul>
				</fieldset>
			</form>
			<form action="" id="oLogin" class="oLogin">
				<fieldset>
					<legend>Open ID Login</legend>
					<div class="item">
						<label for="oid" class="iLabel">Open ID</label><input name=""
							type="text" value="" id="oid" class="iText oid" />
					</div>
					<span class="btnLogin"><input name="" type="submit"
						value="로그인" /></span>
					<p class="help">
						<a href="#gLogin" class="gAnchor">일반 아이디 로그인</a>
					</p>
				</fieldset>
			</form>
			<a href="#loginAnchor" class="close" title="로그인 레이어 닫기">X</a>
		</div>
	</div>




