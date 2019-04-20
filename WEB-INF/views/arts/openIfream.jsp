<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>

<style>

/*ul.list {position:relative; margin-top:10px; width:510px; display:block; text-align:left;}*/


/*ul.list {position:relative; margin-top:10px; width:510px; display:block; text-align:left;}*/
ul.list {
	display: block;
	text-align: left;
	overflow: hidden;
}

ul.list li {
	float: left;
	height: 20px;
	width: 500px;
	padding-left: 8px;
	display: inline;
	line-height: 130%;
	background:
		url(http://ticketimage.interpark.com/TicketImage/main/100506_main/main_icon.gif)
		-3px -387px no-repeat transparent;
	display: block;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
}
.wOpen dd {
    position: relative;
    padding-top: 8px;
    width: 510px;
    height: 60px;
    overflow: hidden;
    vertical-align: top;
}
ul.list li span.tit {
	float: left;
	width: 440px;
	display: inline-block;
	white-space: nowrap;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
	text-align: left;
}

ul.list li span.tit a {
	color: #6c6d6f;
}

ul.list li span.tit a:hover {
	color: #da6464;
}

ul.list li span.date {
	float: right;
	display: inline-block;
	font-size: 10px;
	font-family: arial;
	text-align: center;
	color: #adadad;
}
</style>
<link
	href="http://ticketimage.interpark.com/TicketImage/main/100506_sub/play_201005.css"
	rel="stylesheet">
	
	
	
<script type="text/javascript">
		var scrollerheight = 120; // 스크롤러의 세로 
		var html, total_area = 0, wait_flag = true;
		var bMouseOver = 1;
		var scrollspeed = 1; // Scrolling 속도         
		var waitingtime = 3000; // 멈추는 시간
		var s_tmp = 0, s_amount = 20;
		var scroll_content = new Array();
		var startPanel = 0, n_panel = 0, i = 0;

		
		
		
		
		function startscroll() { // 스크롤 시작
			i = 0;
			for (i in scroll_content)
				n_panel++;

			n_panel = n_panel - 1;
			//startPanel = Math.round(Math.random()*n_panel);
			startPanel = 0;
			if (startPanel == 0) {
				i = 0;
				for (i in scroll_content)
					insert_area(total_area, total_area++); // area 삽입
			} else if (startPanel == n_panel) {
				insert_area(startPanel, total_area);
				total_area++;
				for (i = 0; i < startPanel; i++) {
					insert_area(i, total_area); // area 삽입
					total_area++;
				}
			} else if ((startPanel > 0) || (startPanel < n_panel)) {
				insert_area(startPanel, total_area);
				total_area++;
				for (i = startPanel + 1; i <= n_panel; i++) {
					insert_area(i, total_area); // area 삽입
					total_area++;
				}
				for (i = 0; i < startPanel; i++) {
					insert_area(i, total_area); // area 삽입
					total_area++;
				}
			}
			window.setTimeout("scrolling()", waitingtime);
		}

		function scrolling() { // 실제로 스크롤 하는 부분
			if (bMouseOver && wait_flag) {
				for (i = 0; i < total_area; i++) {
					tmp = document.getElementById('scroll_area' + i).style;
					tmp.top = parseInt(tmp.top) - scrollspeed;
					if (parseInt(tmp.top) <= -scrollerheight) {
						tmp.top = scrollerheight * (total_area - 1);
					}
					if (s_tmp++ > (s_amount - 1) * scroll_content.length) {
						wait_flag = false;
						window.setTimeout("wait_flag=true;s_tmp=0;",
								waitingtime);
					}
				}
			}
			window.setTimeout("scrolling()", 1);
		}

		var newsVar = 0;
		
		
		function insert_area(idx, n) { // area 삽입
			html = '<div style="left: 0px; width: 100%; position: absolute; top: '
					+ (scrollerheight * n) + 'px" id="scroll_area' + n + '">\n';
			html += scroll_content[idx] + '\n';
			html += '</div>\n';
			$("#scroll_area"+n+"").append(html);
			//document.write(html);
		}
			
		$(function(){
			$.ajax({
				type:"get",
				url:"openAjax.do",
				dataType:"json",
				success:function(result){
					var concerts = result;
					console.log(result);
					scroll_content[0] += "<ul class='list'><ul class='list'><ul class='list'><ul class='list'><ul class='list'><ul class='list'>";
										$.each(concerts,function(index,item){
					scroll_content[0] +="<li><span class='tit'><a href='detail.do?concertno="+item.no+"' target='_parent'>"+item.title+" 2월 티켓오픈 안내</a></span></li></ul>";
										})

					
					scroll_content[1] += "<ul class='list'><ul class='list'><ul class='list'><ul class='list'><ul class='list'><ul class='list'>";
										$.each(concerts,function(index,item){
					scroll_content[1] +="<li><span class='tit'><a href='detail.do?concertno="+item.no+"' target='_parent'>"+item.title+" 2월 티켓오픈 안내</a></span></li></ul>";
										})
				}
			})
			startscroll();
			
		})							
							
	</script>
	
</head>
<body style="overflow-x: hidden; overflow-y: hidden;">
	<ul class="list">

		<div
			style="width: 510px; height: 60px; position: absolute; left: 0; overflow: hidden;"
			onmouseover="bMouseOver=0" onmouseout="bMouseOver=1"
			id="scroll_image">

			
			<div style="left: 0px; width: 100%; position: absolute; top: -60px;"
				id="scroll_area0">
				<ul class="list">
					<ul class="list">
						<ul class="list">
							<ul class="list">
								<ul class="list">
									<ul class="list">
										<c:forEach items="${concerts }" var="concert">
											<li><span class="tit"><a
													href="detail.do?concertno=${concert.no }" target="_parent">${concert.title }
														<fmt:formatDate value="${concert.ticketOpenDate }" pattern="M"/>월 티켓오픈 안내</a></span></li>
									</ul>
									</c:forEach>
			</div>
			<div style="left: 0px; width: 100%; position: absolute; top: 60px;"
				id="scroll_area1">
				<ul class="list">
					<ul class="list">
						<ul class="list">
							<ul class="list">
								<ul class="list">
									<ul class="list">
										<c:forEach items="${concerts }" var="concert">
											<li><span class="tit"><a
													href="detail.do?concertno=${concert.no }" target="_parent">${concert.title }
														<fmt:formatDate value="${concert.ticketOpenDate }" pattern="M"/>월 티켓오픈 안내</a></span></li>
									</ul>
									</c:forEach>
			</div>
			

		</div>
	</ul>

</body>
</html>