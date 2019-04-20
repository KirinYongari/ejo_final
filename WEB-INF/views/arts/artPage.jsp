<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="../include/main-nav.jsp"%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
<style type="text/css">
@charset "UTF-8";

.Con_ST {
	position: relative;
    display: block;
    
    /* margin-left: 100px; */
    width: 100%;
    height: 328px;
    left: 108px;
    top: 35px;
    overflow: hidden;
    transform: scale(1.19);
	background: url(../resources/images/arts/concert.jpg) no-repeat;
}

.Con_ST .wrap_Tview {
	position: relative;
	width: 900px;
	margin-top: 44px;
	margin-left: 56px;
	display: block;
}
.performance-second{
	position: relative;
    left: 105px;
    top: 62px;
    transform: scale(1.19);
}
dl.Tview {
	position: relative;
	float: left;
	width: 129px;
	margin: 0px  6px;
	display: inline;
	overflow: hidden;
}

dl.Tview dt.Tposter {
	position: relative;
	width: 129px;
	height: 161px;
	padding-left: 3px;
	padding-top: 3px;
	margin-left: 0px;
    margin-top: 1px;
}

dl.Tview dt.Tposter a {
	width: 129px;
	height: 161px;
	display: inline-block;
}

A:visited {
	COLOR: #4F4F4F;
	TEXT-DECORATION: none;
}

dl.Tview dt.Tposter .info {
	position: absolute;
	z-index: 10;
	top: 118px;
	left: 3px;
	width: 123px;
	height: 35px;
	background: url(../resources/images/arts/tp_bg_info.png);
	_background: none;
	_filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='../resources/images/arts/tp_bg_info.png',
		sizingMethod='crop');
	cursor: pointer;
}

dl.Tview dt.Tposter .info .txt1 {
	display: block;
	color: #e7e7e7;
	text-align: center;
	font-size: 11px;
	margin-top: 5px;
	height: 13px;
	overflow: hidden;
}

dl.Tview dt.Tposter .info .txt2 {
	display: block;
	color: #ffcfce;
	text-align: center;
	font-size: 11px;
	margin-top: 0;
	height: 14px;
	overflow: hidden;
}

dl.Tview dd {
	position: relative;
	color: #fff;
	text-align: center;
	font-size: 11px;
	margin-left: 0px;
}

dl.Tview dd span.txt1 {
	display: block;
	width: 129px;
	height: 14px;
	color: #FFF;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	letter-spacing: -0.1em;
	overflow: hidden;
	margin-top: 7px;
}

dl.Tview dd span.txt2 {
	display: block;
	color: #a0a0a0;
	text-align: center;
	font-size: 11px;
	margin-top: 3px;
	letter-spacing: -0.1em;
	height: 12px;
	overflow: hidden;
}

dl.Tview dd span.txt3 {
	display: block;
	color: #a0a0a0;
	text-align: center;
	font-size: 11px;
	font-family: arial;
	letter-spacing: 0;
	height: 11px;
	overflow: hidden;
}

<!--
두번째 칸-->.performance-second {
	position: relative;
	display: block;
	width: 100%;
	/* margin-bottom: 5px; */
	overflow: hidden;
}

.second-left {
	float: left;
	width: 188px;
	display: inline-block;
}

.second-middle {
	float: left;
	width: 510px;
	overflow: hidden;
}

.second-right {
	position: relative;
	float: left;
	width: 250px;
	margin-left: 12px;
	display: inline;
	overflow: hidden;
}

.se-left-div {
	float: left;
	position: relative;
	width: 178px;
	height: 190px;
	overflow: hidden;
	margin-right: 10px;
	display: inline;
	background: url(../resources/images/arts/sub_bg.png) -5px -5px no-repeat;
	z-index: 1;
}

.se-left-dl dt {
	position: relative;
	width: 178px;
	height: 40px;
	background: url(../resources/images/arts/titPlayCategory.gif) 15px 15px no-repeat;
	top: -4px;
	margin-bottom: 5px;
}

.se-left-dl span.tit {
	display: none;
	font-size: 0;
}

