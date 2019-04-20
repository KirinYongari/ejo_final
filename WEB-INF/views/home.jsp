<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>main 페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<%@ include file="include/resource.jsp" %>
<link href="resources/css/main/main.css" rel="stylesheet" >
<script src="resources/js/main/main.js" ></script>


</head>
<body>
	<%@ include file="include/main-nav.jsp"%>

	<!-- 메인 슬라이드 보여주기 -->
    <div class="slideshow-container">
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="resources/images/main/slide-page1.jpg">
            <div class="text"></div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="resources/images/main/slide-page2.jpg">
            <div class="text"></div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="resources/images/main/slide-page3.jpg">
            <div class="text"></div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="resources/images/main/slide-page4.jpg">
            <div class="text"></div>
        </div>
        <div class="mySlides fade">
            <div class="numbertext"></div>
            <img src="resources/images/main/slide-page5.jpg">
            <div class="text"></div>
        </div>

        <div class="dot-5" style="text-align:center">
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
            <span class="dot"></span>
        </div>
    </div>

    <!-- 최신앨범 -->
    <div class="cont-top">
        <div class="newAlbum">
            <div class="album-up">
                <h2><a href="/jhta/music/form.do">W차트 ▷</a></h2>
            </div>
            <div class="album-down">
                <div class="album-down-left">
                    <ul>
	                    <c:forEach var="album" items="${sixAlbums}">
	                        <li><a href="/jhta/music/form.do"><img src="resources/images/album/${album.coverImg}"><div class="black-box"/></a></li>
	                    </c:forEach>
                    </ul>
                </div>
                <div class="album-down-right">
                	<c:forEach var="album" items="${fiveAlbums}">
	                    <div class="slide"><a href="/jhta/music/form.do"><img src="resources/images/album/${album.coverImg}"></a></div>
                	</c:forEach>
                </div>
                <div class="round-5" style="text-align:center">
                    <span class="round"></span>
                    <span class="round"></span>
                    <span class="round"></span>
                    <span class="round"></span>
                    <span class="round"></span>
                </div>
            </div>
        </div>
    </div>


    <!-- 오늘의 플레이리스트 3개씩-->
    <div class="cont-mid">
        <div class="playlist-pick">
            <div class="playlist-pick-up">
                <h2>오늘의 MUSIC PICK</h2>
            </div>
            <div class="playlist-pick-bottom">
            	<c:forEach var="board" items="${playlistsBoard}">
	                <div class="article">
	                    <div class="music">
	                    <c:choose>
	                    	<c:when test="${empty board.theme.picture }">
		                        <a href="/jhta/main/mymusic.do?userNo=${board.user.no }"><img src="resources/images/theme/basic-theme.jpg">
							</c:when>
							<c:otherwise>
		                        <a href="/jhta/main/mymusic.do?userNo=${board.user.no }"><img src="resources/images/theme/${board.theme.picture }">
							</c:otherwise>
	    				</c:choose>
	                            <p> </p>
	                            <span>${board.user.nickname }님의 플레이리스트</span>
	                        </a>
	                    </div>
	                </div>
            	</c:forEach>
<!--            <div class="article">
                    <div class="music">
                        <a href=""><img src="resources/images/main/img_4.jpg">
                            <p>모두가 행복해지는 크리스마스</p>
                            <span>유저닉네임</span>
                        </a>
                    </div>
                </div>
                <div class="article">
                    <div class="music">
                        <a href=""><img src="resources/images/main/img_4.jpg">
                            <p>모두가 행복해지는 크리스마스</p>
                            <span>유저닉네임</span>
                        </a>
                    </div>
                </div> -->
            </div>
        </div>
    </div>


    <!-- 콘서트 최신/인기 -->
    <div class="cont-bottom">
        <div class="performance">
            <div class="perf-header">
                <ul class="perf-sort">
                	<h2><a href="/jhta/con/list.do">콘서트 정보</a></h2>
	                <li value="like"><a href="javascript:void(0);" id="concert-lastest">최신 </a></li>
	                <li value="new"><a href="javascript:void(0);" id="concert-popular">인기</a></li>
                </ul>
            </div>
            <div class="perf-cont">
                <ul id="">
                    <c:forEach var="concert" items="${fiveConcerts}">
                    	<li>
                    		<a href="/jhta/con/detail.do?conNo=${concert.no }">
	                    		<img src="resources/images/concerts/${concert.coverImg}">
	                    		<h5>${concert.title}</h5>
                    		</a>
                    		<p>${concert.artist}</p>
                    	</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    
    <!-- 공연 최신/인기 -->
    <div class="cont-bottom2">
        <div class="act-play">
            <div class="act-header">
                <ul class="act-sort">
                	<h2><a href="/jhta/art/artPage.do">뮤지컬&연극</a></h2>
	                <li value="like"><a href="javascript:void(0);" id="act-lastest">최신 </a></li>
	                <li value="new"><a href="javascript:void(0);" id="act-popular">인기</a></li>
                </ul>
            </div>
            <div class="act-cont">
                <ul id="">
                    <c:forEach var="act" items="${fiveActs}">
                    	<li>
                    		<a href="/jhta/con/detail.do?conNo=${act.no }">
	                    		<img src="resources/images/concerts/${act.coverImg}">
	                    		<h5>${act.title}</h5>
                    		</a>
                    		<p>${act.artist}</p>
                    	</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
	
	<!-- 푸터 -->
   	<%@ include file="include/footer.jsp" %>

