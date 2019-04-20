<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <%@ include file="../include/main-nav.jsp"%>
  <style>
  a {
    color: #666;
    text-decoration: none;
  }

  A:visited {
    COLOR: #4F4F4F;
    TEXT-DECORATION: none;
  }
  A:link {
    COLOR: #4F4F4F;
    TEXT-DECORATION: none;
  }

  li{
    list-style:none;
  }
  .wrap_for_u{
    min-height : 600px;
    margin-top : 26px;
  }
  .box_planner{
    float : left;
    position : relative;
    width: 640px;
  }
  .planner_title{
    display : block;
    width:100%;
    height:54px;
    font-size : 20px;
    line-height : 54px;
  }
  .fnSlider,.inner{
    position : relative;
    width : 100%;
    height : auto;
    overflow: hidden;
  }

  ul.list_planner{
    width: 6575px;
    height: auto;
    left: 0px;

  }
  ul.list_slider{
    position : relative;
    padding-left: 0px;
  }
  .plannerUser{
    height : 123px;

  }
  ul.list_planner li{
    float:left;
    position:relative;
    padding: 0px 34px 0px 0px;

    display: inline-block;
  }
  ul.list_planner li:first-child {
    margin-left: 0;
  }
  ul.list_planner li a {
    display: block;
    width: 100px;
    height: auto;
  }


  .plannerUser a.on{

  }
  a span.foru_all{

  }
  ul.list_planner li .txt {
    display: block;
    margin-top: 6px;
    text-align: center;

    font-size: 16px;
    line-height: 19px;
    letter-spacing: -0.5px;
    white-space: nowrap;
  }
  .list_planner img{
    height:100px;
    width:100px
  }
  .control.page{

    right: 29px;
    font-size: 13px;
    letter-spacing: 0;
    color: #888;
    top: 42px;
  }
  .control.page .prev{
    width: 22px;
    height: 22px;
    text-align: center;
  }


  .program_plan{
    letter-spacing: -0.5px;
  }
  .program_plan h3{
    font-size : 18px;
    font-weight: normal;
  }
  .program_plan h3 em{
    color :#e30076;
    display: inline-block;
    overflow : hidden;
    vertical-align: top;
    max-weight : 350px;

  }
  .program_plan.nothing ul.list_history {
    display: none;

  }
  .guide_txt{
    margin-top: 5px;
    font-size : 12px;
    color : #aaaaaa;
  }
  .program_plan ul.list_history {
    overflow: hidden;
    margin-top: 10px;
    padding-left: 0px;
  }
  .program_plan ul.list_history li.depth_year:first-child{
    background-image: url(../resources/images/forU/foru_planner_bar_end2.png);
  }
  .program_plan ul.list_history li:last-child {
    background-image: url(../resources/images/forU/foru_planner_bar_end2.png);
  }
  .program_plan ul.list_history li.depth_year {
    font-size : 16px;
    color : #888888;
    background-position: 0 -14px;
  }
  .program_plan ul.list_history li {
    overflow: hidden;
    position: relative;
    padding: 15px 0 15px 30px;
    background: url(../resources/images/forU/foru_planner_bar2.png) left -62px no-repeat;
  }
  .program_plan ul.list_history li a {
    display: inline-block;
  }
  .wrap_program .box_planner .program_plan ul.list_history li h4.subject {
    font-size: 18px;
    font-weight: normal;
    color: #333;
  }
  div.innerBox{
    overflow:hidden;
    position: relative;
    margin-top: 10px;
    height: 125px;
    width: 550px;
  }
  div.innerBox .frame{

  }
  div.innerBox img{
    weight:90px;
    height: 120px;
    float: left;
    margin-right: 20px;
    vertical-align: top;
  }
  div.innerBox .detail {
    display: block;
    margin-top: 10px;
    font-size: 14px;
    line-height: 18px;
    color: #888;
  }
  .program_plan ul.list_history li div.innerBox .txt_tit {
    display: block;
    width: 550px;
    margin-top: 8px;
    font-size: 20px;
    line-height: 120%;
    font-weight: normal;
    color: #333;
  }
  .program_plan.nothing ul.list_history.noList {
    display: block;
    padding-left: 0px;
    width : 96%;
  }
  .program_plan ul.list_history.noList {
    display: none;
    padding-left: 0px;
    width : 96%;
  }

  .program_plan.nothing ul.list_history.noList li {
    overflow: hidden;
    position: relative;
    height: 262px;
    padding: 15px 0 15px 30px;
    font-size: 18px;
    color: #333;
    background: url(../resources/images/forU/foru_noPlanner_bar.png) left 20px no-repeat;
  }
  .program_plan.nothing ul.list_history.noList li .box_msg {
    padding: 28px 0;
    margin-top: 20px;
    border: 1px solid #eee;
    text-align: center;
  }
  .program_plan.nothing ul.list_history.noList li .box_msg p {
    line-height: 135%;
  }
  .program_plan.nothing ul.list_history.noList li .box_msg a.btn_no_radius_43_gray {
    display: inline-block;
    margin-top: 20px;
    border: 1px solid #aaa;
    border-radius: 45px;
  }
  .program_plan.nothing ul.list_history.noList li span{
    display: inline-block;
    font-size: 13px;
    color: #666666;
    text-align: center;
    padding: 11px 31px 12px 31px;
  }

  /* 오른쪽 배너 */
  .box_aside{
    float: left;
    width: 280px;
    margin-left: 68px;
  }
  .wrap_for_u .box_recomm{
    position: relative;
    width: 100%;
  }
  .tit_sub_float{
    display: block;
    width: 98%;
    height: 42px;
    margin-left: 4px;
    font-size: 20px;
    line-height: 54px;
    text-align: left;
    font-weight: bold;

  }
  .wrap_slider{
    position: relative;
  }
  .fnSlider.full{
    position: relative;
    podding-top:0px;

  }
  .wrap_for_u .box_recomm .wrap_slider.noScene {
    display: none;
  }

  .fnSlider .inner {
    overflow: hidden;
    position: relative;
    width: 100%;
    height: auto;
}
.wrap_for_u .box_recomm .slider_recomm ul {
    overflow: hidden;
}
.fnSlider.full ul.list_slider {
    overflow: hidden;
    position: relative;
    height: 328px;
}