.se-left-dl dt span.num {
	position: absolute;
    right: 80px;
    top: 12px;
    color: #da6464;
    text-decoration: underline;
    font-family: tahoma;
    font-size: 15px;
    font-weight: bold;
    letter-spacing: -0.1em;
    text-align: right;
    display: inline-block;
}

.se-left-div .last {
	position: absolute;
	bottom: -1px;
	width: 178px;
	height: 21px;
	display: inline-block;
	overflow: hidden;
	background: url(../resources/images/arts/sub_bg.png) -5px -481px no-repeat;
	font-size: 0;
	z-index: 2;
}

.se-left-bottom {
	margin-left: 4px;
	float: left;
	display: inline-block;
	margin-top: 2px;
	font-size: 0;
	left: 0px;
	border: 1px solid #d5d5d5;
}

.se-left-bottom img {
	height: 37px;
	width: 145px;
	margin: 11px;
}

.img-event {
	z-index: 1;
	background: url(../resources/images/arts/quadrangle.png);
	background-size: 102% 101%;
}

.middle-bar {
	position: relative;
	width: 510px;
	height: 151px;
	overflow:hidden;
	display: block;
	background: url(../resources/images/arts/sub_bg.png) -16px -638px no-repeat transparent;
	z-index: 1;
}

.middle-middle {
	position: absolute;
	top: 1px;
	left: 1px;
}

body, h1, h2, h3, h4, h5, h6, form, div, em, img, ul, li, ol, fieldset,
	label, dt, p {
	padding: 0;
	margin: 0;
	border: 0;
}

.middle-middle img {
	width: 373px;
	height: 149px;
	z-index: 5;
}

.middle-bar ul {
	position: absolute;
	width: 150px;
	z-index: 10;
	right: 0px;
	top: 1px;
	margin-top: 2px;
	margin-bottom: 0px;
	height: 151px;
}

.middle-bar ul li {
	/* width: 150px;
      height: 24px;
      overflow: hidden;
      line-height: 200%;
      margin-bottom: -4px;
      display: inline-block; */
	width: 150px;
	height: 24px;
	overflow: hidden;
	/* line-height: 200%; */
	margin-bottom: -4px;
    margin-top: -1px;
	display: inline-block;
	line-height: 24px;
}

.color {
	background: #c21111;
}

.font-color {
	
}

.middle-bar ul li a {
	width: 150px;
	height: 24px;
	display: inline-block;
	text-align: left;
	color: black;
	/* #6c6d6f; */
}

A:visited {
	COLOR: #4F4F4F;
	TEXT-DECORATION: none;
}

A:link {
	COLOR: #4F4F4F;
	TEXT-DECORATION: none;
}

.middle-bar ul li a span {
	display: block;
	font-size: 12px;
	padding: 2px 0 0 26px;
	letter-spacing: -0.1em;
	height: 24px;
	line-height: 24px;
	font-weight: 700;
	text-size-adjust: 100%;
}

i {
	display: inline-block;
	position: absolute;
	margin-left: 10px;
	margin-top: 8px;
	color: white;
}

.wOpen {
	position: relative;
	margin-top: 8px;
}

.se-middle-bottom dt {
	height: 21px;
	font-size: 0;
}
.wOpen .btn_more {
    position: absolute;
    right: 7px;
    top: 1px;
}
.se-middle-bottom span {
	position: absolute;
	right: 7px;
	top: 1px;
}

.se-middle-bottom dd {
	position: relative;
	padding-top: 8px;
	width: 510px;
	height: 60px;
	overflow: hidden;
	vertical-align: top;
}

.se-middle-bottom dd {
	position: relative;
	padding-top: 8px;
	width: 510px;
	height: 60px;
	overflow: hidden;
	vertical-align: top;
}

.se-middle-bottom ul {
	display: block;
	width: 540px;
	height: 60px;
	text-align: left;
}

.se-right-div {
	position: relative;
	border: 1px solid #d5d5d5;
}

.se-right-bottom {
	position: relative;
	margin-top: 10px;
	display: block;
}

.se-right-bottom img {
	height: 90px;
	width: 250px;
	border: 1px solid #d5d5d5;
}