</body>
<script>
$(function(){
		
		/* 콘서트 최신 인기 ajax */
		$('#concert-lastest').click(function(event) {
			event.preventDefault();
			$(".perf-cont").empty();
			$.ajax ({
				type: "GET",
				url: "home-concert-lastest.do",
				dataType:"json",
				success: function(result){
					console.log(concerts);
					var concerts = result.concerts
					var concertHtml = '<ul>';
					$.each(result, function(index, item) {
						
							concertHtml += '	<li>';
							concertHtml += '		<a href="/jhta/con/detail.do?conNo='+item.no+'">';
							concertHtml += '			<img src="resources/images/concerts/'+item.coverImg+'">';
							concertHtml += '			<h5>'+item.title+'</h5>';
							concertHtml += '		</a>';
							concertHtml += '		<p>'+item.artist +'</p>';
							concertHtml += '	</li>';
					})
					concertHtml += '</ul>';
				$('.perf-cont').append(concertHtml);
	                    
				}
			}) 
		})
		
		$('#concert-popular').click(function(evnet) {
			event.preventDefault();
			$(".perf-cont").empty();
			$.ajax ({
				type: "GET",
				url: "home-concert-popular.do",
				
				dataType:"json",
				success: function(result){
					console.log(result);
					var concerts = result.concerts
					var concertHtml = '<ul>';
					$.each(result, function(index, item) {
							concertHtml += '	<li>';
							concertHtml += '		<a href="/jhta/con/detail.do?conNo='+item.no+'">';
							concertHtml += '			<img src="resources/images/concerts/'+item.coverImg+'">';
							concertHtml += '			<h5>'+item.title+'</h5>';
							concertHtml += '		</a>';
							concertHtml += '		<p>'+item.artist +'</p>';
							concertHtml += '	</li>';
					})
					concertHtml += '</ul>';
				$('.perf-cont').append(concertHtml);
				}
			}) 
		})

		/* 뮤지컬&연극 최신 인기 ajax */
		$('#act-lastest').click(function(event) {
			event.preventDefault();
			$(".act-cont").empty();
			$.ajax ({
				type: "GET",
				url: "home-act-lastest.do",
				dataType:"json",
				success: function(result){
					console.log(concerts);
					var concerts = result.concerts
					var concertHtml = '<ul>';
					$.each(result, function(index, item) {
						
							concertHtml += '	<li>';
							concertHtml += '		<a href="/jhta/con/detail.do?conNo='+item.no+'">';
							concertHtml += '			<img src="resources/images/concerts/'+item.coverImg+'">';
							concertHtml += '			<h5>'+item.title+'</h5>';
							concertHtml += '		</a>';
							concertHtml += '		<p>'+item.artist +'</p>';
							concertHtml += '	</li>';
					})
					concertHtml += '</ul>';
				$('.act-cont').append(concertHtml);
	                    
	           
				}
			}) 
		})
		
		$('#act-popular').click(function(evnet) {
			event.preventDefault();
			$(".act-cont").empty();
			$.ajax ({
				type: "GET",
				url: "home-act-popular.do",
				
				dataType:"json",
				success: function(result){
					console.log(result);
					var concerts = result.concerts
					var concertHtml = '<ul>';
					$.each(result, function(index, item) {
							concertHtml += '	<li>';
							concertHtml += '		<a href="/jhta/con/detail.do?conNo='+item.no+'">';
							concertHtml += '			<img src="resources/images/concerts/'+item.coverImg+'">';
							concertHtml += '			<h5>'+item.title+'</h5>';
							concertHtml += '		</a>';
							concertHtml += '		<p>'+item.artist +'</p>';
							concertHtml += '	</li>';
					})
					concertHtml += '</ul>';
				$('.act-cont').append(concertHtml);
				}
			}) 
		})

});
</script>
</html>