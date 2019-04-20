<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>my music</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<%@ include file="../include/resource.jsp" %>
<link href="../resources/css/main/mymusic.css" rel="stylesheet" >

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" >
</head>
<body>
<%@ include file="../include/main-nav.jsp"%>
    
<div class="cont-wrap">
    <div class="cont-section">
        <div class="cont-my">
            <div class="cont-menu">
                <h2>마이뮤직</h2>
                <div class="tab-menu">
                    <ul class="nav navbar-nav navbar-default">
                        <li class="active"><a data-toggle="tab" href="#tab-home" class="list-group-item text-center">홈</a></li>
                        <li><a data-toggle="tab" href="#tab-playlist" class="list-group-item  text-center">플레이리스트</a></li>
                        <!-- <li><a data-toggle="tab" href="#tab-like" class="list-group-item  text-center">좋아요</a></li> -->
                        <!-- <li><a data-toggle="tab" href="#tab-much" class="list-group-item  text-center">많이 들은</a></li>
                        <li><a data-toggle="tab" href="#tab-fan" class="list-group-item  text-center">팬맺은 아티스트</a></li> -->
                        <li><a data-toggle="tab" href="#tab-friend" class="list-group-item  text-center">친구</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="tab-content"> 
                <div class="tab-pane fade active in" id="tab-home">
                    <div class="theme">
                    	<c:choose>
                    		<c:when test="${empty friendTheme.picture }">
                        		<div style="background-image: url(../resources/images/theme/basic-theme.jpg);"></div>
                        	</c:when>
                        	<c:otherwise>
                        		<div style="background-image: url(../resources/images/theme/${friendTheme.picture});"></div>                        		
                        	</c:otherwise>
                        </c:choose>
                        <div class="profile-section">
                            <div class="profile">
                            <c:choose>
								<c:when test="${empty friendTheme.img }" >
									<img src="../resources/images/profile/basic-profile.jpg">			
								</c:when>
								<c:otherwise>
									<img src="../resources/images/profile/${friendTheme.img }">					
								</c:otherwise>
							</c:choose>
                            </div>
                            <div class="profile-des">
                                <div class="profile-des-section">  
                                <h5>${friend.getNickname()} 님</h5>
                                <p>친구 ${countFriend.countFriend }명</p>
                                <p>담은곡 ${countPlaylistItemMusic.countPlaylistItemMusic }곡</p>
								<!-- 자신은 팔로우 못함, 팔로우로 등록하면 팔로우 숨김 -->
	                            <c:choose> 
									<c:when test="${LOGIN_USER.no eq friend.no && !(empty LOGIN_USER)}">
										<!-- 안보임(일부러 안넣음) -->
									</c:when>
									<c:otherwise>
		                                	<p><a id="follow-btn" class="btn btn-primary" style="padding:3px;" href="follow.do?friendNo=${friend.no }" style="color:blue; background-color:white;">팔로우</a></p>
									</c:otherwise>                                
	                            </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<div class="white-box">  
                    </div>-->
                    
                    <div class="coment-section">
                    	<div class="visitor">
	                        <h3>방명록</h3>
                    	</div>
                        <div class="coment-box">
                            <div class="profile-round">
	                            <c:choose>
									<c:when test="${empty LOGIN_USER }" >
										<img src="../resources/images/profile/basic-profile.jpg">			
									</c:when>
									<c:otherwise>
										<img src="../resources/images/profile/${LOGIN_USER.theme.img }">					
									</c:otherwise>
								</c:choose>
                            </div>
                            <form class="form-inline" action="" method="GET" id="ajax-comment">
                            <input type="hidden" value="${friend.no }" name="playlist.user.no" >
	                            <div class="textbox">
	                                <textarea id="visitor-content" placeholder="방명록을 남겨주세요" name="comment"></textarea>
	                            </div>
	                            <div class="coment-button">
	                                <button type="button" id="submit-comment">등 록</button>
	                            </div>
                            </form>
                        </div> 
                        <div class="coment-history">
                            <!-- <strong>총 ?개</strong> -->
                            <div id="ajax-comment">
							<c:choose>
		                        <c:when test="${empty commentList}">
		                            <div class="coment-history-border">
        		                        <p>등록된 글이 없습니다.</p>
		                            </div>
			                    </c:when>  
            					<c:otherwise>
            					<div id="comment-history">
            							<c:forEach var="comment" items="${commentList }">
			                            <div class="coment-history-border" style="padding: 26px 0 53px;">
											<div class="col-xs-2">
													<img src="../resources/images/profile/${comment.theme.img }" style="width:54px; height:54px; border-radius:100%;">														
											</div>
											<div class="coment-content"  style="margin:11px 0 -15px;">
												<p style="float:left; margin:0; color:#999">${comment.user.nickname }님</p><br/>
												<p style="float:left; margin:0;">${comment.comment }</p>
												<span style="float:left;font-size:11px;color:#d1d1d1;margin:4px 0px 0px 5px;}"><fmt:formatDate value="${comment.createDate}"/></span>
											</div>
										</div>
            							</c:forEach>
            					</div>
            					</c:otherwise>           
							</c:choose>
							</div>
                        </div>
                    </div>
                </div>


               <!--  <div class="tab-pane fade" id="tab-like">
                    <div class="cont-like">
                        <div class="title-top">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="title-body">
                            <table style="width: 100%">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:15%">
                                    <col style="width:20%">
                                    <col style="width:12%">
                                    <col style="width:5%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>앨범명</th>
                                        <th>곡명</th>
                                        <th>아티스트</th>
                                        <th>앨범</th>
                                        <th>좋아요</th>
                                        <th>뮤비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" title="곡 선택"></td>
                                        <td>1</td>
                                        <td>미안해</td>
                                        <td>양다일</td>
                                        <td>inside</td>
                                        <td>139,749</td>
                                        <td><i class="fab fa-youtube"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> -->

                <div class="tab-pane fade" id="tab-playlist">
                    <div class="cont-playlist">
                        <div class="">
                            
                        </div>
                        <div class="title-body col-xs-offset-2 col-xs-8">
                            <table style="width: 100%">
                                <colgroup>
                                    <col style="width:2%">
                                    <col style="width:25%">
                                    <col style="width:15%">
                                    <col style="width:10%">
                                    <col style="width:4%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th style="text-align:center">앨범명</th>
                                        <th style="text-align:center">곡명</th>
                                        <th style="text-align:center">아티스트</th>
                                        <th style="text-align:center">좋아요</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                                	<c:when test="${empty myAddPlayListItems }">
                                    	<tr>
											<td colspan="5"><p style="text-align:center; font-size:30px; margin-top:60px;">담은 노래가 없습니다.</p></td>
                                    	</tr>
                                	</c:when>
                                	<c:otherwise>
                               		   <c:forEach var="playListItem" items="${myAddPlayListItems }" varStatus="status">
	                                    <tr>
	                                        <td>${status.count }</td>
	                                        <td style="text-align:center">${playListItem.album.title }</td>
	                                        <td style="text-align:center">${playListItem.music.title }</td>
	                                        <td style="text-align:center">${playListItem.music.artist }</td>
	                                        <td style="text-align:center">${playListItem.like }</td>
	                                    </tr>
                               			 </c:forEach>
                                	</c:otherwise>
                                
                                </c:choose>
                                
                             
                                    <!-- <tr>
                                        <td>2</td>
                                        <td style="text-align:center">/// (너 먹구름 비)</td>
                                        <td style="text-align:center">비도 오고 그래서</td>
                                        <td style="text-align:center">헤이즈</td>
                                        <td style="text-align:center">2214</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td style="text-align:center">삐삐</td>
                                        <td style="text-align:center">삐삐</td>
                                        <td style="text-align:center">아이유</td>
                                        <td style="text-align:center">179</td>
                                    </tr> -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>


                <!-- <div class="tab-pane fade" id="tab-much">
                    <div class="cont-much">
                        <div class="title-top">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="title-body">
                            <table style="width: 100%">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:20%">
                                    <col style="width:20%">
                                    <col style="width:15%">
                                    <col style="width:20%">
                                    <col style="width:12%">
                                    <col style="width:5%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th>앨범명</th>
                                        <th>곡명</th>
                                        <th>아티스트</th>
                                        <th>앨범</th>
                                        <th>좋아요</th>
                                        <th>뮤비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" title="곡 선택"></td>
                                        <td>1</td>
                                        <td>미안해</td>
                                        <td>양다일</td>
                                        <td>inside</td>
                                        <td>139,749</td>
                                        <td><i class="fab fa-youtube"></i></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> -->

                <%-- <div class="tab-pane fade" id="tab-fan">
					<div class="cont-playlist">
                        <div class="">
                            
                        </div>
                        <div class="title-body">
                            <table style="width: 100%">
                                <colgroup>
                                    <col style="width:3%">
                                    <col style="width:20%">
                                    <col style="width:40%">
                                    <col style="width:10%">
                                    <col style="width:12%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>NO</th>
                                        <th></th>
                                        <th>플레이리스트 정보</th>
                                        <th></th>
                                        <th>듣기</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach varStatus="status">
                                    <tr>
                                        <td>1</td>
                                        <td>제목 </td>
                                        <td>수록곡: 총100곡</td>
                                        <td></td>
                                        <td>전체듣기</td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> --%>

                <div class="tab-pane fade" id="tab-friend">
					<div class="cont-playlist">
                        <div class="">
                            
                        </div>
                        <div class="title-body col-xs-offset-2 col-xs-8" style="width:1008px;">
                            <table style="width: 70%">
                                <!-- <colgroup>
                                    <col style="width:4%">
                                    <col style="width:">
                                    <col style="width:20%">
                                    <col style="width:10%">
                                    <col style="width:10%">
                                    <col style="width:10%"> 
                                </colgroup> -->
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th></th>
                                        <th style=" text-align:center;" colspan="2">친구 플레이리스트 목록</th>
                                        <th>수록곡 수</th>
										<th>친구관리</th>                                        
                                    </tr>
                                </thead>
                                <tbody>
                                   	<c:forEach var="friend" items="${friendList }" varStatus="status">
                                    <tr>
                                        <td>${status.count }</td>
                                        <td>
                                        	<%-- <c:choose>
												<c:when test="${empty friend.user.theme.img }" >
													<img style="margin-left: 20px; width: 54px; height: 54px; border-radius: 100%;" src="../resources/images/profile/basic-profile.jpg">			
												</c:when>
												<c:otherwise> --%>
																		
												<%-- </c:otherwise>
											</c:choose></td> --%>
                                        <td style="text-align:center;" colspan="2">
                                        	<a href="/jhta/main/mymusic.do?userNo=${friend.friendUser.no }">
	                                        	<div style="margin-top: 14px;margin-bottom: 6px;">
		                                        	<img style="margin-left: 20px; width: 54px; height: 54px; border-radius: 100%;" src="../resources/images/profile/${friend.user.theme.img }">
	                                        	</div>
                                        	${friend.user.nickname }님의 플레이리스트</a></td>
                                        <td>10곡</td>
                                     	
                                     	<!-- 내가놀러간친구번호=로그인유저번호 -->
                                     	<c:choose>
											<c:when test="${empty friend.same or friend.user.no eq LOGIN_USER.no}">
		                                        <td class="unfollow-btn"><a href="unfollow.do?friendNo=${friend.friendUser.no }" id="unfollow-btn" class="btn btn-danger unfollow-btn" style="color:red; background-color:white;">unfollow</a></td>
												
												<%-- <c:if test="${!(LOGIN_USER.no eq friend.no && !(empty LOGIN_USER))}">
			                                        <td><a href="unfollow.do?friendNo=${friend.friendUser.no }" class="btn btn-danger" style="color:red;background-color:white">unfollow</a></td>
												</c:if> --%>
											</c:when>
											<c:otherwise >
												<!-- 안보임(일부러 안넣음) -->
											</c:otherwise>											
                                     	</c:choose>
                                    </tr>
                                   	</c:forEach>
                                   <%--  </c:choose> --%>
                                </tbody>
                            </table>
                        </div>
                      
                    </div>
                </div>
					
				<!-- <div id="loading">
					<img id="loading_img" alt="loading" src="/jhta/resources/images/main/loading-lion.gif">
				</div> -->
            </div>
        </div>
    </div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>