.se-right-div ul {
	list-style-type: none;
	display: inline;
}

.se-right-dl {
	margin-top: 5px;
	float: left;
}

.se-right-div dt {
	margin-left: 22px;
}

.se-right-dd {
	position: absolute;
	top: -4px;
	right: 27px;
	border-bottom: 1px solid #d5d5d5;
}

.se-right-dd ul li {
	display: block;
	float: left;
	height: 34px;
}

.se-right-dd ul li.selected {
	border-bottom: 2px solid #595959;
	height: 34px;
}

.se-right-dd ul li a {
	font-size: 11px;
	line-height: 38px;
	letter-spacing: -1px;
	color: #999;
	display: block;
	text-align: center;
	padding: 0 6px 0 7px;
	text-decoration: none;
}

ol.ranking {
	text-align: left;
	padding-bottom: 2px;
}

ol.ranking li {
	width: 260px;
	position: relative;
	font-size: 0;
	line-height: 0;
	height: 19px;
	width: 250px;
	overflow: hidden;
	color: #6c6d6f;
	display: inline-block;
	vertical-align: top;
}

ol.ranking li span.num {
	display: block;
	width: 21px;
	height: 13px;
	background: url(../resources/images/arts/subRankNum.gif) 0 0 no-repeat;
	top: 0px;
	position: absolute;
	left: 23px;
}

ol.ranking li span.num1 {
	background-position: 0 0;
}

ol.ranking li span.num2 {
	background-position: 0 -19px;
}

ol.ranking li span.num3 {
	background-position: 0 -38px;
}

ol.ranking li span.num4 {
	background-position: 0 -57px;
}

ol.ranking li span.num5 {
	background-position: 0 -76px;
}

ol.ranking li span.name {
	position: absolute;
	left: 59px;
	top: -2px;
	font-size: 12px;
	width: 165px;
	line-height: 130%;
	letter-spacing: -0.1em;
	text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	overflow: hidden;
	white-space: normal;
	height: 21px;
}

ol.ranking li span.name a {
	display: inline-block;
	width: 170px;
}

.third-wrap {
	position: relative;
	clear: both;
	width: 100%;
	margin-top: 10px;
	top: 117px;
	border-top: 2px solid #6b6f81;
}

.third-issue {
	position: relative;
	overflow: hidden;
	padding-bottom: 10px;
	display: block;
	_display: inline-block;
	border: 1px solid #cdcdcd;
	border-top: none;
	background: url(../resources/images/arts\bg_gr_gray.gif) bottom left repeat-x;
}

.third-issue p.tit {
	position: relative;
	padding: 12px 15px 7px 13px;
}

.third-issue .third-list {
	position: relative;
	margin: 0 0 7px 18px;
	display: inline-block;
}

.third-issue dt.issue-obj {
	position: relative;
	float: left;
	width: 115px;
	height: 200px;
	display: inline-block;
	
}
.bg{
	background: url(../resources/images/arts/bg_off_poster.gif) top center no-repeat;
}
.third-issue dt.issue-obj a {
	position: relative;
	width: 115px;
	height: 188px;
	display: inline-block;
	text-decoration: none;
}

.issue-obj div.thmb {
	position: relative;
	display: inline-block;
	width: 95px;
	height: 130px;
	top: 12px;
	left: 10px;
}

.issue-obj div.thmb img {
	position: absolute;
	z-index: 1;
	cursor: pointer;
	border: 1px solid #ececec;
	width: 97px;
    height: 118px;
}

.issue-obj p.info {
	position: absolute;
	
	text-align: center;
	cursor: pointer;
	left: 4px;
    width: 108px;
}
.issue-obj p.info.display{
	display: none;
}

.issue-obj p.info .txt1 {
	display: block;
	font-weight: bold;
	height: 19px;
	overflow: hidden;
	letter-spacing: -0.1em;
	margin-top: 8px;
}

.issue-obj p.info .txt2 {
	display: block;
	font-size: 11px;
	color: #adadad;
	height: 12px;
	overflow: hidden;
	letter-spacing: -0.1em;
	margin: 2px 0;
}

