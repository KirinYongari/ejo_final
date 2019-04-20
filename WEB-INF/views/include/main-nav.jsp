<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/resource.jsp" %>
<link href="/jhta/resources/css/main/main-nav.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<style>
#modal-ajax {
	width: 800px;
    padding-bottom: 15px;
    border-radius: 0;
    border: none;
    background-color: rgba(0, 0, 0, 0);    
    font-size: 48px!important; 
    margin-left:-100px;
    margin-top: 30px!important;
}
.modal-footer > span.text {
	display: block;
	font-size: 25px;
}
.modal-footer {
	background-color: ;
}
.modal-content {
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0);
}

</style>
<script type="text/javascript">
$(function() {
	
	$("#modal-search-text").keyup(function() {
		
		var keywordText = $(this).val();
		if (!keywordText) {
			$("#modal-ajax").empty();
			return;
		}
		
		$.ajax({
			type:"get",
			url: "search/modalSearch.do",
			dataType:"json",
			data:{keyword:keywordText},
			success: function(result){
				console.log(result);
				$("#modal-ajax").empty();
				var concerts = result.concerts;
				var albums = result.albums;
				var html = "";
				/* 콘서트찾기 */
				if(concerts.length){
					$.each(concerts, function(index, item){
						html += '<div class="ajax-body" style="width:800px; height: 280px; margin-top: 20px; border-bottom:1px solid white;">'
						html += '	<div class="col-xs-3">'
						/* 콘서트일 경우 경로 */
						if(item.category.no == 1){
						html += '		<a href="/jhta/con/detail.do?conNo='+item.no+'"><img src="/jhta/resources/images/concerts/'+item.coverImg+'"style="width:170px; height:250px;"></a>'							
						}
						/* 공연일 경우 경로 */
						else {
						html += '		<a href="/jhta/art/detail.do?concertno='+item.no+'"><img src="/jhta/resources/images/concerts/'+item.coverImg+'"style="width:170px; height:250px;"></a>'
						}
						html += '	</div>'
						html += '	<div class="col-xs-8 text-left" >'
						html += '		<a href="/jhta/con/detail.do?conNo='+item.no+'"><span class="text" style="color:white; font-size:23px;">'+item.title+'</span></a></br>'
						html += '		<span class="text" style="color:white; font-size:16px;">일정_'+item.openDate+' ~ '+item.closeDate+'</span></br>'
						html += '		<span class="text" style="color:white; font-size:16px;">입장료_'+item.price+'원</span>'
						html += '	</div>'
						html += '</div>'
					});	
					$("#modal-ajax").append(html);
				}
				
				/* 앨범찾기 */
				if(albums.length){
					$.each(albums, function(index, item){
						html += '<div class="ajax-body" style="width:800px; height: 200px; margin-top: 20px; border-bottom:1px solid white;">'
						html += '	<div class="col-xs-3">'
						html += '		<a href="/jhta/music/form.do"><img src="/jhta/resources/images/album/'+item.coverImg+'"style="width:170px; height:170px;"></a>'
						html += '	</div>'
						html += '	<div class="col-xs-8 text-left" style="margin: -25px 25px 0 0;">'
						html += '		<a href="/jhta/music/form.do"><span class="text" style="color:white; font-size:23px;">타이틀 '+item.title+'</span></a></br>'
						html += '		<span class="text" style="color:white; font-size:17px;">아티스트 '+item.artist+'</span></br>'
						html += '		<span class="text" style="color:white; font-size:17px;">발매일 '+item.year+'</span>'
						html += '	</div>'
						html += '</div>'
					});	
					$("#modal-ajax").append(html);
				}
				
			}
			
		})		
 		
	})
})