.wrap_for_u .box_recomm .slider_recomm ul li {
    padding: 1px 0 0;
    text-align: center;
    width: 280px;
  }
  .fnSlider.full ul.list_slider li{
    float: left;
  }
  .wrap_for_u .box_recomm .slider_recomm ul li .info{
    height: 131px;
  width: 280px;
  padding: 19px 19px 19px 19px;
  margin-top: -1px;
  border: 1px solid #eee;
  font-size: 18px;
  line-height: 135%;
  background: #fafafa;

  }
  .wrap_for_u .box_recomm .slider_recomm ul li .info .subject {
    display: block;
    margin-top: 2px;
}
.wrap_for_u.box_recomm .slider_recomm ul li .info .btn_like_radius_off, .wrap_program .box_recomm .slider_recomm ul li .info .btn_like_radius {
    display: inline-block;
    margin-top: 17px;
    width: 160px;
    height: 42px;
}
.btn_like_radius_off span {
    display: inline-block;
    overflow: hidden;
    height: 19px;
    margin: 12px 4px 12px 41px;
    font-size: 13px;
    line-height: 20px;
    color: #666666;
    vertical-align: top;
}
.btn_like_radius_off span.on {
    color: black;
}
.btn_like_radius_off.on{
  background: url(../resources/images/forU/ico_planner2.png) no-repeat right 0;
}