.issue-obj p.info .txt3 {
	
	font-size: 11px;
	color: #6c6d6f;
	height: 12px;
	overflow: hidden;
	letter-spacing: -0.1em;
}

.third-issue-on {
	
    float: left;
    top: 5px;
    left: 0px;
	
    width: 115px;
    margin-left: -115px;
	height: 188px;
	display: inline;
	background: url(../resources/images/arts/bg_over_poster.gif) top center no-repeat;
}

.third-issue-on .thumb {
	position: relative;
	display: inline-block;
	width: 95px;
	height: 123px;
	top: 7px;
	left: 10px;
}

.third-issue-on .thumb img {
	position: absolute;
	z-index: 1;
	width: 97px;
    height: 123px;
	/* border: 1px solid #c21818; */
}

.third-issue-on p.info {
	position: relative;
	
	display: inline-block;
	text-align: center;
	width: 116px;
}

.third-issue-on .info span.txt1 {
	display: block;
	width: 115px;
	font-weight: bold;
	color: #FFF;
	position: relative;
	    top: -4px;
	height: 14px;
	overflow: hidden;
	letter-spacing: -0.1em;
	margin-top: 5px;
	line-height: 130%;
}

.third-issue-on .info span.txt2 {
	display: block;
	font-size: 11px;
	color: #fff;
	height: 12px;
	overflow: hidden;
	position: relative;
	 top: -6px;
	letter-spacing: -0.1em;
	margin: 2px 0;
}
button.plue{
	display: block;
	width:95%;
	padding :10px;
	margin: 0px 3px 0px 29px;
	
}
.wOpen dd {
    position: relative;
    padding-top: 8px;
    width: 510px;
    height: 60px;
    overflow: hidden;
    vertical-align: top;
}
.wOpen dt {
	height: 21px;
	font-size: 0;
}

