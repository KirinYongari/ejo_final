<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>음악 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	img.img-detail {
		display: block;
		max-width: 400px;
		max-height: 500px;
		width: auto;
		height: auto;
	}
</style>
</head>
<body>
<div class="container">

	<!-- Modal -->
	<div class="modal fade" id="musicInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">음악 정보</h4>
	      </div>
	      <div class="modal-body">
			
			<div class="row">
				<div class="col-xs-6" id="selected-image"></div>
				<div class="col-xs-6">
				
			<table class="table">
				<tr>
					</tr><tr>
					<th>번호</th>
					<td id="selected-no"></td>
					</tr><tr>
					<th>타이틀</th>
					<td id="selected-title"></td>
					</tr><tr>
					<th>아티스트</th>
					<td id="selected-artist"></td>
					</tr><tr>
					<th>작사</th>
					<td id="selected-lyricist"></td>
					</tr><tr>
					<th>작곡</th>
					<td id="selected-composer"></td>
					</tr><tr>
					<th>곡 길이</th>
					<td id="selected-length"></td>
					</tr><tr>
					<th>앨범</th>
					<td id="selected-album"></td>
					</tr><tr>
					<th>발매년도</th>
					<td id="selected-year"></td>
					</tr><tr>
					<th>등록일</th>
					<td id="selected-createdate"></td>
					</tr><tr>
					<th>좋아요</th>
					<td id="selected-likes"></td>
					</tr>
			</table>
				</div>
			</div>
			
	      </div>
		      <div class="modal-footer text-right">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<%@ include file="adminheader.jsp" %>	
	<ol class="breadcrumb" style="background-color:white;">
		<li><a href="/jhta/home.do">Home</a></li>
		<li>관리자</li>
		<li>음악 관리</li>
	</ol>
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-9">
			<div class="row">
				<div class="col-xs-12">
					<h3>음악 관리</h3>
					<form id="search-form" class="form-inline" method="get" action="managemusic.do">
						<input type="hidden" id="cp-box" name="cp" value="1" />
						<table class="table table-hover">
							<colgroup>
								<col width="6%" />
								<col width="14%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
								<col width="14%" />
								<col width="10%" />
								<col width="10%" />
								<col width="6%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>타이틀</th>
									<th>아티스트</th>
									<th>작사</th>
									<th>작곡</th>
									<th>곡 길이</th>
									<th>앨범명</th>
									<th>발매년도</th>
									<th>등록일</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="music" items="${musics }">
								<tr id="tr-music-${music.no}" data-toggle="modal" data-target="#musicInfoModal" onclick="showMusicInfo(${music.no })" style="cursor: pointer">
									<td>${music.no }</td>
									<td>${music.title }</td>
									<td>${music.artist }</td>
									<td>${music.lyricist }</td>
									<td>${music.composer }</td>
									<td>${music.lengths }</td>
									<td>${music.album.title }</td>
									<td>${music.years }</td>
									<td><p style="margin:0px;" title="<fmt:formatDate value="${music.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${music.createDate }" pattern="yyyy/MM/dd" /></p></td>
									<td><a class="btn btn-xs btn-danger" onclick="deletemusic(${music.no });">삭제</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div>
							<a href="regmusic.do" class="btn btn-primary pull-right">음악 등록</a>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12">
								
								<ul class="pagination">
								
									<c:if test="${pagination.cb gt 1 }">
										<li><a href="/jhta/admin/managemusic.do?cp=${pagination.prevBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&laquo;</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pagination.beginPageIndex }" end="${pagination.endPageIndex }">
										<li class="${num eq pagination.cp ? 'active' : ''}"><a href="/jhta/admin/managemusic.do?cp=${num }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">${num }</a></li>
									</c:forEach>
									
									<c:if test="${pagination.cb lt pagination.totalBlocks }">
										<li><a href="/jhta/admin/managemusic.do?cp=${pagination.nextBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&raquo;</a></li>
									</c:if>
								
								</ul>
								
							</div>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12">
								<div class="form-group">
									<select id="opt-box" class="form-control" name="opt">
										<option value="title" ${param.opt eq 'title' ? 'selected' : '' }>타이틀</option>
										<option value="artist" ${param.opt eq 'artist' ? 'selected' : '' }>아티스트</option>
										<option value="album" ${param.opt eq 'album' ? 'selected' : '' }>앨범</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" id="keyword-box" class="form-control" name="keyword" value="${param.keyword }"/>
								</div>
								<button type="button" class="btn btn-default btn-md" onclick="searchMusic();">검색</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>
<%@ include file="adminfooter.jsp" %>
</div>

<script type="text/javascript">
	
	function searchMusic(cp) {
		cp = cp || 1;
		
		$('#cp-box').val(cp);
		$('#search-form').submit();
	}

	function formatDate(datestring) {
		var date = new Date(datestring);
		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();
		
		if (month < 10) month = '0' + month;
		if (day < 10) day = '0' + day;
		return year + '/' + month + '/' + day;
	}
	
	function showMusicInfo(no) {
		$.ajax({
			type: 'POST',
			url: 'showmusicinfo.do',
			data: {musicNo:no},
			dataType: 'json',
			success: function(data) {
				var music = data.music;
				var album = data.album;
				$('#selected-no').text(music.no);
				$('#selected-title').text(music.title);
				$('#selected-artist').text(music.artist);
				$('#selected-lyricist').text(music.lyricist);
				$('#selected-composer').text(music.composer);
				$('#selected-length').text(music.lengths);
				$('#selected-album').text(album.title);
				$('#selected-year').text(music.years);
				$('#selected-createdate').text(formatDate(music.createDate));
				$('#selected-likes').text(music.likes);
				$('#btn-selected-link').prop('href', '../music/detail.do?musicNo='+music.no);
				$('#selected-image').html('<img class="perf-grid-img img-detail" src="../resources/images/musics/'+(music.img?music.img:"noArtist02.jpg")+'" alt="'+music.title+'" />');
			}
		});
	}
	
	function deletemusic(no) {
		event.stopPropagation();
		if (!confirm("정말 삭제하시겠습니까?")) {
			return false;
		}
		
		$.ajax({
			type: 'POST',
			url: 'deletemusic.do',
			data: {musicNo:no},
			dataType: 'json',
			success: function(music) {
				$('#tr-music-' + no).remove();
			},
			error: function(e) {
				alert('삭제 실패');
			}
		});
	}
	
</script>
</body>
</html>