a.btn_like_radius_off{
  top: 18px;
    position: relative;

    display: inline-block;
    margin-top: 0px;
    width: 160px;
    height: 42px;

}
.btn_like_radius_off {
  background: url(../resources/images/forU/ico_planner2.png) no-repeat 0 0
}
/* 맞춤공연 위 화살표 */
.box_interest.page{
  position: absolute;
  top: 20px;
  right: 0px;
  height: 22px;
  text-align: center;
}
.box_interest .prev, .box_interest .next{
  display: inline-block;
  width:22px;
  margin-left: 0 0px 0 0;
  vertical-align: top;
}
.box_interest .big{
  display: inline-block;
  font-size: 14px;
  line-height: 22px;
  color: #000;
  letter-spacing: 0;
  vertical-align: top;
}
  </style>
  <script type="text/javascript">
  $(function(){

	 $("a[id^='btnAddPlanner_']").click(function(event){
		 event.preventDefault();
		 var concertNo = $(this).attr("id").replace("btnAddPlanner_","");
		 
		 $.ajax({
			 type:"get",
			 url:"../art/addPlanner.do",
			 data:{concertNo:concertNo},
			 dataType:"json",
			 success:function(result){
				location.href = "form.do";
			 }
		 })
		 
	 }) 
	  
	  
	  
    $("[id^=btnAddPlanner]").click(function(event){
      event.preventDefault();
      if($(this).is(".btn_like_radius_off.on")){
        $(this).removeClass("on");
        $(this).find("span").removeClass("on");
      } else{
        $(this).addClass("on");
        $(this).find("span").addClass("on");
      }
    })
    
   
     if(${empty planners}){
    	$(".program_plan").addClass("nothing");
    }
    
    if(${empty concerts}){
    	$("#empty-recent").removeClass("noScene");
    	$("#next-btn").text(1);
    	
    }else {
    	$("#empty-recent").addClass("noScene");
    	var countByconcert = ${countConcert};
    	$("#next-btn").text(countByconcert);
    }
  });
  
  var slideIndex = 0 ;
  showSlides();
    function plusSlides(n) {
    	  btnSlides(slideIndex += n);
    	}
    function btnSlides(n) {   	
        var i;
        var slides = $("[id^='listPlanner']").find("li");
       
        $.each(slides,function(index,item){
        	$(item).attr("style","display:none");
        })
        
        if (n > slides.length) {slideIndex = 1}    
        
        if (n < 1) {slideIndex = slides.length}
        if (slideIndex == 0){ slideIndex = 1;}
        $("[id^='listPlanner']").find("li:nth-child("+(slideIndex )+")").attr("style","display:block");
        $("#prev-btn").text(slideIndex);
        slideIndex=n;
    }
    
    function showSlides() {   	
        var slides = $("[id^='listPlanner']").find("li");
       
        $.each(slides,function(index,item){
        	$(item).attr("style","display:none");
        })
        
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}    
        if (slideIndex < 1) {slideIndex = slides.length}
        $("[id^='listPlanner']").find("li:nth-child("+(slideIndex)+")").attr("style","display:block");
        $("#prev-btn").text(slideIndex);
        setTimeout(showSlides, 2000); // Change image every 2 seconds
    }
//이미지 로딩 실패
var NO_IMAGE_URL = '../resources/images/forU/Noimage_%%W%%x%%H%%.png';
function noImage(o, width, height)
{
    var _NO_IMAGE_URL =  NO_IMAGE_URL.replace(/%%W%%/g, width).replace(/%%H%%/g, height);

    o.src = _NO_IMAGE_URL;
    o.width = width;
    o.height = height;
    o.onerror = null;
}
  
  </script>
</head>
<body>

  <div class="container">
    <div class="wrap_for_u">

      <div class="box_planner">
     
        <h2 class="planner_title">공연 플래너</h2>
   <!--
      <div class="control page" style="display: block;">
      <a class="prev" href="#"><span>&lt;</span></a>
      <span class="now">1</span>
      /
      <span class="total">2</span>
      <a class="next" href="#"><span>&gt;</span></a>
    </div>


    <div class="fnSlider">
    <div class="inner">
    <ul class="list_planner list_slider">
    <li class="plannerUser" style="height:123px;">
    <a href="#" class="on">
    <span class="foru_all">
    <img src="images/foru_all_sample.png" alt="" >
  </span>
  <span class="txt">나의 일정</span>
</a>
</li>



<li>
<a href="#">
<img src="images/foru_all_sample.png" alt="">
<span class="txt"></span>
</a>
</li>

<li>
<a href="#">
<img src="images/foru_all_sample.png" alt="">
<span class="txt"></span>
</a>
</li>


<li>
<a href="#">
<img src="images/foru_all_sample.png" alt="">
<span class="txt">ff</span>
</a>
</li>

