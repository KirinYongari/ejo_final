<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Form</title>
<%@ include file="../include/resource.jsp" %>
<style>


</style>
</head>
<body>
<%@ include file="../include/main-nav.jsp" %>

<div class="container">
	<div class="section">
		<div class="">
			<form id="search" method="get" name="search2">
				<div class="">
				
				</div>
				<p>검색결과</p>
				<input type="text">
			</form>
			<div class="">
				<ul>
					<li>전체</li>
					<li>공연</li>
					<li>콘서트</li>
					<li>가수</li>
					<li>노래</li>
				</ul>
			</div>
			<div class="result-space">
				<h1>
					<span>"?"</span>
					에 대한 검색 결과가 없습니다.
				</h1>
				<div id="loading">
					<img id="loading_img" alt="loading" src="/jhta/resources/images/main/loading-lion.gif">
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>
</body>
<script>
$(document).ready(function() {

	$('#loading').hide();
	
	}).ajaxStart(function() {
		$('#loading').show();
		
	}).ajaxStop(function() {
		$('#loading').hide();
});
</script>
</html>