.third-issue-on .info .btn {
	display: block;
	margin-top: -8px;
}
.wOpen dd iframe {
	display: block;
	width: 540px;
	height: 60px;
	text-align: left;
}
</style>
<script>
	var pageNo = 1;
    $(function(){
    	page();
    	
      $(".Tposter").hover(function(){
        $(this).addClass("img-event");
      }, function(){
        $(this).removeClass("img-event");
      })
      
      $(".middle-bar ul li").hover(function(){
    	 
        $(this).addClass("color");
        var id = $(this).attr("id").replace("random-","");
        $(".middle-bar ul li.color").prepend("<i class='fas fa-caret-left'></i>");
        if($(".middle-bar ul li").is(".color")){
        	$("#img-first").hide();
        	$("#img-"+id+"").show();
          $(".middle-bar ul li.color a span").css("color","white");
        }
        
      }, function(){
        $(this).removeClass("color");
        var id = $(this).attr("id").replace("random-","");
        $("#img-"+id+"").hide();
        $("#img-first").show();
        $("i").removeAttr("class");
        $(".middle-bar ul li a span").css("color","black");
       
      })
      
      $(".se-right-dd a").click(function(event){
        
        event.preventDefault();
      })
      
      $(".se-right-dd ul li").click(function(){
        $(".se-right-dd ul li").removeClass("selected");
        $(this).addClass("selected");
      });
      
      $(".ranking li").find("a").hover(function(){
        $(this).css('color','red');
      },function(){
        $(this).css("color",'');
      });
      
      
      
      rolling();
	  //setInterval(rolling,3000);	
	  var no;
	  $("div").on("mouseenter","[id^='issue-obj']",function(){
		  $("[id^=art-img]").attr("style","display:none");
		  $("[class^=issue-obj]").find(".info").removeClass("display");
			no = $(this).attr("id").replace("issue-obj-","");
			 if($("#issue-obj-"+no+"").has(".bg")){
		    	   $("#issue-obj-"+no+"").removeClass("bg"); 
		    	   $("#issue-obj-"+no+"").find(".info").addClass("display");
		    	  
		    	  
		    	 }
		    	 $("#art-img-"+no+"").attr("style","display:block"); 
		}).on('mouseleave', function() {
			$("[id^=art-img]").attr("style","display:none");
			 $("[class^=issue-obj]").find(".info").removeClass("display");
	    	 $("[class^=issue-obj]").addClass("bg");
		});
    
     
     /* 
     timeId= setInterval(rolling,3000);
      
     
     function pictureOver(date){
 		clearInterval(timeId);
 	}
 	function pictureOut(date){
 		timeId = setInterval(rolling,1000);
 	}
 	
 	 */
 	
    });
    function page(){
 		pageNo = (pageNo || 1);
 		var countPerPage = 10;
 		
 		$.ajax({
 			type:"get",
 			url:"pagePlus.do",
 			dataType:"json",
 			data: {countPerPage:countPerPage,  pageNo:pageNo},
 			success : function(result){
 				console.log(result);
 				 var html = "";
 				 $.each(result, function(index,item){
 					 var no = index;
 					
 					html +=  '<dt class="issue-obj bg"  id="issue-obj-'+item.no+'" style="display: block">';
					html	+=	'<a href="detail.do?concertno='+item.no+'">';
					html	+=	'<div class="thmb">';
					html	+=	'<img src="../resources/images/concerts/'+item.coverImg +'" alt='+item.title +'>';
					html	+=	'</div>';
					html	+=	'<p class="info">';
					html	+=	'<span class="txt1">'+item.title +'</span>' ;
					html	+=	'<span class="txt2">';
							$.each(item.halls,function(index,hall){
					html	+=		hall.name;
							})
					html	+=	'</span>' ;
					html	+=	'<span class="txt3">'+item.price +'</span>';
					html	+=	'</p>';
					html	+=  '</a>';
					html	+=	'</dt>';
				
					html	+= 	'<dt  class="third-issue-on" id="art-img-'+item.no +'" style="display: none;">';
					html	+=	'<div class="thumb">'
					html	+=	'<a href="detail.do?concertno='+item.no+'"> <img src="../resources/images/concerts/'+item.coverImg +'" alt='+item.title +'>';
					html	+=	'</a>';

					html	+=	'</div>';
					html	+=	'<p class="info">';
					html	+=	'<span class="txt1">'+item.title+'</span>'  ;
					html	+=	'<span class="txt2">'+item.price +'</span>' ;
					html	+=	'<span class="btn"> <a href="#"><img src="../resources/images/arts/btn_aticle.gif" alt="가사"> </a> <a href="#">';
					html	+=									'<img src="../resources/images/arts/btn_mv.gif" alt="영상"> </a> <a href="#">';
					html	+=									'<img src="../resources/images/arts/btn_review.gif" alt="후기"> </a>';
					html	+=	'</span>';
					html	+=	'</p>';
					html	+=	'</dt>';              
					
					
					
 				})
 				$("#art-list").append(html);
 				if(result.length<9){
 					$("#btn-div").empty();
 					
 				}
 			pageNo++;
 		}	
 			
 		})
 		
 	}	
   
    var art = [];
    var loopIndex =0;
  
    function rolling(){
    		 var arts = $("[id^=art-img]");
    	     var number = arts.length;
    	    $.each(arts,function(index, item){
    	  	  art[index] = $(item).attr('id').replace("art-img-","");
    	  
    	    })
    	 var index = loopIndex % number;
    	 changeArt(index);
    	 loopIndex++;
    }
      
      function changeArt(index){
    	 $("[id^=art-img]").attr("style","display:none");
    	
    	 $("[class^=issue-obj]").find(".info").removeClass("display");
    	 $("[class^=issue-obj]").addClass("bg");
    	
    	 var objNo = art[index];
    	// objNo = objNo.replace("art-img-","");
    	 if($("#issue-obj-"+objNo+"").has(".bg")){
    	   $("#issue-obj-"+objNo+"").removeClass("bg"); 
    	   $("#issue-obj-"+objNo+"").find(".info").addClass("display");
    	  
    	  
    	 }
    	 $("#art-img-"+objNo+"").attr("style","display:block"); 
      }  
   

 	
    
  </script>