$(function(){
	
	$("#follow-btn").click(function(event) {
		alert("친구가 팔로우 됐습니다.");
	})
	
		
	
	// 방명록에서 댓글 등록 버튼을 클릭했을때 
	$("#submit-comment").click(function(event) {
		event.preventDefault();
		
		$(".coment-history-border").empty();
		var commentparam = $("#ajax-comment").serialize();
		
		$.ajax({
			type:"GET",
			url:"visitor.do",
			data:commentparam,
			dataType:"json",
			success: function(result) {
				console.log(result);
				var playlistboards = result.playlistboards;
				var html ="";
				
				if (playlistboards.length) {
            
					$.each(playlistboards, function(index, item) {
						html += '<div class="coment-history-border"  style="padding: 26px 0 53px;">';
						html += '	<div class="col-xs-2">';
						html += '		<img src="../resources/images/profile/'+item.theme.img +'" style="width:54px; height:54px; border-radius:100%;">';
						html += '	</div>';
						html += '	<div class="coment-content"  style="margin:11px 0 -15px;">';
						html += '		<p style="float:left margin:0; color:#999">'+item.user.nickname +'님</p>';
						html += '		<p style="float:left margin:0;">'+item.comment +'</p>';
						html +=	'		<span style="float:left;font-size:11px;color:#d1d1d1;margin:4px 0px 0px 5px;}">'+item.createDate+'</span>';
						html +=	'</div>';
						html += '</div>';
					})
					/* $("#comment-history").empty(); */
					$("#comment-history").append(html);
							
				} else {
					html +='<div class="coment-history-border">';
					html +='	<p>등록된 글이 없습니다.</p>';
					html +='</div>';
					$("#ajax-comment").append(html);
				} 
			}
		})
	})
	
	
	
	
})
</script>
</html>