<li>
<a href="#">
<img src="images/foru_all_sample.png" alt="">
<span class="txt"></span>
</a>
</li>

<li>
<a href="#">
<img src="images/foru_all_sample.png" alt="">
<span class="txt"></span>
</a>
</li>

</ul>
</div>

</div>
-->
<!-- 티켓오픈 날짜 -->
<div class="program_plan" id="scheduleSection"><!-- <div class="program_plan nothing"> 공연일정이 없을 경우: "nothing" 클래스 추가 -->
  
  <div class="row">
  	<div class="col-xs-12">
  		<div class="panel panel-default">
  			<div class="panel-heading">
  				<h3><em id="plannerTrgtNm"><c:if test="${!empty LOGIN_USER }">${LOGIN_USER.nickname }</c:if> </em> 
  				<span id="plannerTrgtNm2"> 님을 위한 공연일정입니다.</span></h3>
  			</div>
  			<div class="panel-body"> 
  				<p class="guide_txt">공연플래너에 담은 공연과 선호 아티스트의 공연스케줄을 타임라인으로 확인해보세요.<br>
    					멜론티켓 앱에서 티켓오픈 1시간전 알림서비스를 이용하실 수 있습니다.</p>
  			</div>
  		</div>
  	</div>
  </div>
  
  
    
  
    		 
   <!-- //"program_plan nothing"일 경우 노출 -->
    <c:if test="${empty planners }">
    	<div class="row">
    		<div class="col-xs-12">
    			<div class="panel ejopanel-default">	
    				<div class="ejopanel-heading">등록한 플래너</div>
    				<div class="panel-body">
    					<ul class="list_history noList" id="empty_list">
		                  <li>
		                    <!-- <h4 class="year">2015년</h4> -->
		                    <div class="box_msg">
		                    
		                      <p>선호아티스트와 공연지역이 동시에 매칭되는 공연이 없네요.</p>
		                      <p>곧 좋은 공연을 준비하여 알려드리겠습니다.</p>
		
		                      <a href="../region/index.htm" class="btn_flexible2 btn_no_radius_43_gray"><span>테마/지역별 공연보기</span></a>
		                    </div>
		                  </li>
               			 </ul>
    				</div>
    			</div>
    			
    		</div>
    	</div>
    </c:if>
    <jsp:useBean id="now" class="java.util.Date" />
    <c:set var="sysdate"><fmt:formatDate value="${now }" pattern="yyyy.MM.dd"/> </c:set>	
    <ul class="list_history" id="plannerSchedule">
		<c:forEach items="${planners }" var="planners">
		 	<c:set var="TicketOpenDate"><fmt:formatDate value="${planners.concert.ticketOpenDate }" pattern="yyyy"/> </c:set>
			<c:set var="planners_ticketOpenDate"><fmt:formatDate value="${planners.concert.ticketOpenDate }" pattern="yyyy.MM.dd"/> </c:set>
			<c:if test="${TicketOpenDate ne OpenTicketDate}">
				<li class="depth_year"><fmt:formatDate value="${planners.concert.ticketOpenDate}" pattern="yyyy"/> 년</li>
			</c:if>
			<li>
				 <c:choose>
               	 	<c:when test="${planners.concert.category.no eq 1 }">
              	 		<a href="../con/detail.do?conNo=${planners.concert.no}">
						
               	 	</c:when>
            		<c:otherwise>
            			<a href="../art/detail.do?concertno=${planners.concert.no}">
             			
             		</c:otherwise>
                 </c:choose>
				<div class="panel ejopanel-default">
					<h4 class="subject">
					
					<c:choose>
						<c:when test="${sysdate lt planners_ticketOpenDate }">
							<div class="ejopanel-heading">
							티켓오픈예정
							</div>
						</c:when>
						<c:otherwise>
							<div class="ejopanel-heading">
							티켓오픈완료
							</div>
						</c:otherwise>
					</c:choose>
					
					
					</h4>
					<div class="panel-body">
					<div class="innerBox" >
						<span class="frame"></span><img
							src="../resources/images/concerts/${planners.concert.coverImg }"
							alt="${planners.concert.title }" onerror="noImage(this, 90, 125)"
							style="width: 90px; height: 120px;"> <span
							class="detail"> 판매기간 : ~ <!--                                 <em>취향설정한</em> -->
							<fmt:formatDate value="${planners.concert.ticketCloseDate }" pattern="yyyy.MM.dd"/>
						</span> <span class="txt_tit">${planners.concert.title }</span>
					</div>
					</div>
					</div>
				</a>
			</li>
			<c:set var="OpenTicketDate"><fmt:formatDate value="${planners.concert.ticketOpenDate }" pattern="yyyy"/> </c:set> 
		
		</c:forEach>
	 </ul>
     <!-- "program_plan nothing"일 경우 노출 -->
               
     </div>
    </div>



            <!-- 오른쪽 -->
            <div class="box_aside">
              <div class="box_recomm "><!-- <div class="box_recomm nothing"> 공연이 없을 경우: "nothing" 클래스 추가 -->
                <h2 class="tit_sub_float">맞춤 공연</h2>

                <div class="box_interest page">
                  <a class="prev" href="#" onclick="plusSlides(-1)"><span>
                  <img src="https://img.icons8.com/color/32/000000/circled-chevron-left.png" style="width: 20px; height: 20px;">
                  </span></a>
                  <span class="now big" id="prev-btn">1</span>
                  /
                  <span class="total big" id="next-btn">9</span>
                  <a class="next" href="#" onclick="plusSlides(1)"><span>
					<img src="https://img.icons8.com/color/32/000000/circled-chevron-right.png" style="width: 20px; height: 20px;">
					</span></a>
                </div>

                <!-- 추천 공연이 있을 경우 -->
                <c:choose>
                	<c:when test="${!empty concerts }">
                		<div class="wrap_slider">
		                  <div id="box_recomm01" class="slider_recomm fnSlider full">
		                    <div class="inner">
		                      <ul class="list_slider" id="listPlanner" style="width: 2520px; height: auto; left: 0px;">
		                        <c:forEach items="${concerts}" var="concert">
	                        	 <li id="choiceList">
	                        	 <c:choose>
	                        	 	<c:when test="${concert.category.no eq 1 }">
	                        	 		<a href="../con/detail.do?conNo=${concert.no}">
	                        	 		<span class="frame"></span>       		
	                     				<img src="../resources/images/concerts/${concert.coverImg}" alt="${concert.title}" onerror="noImage(this, 280, 395)" style="width: 280px;height: 395px;">
										</a>
	                        	 	</c:when>
	                     			<c:otherwise>
	                     				<a href="../art/detail.do?concertno=${concert.no}">
	                     				<span class="frame"></span>
	                            		<img src="../resources/images/concerts/${concert.coverImg}" alt="${concert.title}" onerror="noImage(this, 280, 395)" style="width: 280px;height: 395px;">
	                     				</a>
	                     			</c:otherwise>
	                        	 </c:choose>
                           			 
	                          		
	                          		<div class="info">
	                           			 <span class="subject">${concert.title}의 공연은?</span>
                            					<a id="btnAddPlanner_${concert.no }" class="btn_like_radius_off" data-json-string="{&quot;prodId&quot;:202569}">
                              					<span>공연플래너 담기</span>
                            					</a>
                          				</div>
                       				</li>
		                       	 </c:forEach>    
                           		</ul>
                       		</div>
                      	 </div>
                    </div>
               		</c:when>
               		<c:otherwise>
               			 <!-- 추천 공연이 없을 경우 -->
	                    <div class="wrap_slider noScene" id="empty-recent">
	                      <div id="box_recomm02" class="slider_recomm fnSlider full">
	                        <div class="inner">
	                          <ul class="list_slider" id="listPlanner">
	                          	<div class="row">
	                          		<div class="col-xs-12">
	                          			<div class="panel panel-default">
	                          				<div class="panel-heading">해당 추천공연이 없습니다.</div>
	                          			</div>
	                          		
	                          		</div>
	                          	</div>
	                          </ul>
	                        </div>
	                      </div>
	                    </div>
               		</c:otherwise>
                </c:choose>
                  </div>
                </div>
              </div>
            </div>
		
          </body>
          </html>