</head>
<body>

	<div class="container">
		<div class="wrapBody">
			<div class="Con_ST">
				<div class="wrap_Tview">
					<c:forEach items="${artsByDate}" var="artByDate">
						<dl class="Tview">
						<dt class="Tposter">
							<a
								href="detail.do?concertno=${artByDate.no }">
								<span class="thumb"><img
									src="../resources/images/concerts/${artByDate.coverImg }"
									width="123" height="150" alt="${artByDate.title }이미지"></span> <span
								class="info"><span class="txt1"></span><span
									class="txt2">평일 문화지원 전석 60%</span></span>
							</a>
						</dt>
						<dd>
							<span class="txt1">${artByDate.title }</span><span class="txt2">
							<c:forEach items="${artByDate.halls}" var="hall" varStatus="1">
							${hall.name }
							</c:forEach>
							</span><span
								class="txt3"><fmt:formatDate value="${artByDate.openDate }"/>~ <fmt:formatDate value="${artByDate.closeDate }"/> </span>
						</dd>
					</dl>
					
					
					
					</c:forEach>
					
				
				</div>
			</div>
			<div class="performance-second">
				<div class="second-left">
					<div class="se-left-div">
						<dl class="se-left-dl">
							<dt>
								<span class="tit"></span> <span class="num">${artByCount }</span>
							</dt>
							<dd>
								<a href="#"></a>
							</dd>
						</dl>
						<p class="last"></p>
					</div>
					<div class="se-left-bottom">
						<a href="#"><img src="../resources/images/arts/hta.PNG" alt="hta"> </a>
					</div>
				</div>

				<div class="second-middle">
					<div class="middle-bar">

						<div class="middle-middle">
							<img src="../resources/images/arts/solo.png" id="img-first">
						<c:forEach items="${randomConcerts }" var="randomConcert">
							<img src="../resources/images/concerts/${randomConcert.coverImg }" id="img-${randomConcert.no }" style="display: none;">
						</c:forEach>
						</div>
						<ul>
						<c:forEach items="${randomConcerts }" var="randomConcert">
							<li id="random-${randomConcert.no }"><a href="detail.do?concertno=${randomConcert.no }"><span>${randomConcert.title }</span></a></li>
						</c:forEach>
						</ul>

					</div>
					<dl class="wOpen">
						<dt>
							<span class="btn_more"><a href="../open/openTicket.do"><img src="../resources/images/arts/btn_more.gif"
									alt="더보기"></a></span> <img src="../resources/images/arts/tit_open.gif" alt="티켓오픈공지">
						</dt>
						<dd>
							<iframe src="/jhta/art/openIfream.do" scrolling="no" frameborder="0" title="티켓오픈소식">
	
							
							</iframe>

						</dd>
					</dl>


				</div>


				<div class="second-right">
					<div class="se-right-div">
						<dl class="se-right-dl">
							<dt>
								<img src="../resources/images/arts/rankTitle.gif" alt="랭킹">
							</dt>
							<dd class="se-right-dd">
								<ul>
									<li><a href="#">전체</a></li>
									<li><a href="#">스테디셀러</a></li>
									<li><a href="#">리미티드런</a></li>
								</ul>
							</dd>
						</dl>
						<ol class="ranking">
						<c:forEach items="${arts }" var="art" varStatus="status" begin="1" end="5">
							<li><span class="num num${status.count }"></span> <span class="name"><a
									href="detail.do?concertno=${art.no }">${art.title }-
									<c:forEach var="hall" items="${art.halls }">
									${hall.name }
									</c:forEach></a> </span></li>
						</c:forEach>
							
						</ol>
					</div>
					<div class="se-right-bottom">
						<p>
							<a href="#"> <img src="../resources/images/arts/wnet.PNG" alt="right-logo">
							</a>
						</p>

					</div>


				</div>
			</div>
			<div class="third-wrap">
				
				<div class="third-issue">
					<p class="tit">
						<img src="../resources/images/arts/tit_concert_hot.gif" alt="title">
					</p>
					<div style="margin: 3px 31px 0px 32px">
					<dl class="third-list" id="art-list">
					
					</dl>
					<div id="btn-div">
						<button class="ejobtn ejobtn-success plue" id="btn-plus" onclick="page();">
							더보기
						</button>
					</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>