<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>콘서트 관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	img.img-thumb {
		display: block;
		max-width: 80px;
		max-height: 100px;
		width: auto;
		height: auto;
	}
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
	<div class="modal fade" id="concertInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">콘서트 정보</h4>
	      </div>
	      <div class="modal-body">
			<div class="row">
				<div class="col-xs-6" id="selected-image"></div>
				<div class="col-xs-6">
				
			<table class="table">
				<tr>
					<th>공개여부</th>
					<td id="selected-available"></td>
					</tr><tr>
					<th>콘서트 등록번호</th>
					<td id="selected-no"></td>
					</tr><tr>
					<th>콘서트 타이틀</th>
					<td id="selected-title"></td>
					</tr><tr>
					<th>아티스트</th>
					<td id="selected-artist"></td>
					</tr><tr>
					<th>기획사</th>
					<td id="selected-agency"></td>
					</tr><tr>
					<th>장르</th>
					<td id="selected-genre"></td>
					</tr><tr>
					<th>티켓판매기간</th>
					<td id="selected-ticketdate"></td>
					</tr><tr>
					<th>콘서트 기간</th>
					<td id="selected-concertdate"></td>
					</tr><tr>
					<th>가격</th>
					<td id="selected-price"></td>
					</tr><tr>
					<th>등록일</th>
					<td id="selected-createdate"></td>
					</tr><tr>
					<th>좋아요</th>
					<td id="selected-likes"></td>
					</tr><tr>
					<th colspan="2">공연 목록</th>
					</tr>
					<tr>
					<td id="selected-category"></td>
					</tr>
					<tr>
						<td colspan="2">
						<table class="table"><thead><tr>
							<th>번호</th><th>날짜</th><th>시간</th><th>공연장</th><th>좌석수</th><th>관리</th>
						</tr></thead><tbody id="performance-list"></tbody>
						</table>
						</td>
				</tr>
			</table>
				</div>
			</div>
			
	      </div>
		      <div class="modal-footer text-right">
				<a class="btn btn-default" id="btn-selected-link">공개화면</a>
				<a class="btn btn-primary" id="btn-selected-add-performance">공연 추가</a>
				<a class="btn btn-default" id="btn-selected-modify">정보 수정</a>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<%@ include file="adminheader.jsp" %>
	<ol class="breadcrumb" style="background-color:white;">
		<li><a href="/jhta/home.do">Home</a></li>
		<li><a href="/jhta/admin/main.do">관리자</a></li>
		<li>콘서트 관리</li>
	</ol>		
	<div class="row">
<%@ include file="adminleft.jsp" %>		
		<div class="col-xs-10">
			<div class="row">
				<div class="col-xs-12">
					<h3>콘서트 목록</h3>
					<form id="search-form" class="form-inline" method="get" action="manageperf.do">
						<input type="hidden" id="cp-box" name="cp" value="1" />
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="10%" />
								<col width="20%" />
								<col width="15%" />
								<col width="15%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>커버 이미지</th>
									<th>타이틀</th>
									<th>아티스트</th>
									<th>기획사</th>
									<th>공개여부</th>
									<th>콘서트 기간</th>
									<th>예매 기간</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="concert" items="${concerts }">
								<tr data-toggle="modal" data-target="#concertInfoModal" onclick="showConcertInfo(${concert.no })" style="cursor: pointer">
									<td>${concert.no }</td>
									<td><img class="perf-grid-img img-thumb" src="../resources/images/concerts/${concert.coverImg }" alt="${concert.title }" /></td>
									<td>${concert.title }</td>
									<td>${concert.artist }</td>
									<td>${concert.agency }</td>
									<td id="con-avabl-${concert.no }">${concert.available=="Y"?"공개중":"비공개" }</td>
									<td><p style="margin:0px;" title="<fmt:formatDate value="${concert.openDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${concert.openDate }" pattern="yyyy/MM/dd" /></p>
									<p>~</p>
									<p style="margin:0px;" title="<fmt:formatDate value="${concert.closeDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${concert.closeDate }" pattern="yyyy/MM/dd" /></p></td>
									<td><p style="margin:0px;" title="<fmt:formatDate value="${concert.ticketOpenDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${concert.ticketOpenDate }" pattern="yyyy/MM/dd" /></p>
									<p>~</p>
									<p style="margin:0px;" title="<fmt:formatDate value="${concert.ticketCloseDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${concert.ticketCloseDate }" pattern="yyyy/MM/dd" /></p></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div>
							<a href="concertform.do" class="btn btn-primary pull-right">콘서트 등록</a>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12">
								
								<ul class="pagination">
								
									<c:if test="${pagination.cb gt 1 }">
										<li><a href="/jhta/admin/managecon.do?cp=${pagination.prevBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&laquo;</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pagination.beginPageIndex }" end="${pagination.endPageIndex }">
										<li class="${num eq pagination.cp ? 'active' : ''}"><a href="/jhta/admin/managecon.do?cp=${num }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">${num }</a></li>
									</c:forEach>
									
									<c:if test="${pagination.cb lt pagination.totalBlocks }">
										<li><a href="/jhta/admin/managecon.do?cp=${pagination.nextBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&raquo;</a></li>
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
									</select>
								</div>
								<div class="form-group">
									<input type="text" id="keyword-box" class="form-control" name="keyword" value="${param.keyword }"/>
								</div>
								<button type="button" class="btn btn-default btn-md" onclick="searchCon();">검색</button>
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
	
	function searchCon(cp) {
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
	
	function showConcertInfo(no) {
		$.ajax({
			type: 'POST',
			url: 'showconcertinfo.do',
			data: {concertNo:no},
			dataType: 'json',
			success: function(data) {
				var con = data.concert;
				var perfs = data.performances;
				$('#selected-available').text(con.available=='Y'?'공개중':'비공개');
				$('#selected-no').text(con.no);
				$('#selected-title').text(con.title);
				$('#selected-artist').text(con.artist);
				$('#selected-agency').text(con.agency);
				$('#selected-genre').text(con.genre);
				$('#selected-ticketdate').text(formatDate(con.ticketOpenDate) + ' ~ ' + formatDate(con.ticketCloseDate));
				$('#selected-concertdate').text(formatDate(con.openDate) + ' ~ ' + formatDate(con.closeDate));
				$('#selected-price').text(con.price+' 원');
				$('#selected-createdate').text(formatDate(con.createDate));
				$('#selected-likes').text(con.likes);
				$('#selected-category').text(con.category.no=='1'?'콘서트':'연극');
				$('#btn-selected-link').prop('href', '../con/detail.do?conNo='+con.no);
				$('#btn-selected-add-performance').prop('href', 'regperf.do?no='+con.no);
				$('#btn-selected-modify').prop('href', 'modifycon.do?no='+con.no);
				$('#selected-image').html('<img class="perf-grid-img img-detail" src="../resources/images/concerts/'+con.coverImg+'" alt="'+con.title+'" />');
				var tr = '';
				$.each(perfs, function(index, perf) {
					tr += '<tr><td>'+perf.no+'</td><td>'+perf.day+'</td><td>'+perf.time+'</td><td>'+perf.hall.name+'</td><td>'+perf.restSeatCount+'</td><td><a class="btn btn-xs btn-primary" href="/jhta/admin/modifyperf.do?no='+perf.no+'">수정</td></tr>'; 
				});
				$('#performance-list').html(tr);
			}
		});
	}
	
</script>
</body>
</html>