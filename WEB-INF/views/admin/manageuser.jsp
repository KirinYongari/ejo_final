<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>회원 관리</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

	<!-- Modal -->
	<div class="modal fade" id="userInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">회원 정보</h4>
	      </div>
	      <div class="modal-body">
			
			<table class="table">
				<tr>
					<th>회원등록번호</th>
					<td id="selected-no"></td>
					</tr><tr>
					<th>회원 ID</th>
					<td id="selected-id"></td>
					</tr><tr>
					<th>이름</th>
					<td id="selected-name"></td>
					</tr><tr>
					<th>닉네임</th>
					<td id="selected-nickname"></td>
					</tr><tr>
					<th>생일</th>
					<td id="selected-birthday"></td>
					</tr><tr>
					<th>회원 가입일</th>
					<td id="selected-createdate"></td>
					</tr><tr>
					<th>최근 접속일</th>
					<td id="selected-lastaccess"></td>
					</tr><tr>
					<th>활동 여부</th>
					<td id="selected-avail"></td>
					</tr><tr>
					<th>구매 건수</th>
					<td id="selected-purchase"></td>
				</tr>
			</table>
			
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
		<li>회원 관리</li>
	</ol>
	<div class="row">
<%@ include file="adminleft.jsp" %>	
		<div class="col-xs-offset-1 col-xs-9">
			<div class="row">
				<div class="col-xs-12">
					<h3>회원 관리</h3>
					<form id="search-form" class="form-inline" method="get" action="manageuser.do">
						<input type="hidden" id="cp-box" name="cp" value="1" />
						<table class="table">
							<colgroup>
								<col width="5%" />
								<col width="7%" />
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="12%" />
								<col width="12%" />
								<col width="9%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>닉네임</th>
									<th>가입일</th>
									<th>최근 접속일</th>
									<th>사용</th>
									<th>관리</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${users }">
								<tr>
									<td><input type="checkbox" name="check-user" value="${user.no }" /></td>
									<td>${user.no }</td>
									<td><a data-toggle="modal" data-target="#userInfoModal" onclick="showUserInfo(${user.no })" style="cursor: pointer">${user.id }</a></td>
									<td><a data-toggle="modal" data-target="#userInfoModal" onclick="showUserInfo(${user.no })" style="cursor: pointer">${user.name }</a></td>
									<td><a data-toggle="modal" data-target="#userInfoModal" onclick="showUserInfo(${user.no })" style="cursor: pointer">${user.nickname }</a></td>
									<td><p style="margin:0px;" title="<fmt:formatDate value="${user.createDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${user.createDate }" pattern="yyyy/MM/dd" /></p></td>
									<td><p style="margin:0px;" title="<fmt:formatDate value="${user.lastAccessDate }" pattern="yyyy-MM-dd HH:mm:ss" />"><fmt:formatDate value="${user.lastAccessDate }" pattern="yyyy/MM/dd" /></p></td>
									<td id="user-avabl-${user.no }">${user.available }</td>
									<td><a class="btn btn-xs btn-primary" onclick="dounblockuser(${user.no });">해제</a>&nbsp;<a class="btn btn-xs btn-danger" onclick="doblockuser(${user.no });">차단</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div>
							<a class="btn btn-xs btn-primary" id="unblock-checked">선택 해제</a>
							<a class="btn btn-xs btn-danger" id="block-checked">선택 차단</a>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12">
								
								<ul class="pagination">
								
									<c:if test="${pagination.cb gt 1 }">
										<li><a href="/jhta/admin/manageuser.do?cp=${pagination.prevBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&laquo;</a></li>
									</c:if>
									
									<c:forEach var="num" begin="${pagination.beginPageIndex }" end="${pagination.endPageIndex }">
										<li class="${num eq pagination.cp ? 'active' : ''}"><a href="/jhta/admin/manageuser.do?cp=${num }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">${num }</a></li>
									</c:forEach>
									
									<c:if test="${pagination.cb lt pagination.totalBlocks }">
										<li><a href="/jhta/admin/manageuser.do?cp=${pagination.nextBlock }${empty param.opt ? '' : '&opt='.concat(param.opt)}${empty param.keyword ? '' : '&keyword='.concat(param.keyword)}">&raquo;</a></li>
									</c:if>
								
								</ul>
								
							</div>
						</div>
						
						<div class="row text-center">
							<div class="col-xs-12">
								<div class="form-group">
									<select id="opt-box" class="form-control" name="opt">
										<option value="nickname" ${param.opt eq 'nickname' ? 'selected' : '' }>닉네임</option>
										<option value="name" ${param.opt eq 'name' ? 'selected' : '' }>이름</option>
										<option value="id" ${param.opt eq 'id' ? 'selected' : '' }>ID</option>
									</select>
								</div>
								<div class="form-group">
									<input type="text" id="keyword-box" class="form-control" name="keyword" value="${param.keyword }"/>
								</div>
								<button type="button" class="btn btn-default btn-md" onclick="searchUser();">검색</button>
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
$(function() {
	$('#check-all').change(function() {
		$('#search-form :input[name="check-user"]').prop('checked', $(this).is(':checked'));
	});
	
	$('#block-checked').click(function(event) {
		var $checkedUsers = $('#search-form :input[name="check-user"]:checked');
		
		if (!$checkedUsers.length || !confirm($checkedUsers.length + " 명 차단하시겠습니까?")) {
			return false;
		}
		
		$checkedUsers.each(function(index, item) {
			var no = $(this).val();
			
			$.ajax({
				type: 'POST',
				url: 'changeuseravabl.do',
				data: {userNo:no, userAvail:"N"},
				dataType: 'json',
				success: function(user) {
					$('#user-avabl-' + no).text(user.available);
					$('#check-all').prop('checked', false);
					$('#search-form :input[name="check-user"]').prop('checked', false);
				}
			});
		});
	});
	
	$('#unblock-checked').click(function(event) {
		var $checkedUsers = $('#search-form :input[name="check-user"]:checked');
		
		if (!$checkedUsers.length || !confirm($checkedUsers.length + " 명 해제하시겠습니까?")) {
			return false;
		}
		
		$checkedUsers.each(function(index, item) {
			var no = $(this).val();
			
			$.ajax({
				type: 'POST',
				url: 'changeuseravabl.do',
				data: {userNo:no, userAvail:"Y"},
				dataType: 'json',
				success: function(user) {
					$('#user-avabl-' + no).text(user.available);
					$('#check-all').prop('checked', false);
					$('#search-form :input[name="check-user"]').prop('checked', false);
				}
			});
		});
	});
});
	
	function searchUser(cp) {
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
	
	function showUserInfo(no) {
		$.ajax({
			type: 'POST',
			url: 'showuserinfo.do',
			data: {userNo:no},
			dataType: 'json',
			success: function(data) {
				$('#selected-no').text(data.no);
				$('#selected-id').text(data.id);
				$('#selected-name').text(data.name);
				$('#selected-nickname').text(data.nickname);
				$('#selected-birthday').text(data.birthday);
				$('#selected-createdate').text(formatDate(data.createDate));
				$('#selected-lastaccess').text(formatDate(data.lastAccessDate));
				$('#selected-avail').text(data.available == "Y" ? "정상" : "차단");
				$('#selected-purchase').text(data.purchase);
			}
		});
	}
	
	function doblockuser(no) {
		if (!confirm("차단하시겠습니까?")) {
			return false;
		}
		
		$.ajax({
			type: 'POST',
			url: 'changeuseravabl.do',
			data: {userNo:no, userAvail:"N"},
			dataType: 'json',
			success: function(user) {
				$('#user-avabl-' + no).text(user.available);
			}
		});
	}
	
	function dounblockuser(no) {
		if (!confirm("해제하시겠습니까?")) {
			return false;
		}
		
		$.ajax({
			type: 'POST',
			url: 'changeuseravabl.do',
			data: {userNo:no, userAvail:"Y"},
			dataType: 'json',
			success: function(user) {
				$('#user-avabl-' + no).text(user.available);
			}
		});
	}
	
</script>
</body>
</html>