</script>    
<div class="navbar">
    <div class="navbarup-border">    
    <div class="navbarup navbar-right">
        <ul class="navup navbar-nav">
        <c:choose>
        	<c:when test="${empty LOGIN_USER }">
            <li><span class="border-type"><a id="loginAnchor" class="loginTrigger btn_gnb btn_g_login" style="cursor:pointer;"
			>로그인</a></span></li> 
            <li><span class="border-type"><a href="/jhta/user/registerform.do" class="btn_gnb btn_g_join">회원가입</a></span></li>
        	</c:when>
        	<c:otherwise>
	            <li><a href="#"> ${LOGIN_USER.getNickname()}님</a></li>
	            <c:if test="${ LOGIN_USER.grade eq 'A' }">
		            <li><a href="/jhta/admin/main.do">관리자페이지</a></li>
	            </c:if>
	            <c:if test="${ LOGIN_USER.grade eq 'M' }">	            
		            <li><a href="/jhta/mypage/mypage.do">마이페이지</a></li>
	            </c:if>
	            <li><a href="/jhta/user/logout.do" class="btn_gnb">로그아웃</a></li>	
        	</c:otherwise>
        </c:choose>
        </ul>
        
    </div>
    </div>
    <div class="navbardown-border">
    <div class="navbardown">
        <div class="row">
            <div class="category text-right">
                <div class="nav-down-bottom text-left col-xs-offset-3 col-xs-6"  style="margin-left: 24%; width: 62%;">
                    <h2 class="site-logo text-left"><a href="/jhta/home.do"><img src="/jhta/resources/images/main/home_mark.png"></a></h2>
                    <ul id="main-nav-link">
                        <!-- <li><a href="#">멜론차트</a></li> -->
                        <li><a href="/jhta/music/form.do">W차트</a></li>
                        <li><a href="/jhta/art/artPage.do">연극</a></li>
                        <li><a href="/jhta/open/openSearch.do">연극 &뮤지컬</a></li>
                        <li><a href="/jhta/con/list.do">콘서트</a></li>
                        <li><a href="/jhta/con/rank.do">랭킹</a></li>
                        <li><a href="/jhta/forU/form.do">For U</a></li>
                    <c:choose>
						<c:when test="${empty LOGIN_USER }">
	                        <li><a href="#login" id="loginAnchor" class="loginTrigger btn_gnb btn_g_login" accesskey="L" title="로그인 후 이용해주세요">마이뮤직</a></li>							
						</c:when>
						<c:otherwise>
	                        <li><a href="/jhta/main/mymusic.do?userNo=${LOGIN_USER.no }">마이뮤직</a></li>							
						</c:otherwise>
                    </c:choose>
                    	<li><a href="#mySearch" id="" data-toggle="modal" data-target="#mySearch"><i class="fas fa-search"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>


<!-- 로그인 Modal -->
<div class="mwLogin">
		<div class="bg"></div>
		<div id="login" class="gLogin">
			<a class="close" title="로그인 레이어 닫기">X</a>
			<form action="" method="post" id="gLogin" class="gLogin">
				<fieldset>
					<legend>Login</legend>
					<div class="item">
						<label for="userid" class="iLabel">ID</label><input name="userid" type="text" value="" id="userid" class="iText uid" />
					</div>
					<div class="item">
						<label for="pwd" class="iLabel">PASSWORD</label><input name="pwd" type="password" value="" id="pwd" class="iText upw" />
					</div>
					<div>
						<span>&nbsp;</span><span id="msg-login"></span>
					</div>
					<p class="keeping">
						<input type="checkbox" value="Y" name="autoLogin" class="iCheck" id="keepid1" />
						<label for="autoLogin">로그인 유지</label> 
						
						<input  type="checkbox" value="Y" name="autoId" class="iCheck" id="keepid2" />
						<label for="autoId">아이디 저장</label>
						
						<span class="pull-right"><input name="" type="submit" id="btn-submit" class="ejobtn ejobtn-success" value="로그인" />
						<input type="button" class="btn btn-default btn-cancel" value="취소">
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
						<label for="oid" class="iLabel">Open ID</label><input name="" type="text" value="" id="oid" class="iText oid" />
					</div>
					<span class="btnLogin"><input name="" type="submit" value="로그인" /></span>
					<p class="help">
						<a href="#gLogin" class="gAnchor">일반 아이디 로그인</a>
					</p>
				</fieldset>
			</form>
			<a class="close" title="로그인 레이어 닫기">X</a>
		</div>
	</div>
	
	
<!-- 검색창 Modal -->
<div class="modal" role="dialog" id="mySearch">
	<div class="modal-dialog">
    
    	<div class="modal-content" style="top: 250px; background-color: transparent; border:none;">
	     
	        <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
	        
	        <form id="search-form" name="searchForm" method="get">
		        <div class="modal-body" style="position: relative; padding: 0px;">
		          <input type="text" placeholder="검색어를 입력해주세요." id="modal-search-text" style="width: 800px;  padding-bottom: 15px;  border-radius: 0px;  border: none; background-color: white;    font-size: 48px!important; margin-left:-100px;">
		          <!-- <a href="#"><i class="fas fa-search" style="padding-right: 20px;"></i></a> -->
		        </div>
	        </form>
			<div class="modal-footer" id="modal-ajax">
				
			</div>
		</div>
	</div>
</div>

<!-- 밀어내기용 div -->
<div class="top-block">    
</div>