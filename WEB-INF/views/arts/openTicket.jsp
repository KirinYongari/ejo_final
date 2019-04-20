<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<%@ include file="../include/main-nav.jsp"%>
  <style>


  A:visited {
    COLOR: #4F4F4F;
    TEXT-DECORATION: none;
  }
  A:link {
    COLOR: #4F4F4F;
    TEXT-DECORATION: none;
  }
  .content{
    display: block;
    position:relative;
    width:1008px;
    min-height: 600px;
    padding: 0 20px 53px;
    margin : 0 auto;
    /* border:1px solid black; */
  }
  .section_ticketopen_list{
    overflow:hidden;
    padding-top : 40px;

  }
  .wrap_ticketopen_banner{
    border: 1px solid #eee;
    padding: 19px 0 28px;
  }
  .section_ticketopen_list .box_hot_issue{
    position: relative;
    padding: 0 42px 0 43px;
  }
  .section_ticketopen_list .box_hot_issue .tit{
    font-size:18px;
    line-height:26px;
    color : #00b523;
    font-weight : bold;
  }
  .fnSlider.full {
    position: relative;
    padding-top: 0;
    min-height: 196px;
  }
  .fnSlider{
    overflow: visible;
    width: 100%;
    height: auto;
  }
  ul.list_slider.list_hot_issue{
    position: relative;
    display: block;
    padding-left: 0px;
  }
  .fnSlider .inner {
    overflow: hidden;
    position: relative;
    width:100%;
    height:auto;

  }
  .list_hot_issue{
    padding-top: 14px;
    display: inline;
  }
  .box_hot_issue .list_hot_issue li{
    overflow: hidden;
    float: left;
    padding-left: 0px;
    width: 890px;
  }
	.list_hot_issue li .cont .tit_consert {
    display: block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-height: 28px;
    margin-top: 9px;
    font-weight: normal;
    font-size: 15px;
    line-height: 28px;
    color: #333;  
}
.list_hot_issue li .cont .date {
    display: block;
    overflow: hidden;
    max-height: 28px;
    font-size: 15px;
    line-height: 20px;
    color: #00b523;
    
}


  .list_hot_issue li .cont a{
    display : block;
    height: auto;
    width: 160px;;
  }
  .list_hot_issue li .cont {
    width: 178px;
    float: left;
    /* padding-left: 32px; */
  }
  .list_hot_issue li .cont a>strong{
    display: block;
    width: 160px;
    overflow: hidden;
  }
  a>strong~span{
    display: block;
    overflow: hidden;
    max-height: 20px;
  }


  .list_slider.list_hot_issue .first{
    padding-left: 0;
  }
  .box_hot_issue .list_hot_issue .cont a .img {
    display: block;
    height: 225px;
    width: 160px;
    overflow: hidden;
  }
  .box_hot_issue .list_hot_issue .cont a .img img {

    width: 160px;

  }
  .control.page2{
    position: absolute;
    right: 0;
    height: 22px;
    text-align: center;
  }
  .box_hot_issue .control{
    top: -18px;
  }
  .fnSlider .page2 .prev{
    position: static;
    display: inline-block;
    width: 22px;
    height: 22px;
    margin: 0 0px 0 0;
    vertical-align: top;
  }
  .fnSlider .page2 .now.big {
    margin-right: 5px;
    color: #00b523;
  }

  .fnSlider .page2 span.slash {
    display: inline-block;
    margin-right: 5px;

    font-size: 14px;
    line-height: 22px;
    color: #000;
    letter-spacing: 0;
    vertical-align: top;
  }
  .fnSlider .page2 .big {
    display: inline-block;

    font-size: 14px;
    line-height: 22px;
    color: #000;
    letter-spacing: 0;
    vertical-align: top;
  }
  .fnSlider .page2 .prev, .fnSlider .page2 .next {
    position: static;
    display: inline-block;
    width: 22px;

    margin: 0 0px 0 0;
    vertical-align: top;
  }
  /*중간 티켓 검색 */
  .wrap_ticket_cont {
    overflow: hidden;
    padding-top: 30px;
  }
  .wrap_ticket_search{
    height: 34px;

    vertical-align: middle;
  }
  .ticket_box_select{
    position: relative;
    float: left;
    height: 34px;
    width: 140px;

  }
  .ticket_selectbox{
    position: relative;
    float: left;
    height: 34px;
    width: 140px;
    padding-left: 12px;
  }
  div.ticket_box_input input{
    margin: 0px 5px;
    height: 34px;
    width: 259px;
    padding: 0 15px;
    line-height: 32px;
  }
  div.ticket_box_input input~button{
    height: 34px;
  }
.box_ticket_cont{
  border-top: 1px solid #eee;
  margin-top: 20px;
}
.list_ticket_cont{
  list-style: none;
  margin-left: -40px;
}
.list_ticket_cont li {
  padding:10px 0 10px 265px;
  border-bottom: 1px solid #eee;
  min-height: 92px;
  position: relative;
}
.list_ticket_cont li .ticket_data{
  position: absolute;
  left: 41px;
  top: 31px;
  width: 200px;
  padding: 1px 0px 0px 0px;
}
.ticket_state{
  display: block;
  font-size: 15px;
  padding-bottom: 6px;
}
.register_info{
  margin-top: 7px;
    margin-bottom: 12px;
}

.register_info .first{
    overflow: hidden;
    display: inline-block;

    /* background: url(//cdnticket.melon.co.kr/resource/image/web/common/bg_gray_bar.png) no-repeat 15px center; */
    font-size: 14px;
    line-height: 32px;
}
.ticket_data .date{
  display:block;
  font-size: 14px;
  line-height: 22px;
}
div.link_concert{
  display: block;
  width: 598px;
  padding-top: 15px;
}
.link_concert a.tit{
  overflow: hidden;
    display: inline-block;
    max-width: 598px;
    white-space: nowrap;
    font-weight: normal;
    font-size: 17px;
    line-height: 24px;
    padding: 4px 3px 0 0;
}
.register_info dd.txt_date{
    overflow: hidden;
    display: inline-block;
    font-size: 14px;
    line-height: 32px;
}
.register_info dt.tit_review{
    overflow: hidden;
    display: inline-block;
    padding-left: 35px;
    /* background: url(//cdnticket.melon.co.kr/resource/image/web/common/bg_gray_bar.png) no-repeat 15px center; */
    font-size: 14px;
    line-height: 32px;
}
.register_info dd.txt_review{
    overflow: hidden;
    display: inline-block;
    font-size: 14px;
    line-height: 32px;
}
.list_ticket_cont a.poster{
  position: absolute;
  width: 65px;
  height: 105px;
  top: 10px;
  right: 40px;
  overflow: hidden;
}
.list_ticket_cont a.poster img {
	width: 65px;
	height: 98px;
}

/* 오른쪽 배너*/
.rightWingBanner{
  position: absolute;
  left: 50%;
  margin-left: 525px;
  top: 40px;
  border: 1px solid black;
}

ul,li{
  list-style: none;
}
.right_event .event_img{
  height: 208px;
padding: 17px;
}
.right_event{
      padding-left: 0px;
}
.cont {
  -webkit-animation-name: cont;
  -webkit-animation-duration: 1.5s;
  animation-name: cont;
  animation-duration: 1.5s;
}

@keyframes cont {
  from {opacity: .4}
  to {opacity: 1}
}

.ticket_box_input .sort{
    float: right;
    margin: -6px 0px 0px 0px;
    padding: 2px 12px 10px 12px;

}
.ticket_box_input .sort button{
    border: 0px solid;
    padding: 8px 0px 12px 0px;

}

.ticket_box_input .sort .sort_span{
	padding: 0px 20px 0px 20px;
    font-size: 17px;
    font-weight: bold;
    border-right: 1px solid #d9d9d9;

}

#search-row{
padding-top: 40px;
    font-size: 33px;
       height: 129px;
    border-bottom: 1px solid #eee;
}


</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

var cp = 1;
var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1;
var yyyy = today.getFullYear();
if(dd<10) {
	    dd='0'+dd
	} 

	if(mm<10) {
	    mm='0'+mm
	} 

	today = yyyy+'.'+mm+'.'+dd;


function keywordSearch(event,cp){
	   console.log(event);
	 
	   var opt = $('[id="select-opt-box"]').val();
	   var keyword = $('[id="search_content"]').val();
	   $('[id="search_content"]').val(keyword);
	   var orders = $(event).find("button[type=submit]:focus" ).attr("value");
	  
	   cp = cp  || 1;
	   getSearch(cp,opt,keyword,orders);
	   return false;
	}
function getSearch(cp,opt,keyword,orders){
	   $.ajax({
		   type:"get",
		   url:"openTicketPlus.do",
		   data:{cp:cp,opt:opt,keyword:keyword,orders:orders},
		   dataType:"json",
		   success:function(result){
			   var html = "";
			   var concertByDate1 = result.concertByDate1;
			   var concertByDate2 = result.concertByDate2;
			   var searchConcerts = result.searchConcerts;
			   $("#concert-list1").html('');
			   $("#concert-list2").html('');
			   $("#list-ajax").html('');
			   $.each(concertByDate1,function(index,item){
				  
				   html += '<div class="cont">';
				   html +=	'<a href="#"> <span class="img"><img src="../resources/images/concerts/'+item.coverImg+'" alt="'+item.title+'"></span> ';
					html +=	'<strong class="tit_consert">'+item.title+'</strong> <span class="date">';
					if(today < item.ticketOpenDate){
						html += '[오픈예정]';
					}else {
						html += '[오픈]';
					}
					html +=	''+item.ticketOpenDate+'</span>';
					html += '</a>';
					html += '</div>';
				  
			   })
			   $("#concert-list1").append(html);
			   html = "";
			   $.each(concertByDate2,function(index,item){
				 
				   html += '<div class="cont">';
				   html +=	'<a href="#"> <span class="img"><img src="../resources/images/concerts/'+item.coverImg+'" alt=""></span> ';
				   html +=	'<strong class="tit_consert">'+item.title+'</strong> <span class="date">';
                	html += '[오픈]';
					html += ''+item.ticketOpenDate+'</span>'	;
					html +='</a>';		
					html +='</div>';
					
			   })
			   
			   $("#concert-list2").append(html);
			   $("#list_slider li div:first-child").addClass("first");
			   html = "";
			   		
				   if(!searchConcerts.length){
					   
					 
					   html+= '<div class="row" id="search-row">';
					   html+= '<div class="col-xs-12 text-center">';
					   html+= '해당 티켓 오픈 정보가 없습니다.';
					   html+= '</div>';
					   html+= '</div>';
					  
	            	   
	               } else {
	            	  $.each(searchConcerts,function(index,item){
		            	 html+=  '<li>';
		                 html+=  '<div class="ticket_data">';
		                 html+=  '<span class="ticket_state">티켓오픈</span>';
		                 html+=  '<span class="date">'+item.ticketOpenDate+'</span>';
		                 html+=  '</div>';
		                 html+=  '<div class="link_concert">';
		                 html+=  '<a href="#" class="tit">'+item.title+'</a>';
		                 html+=  '<dl class="register_info">';
		                 html+=  '<dt class="first tit_date">등록일</dt>';
		                 html+=  '<dd class="txt_date">'+item.createDate+'</dd>';
		                 html+=  '<dt class="tit_review">조회</dt>';
		                 html+=  '<dd class="txt_review">'+item.likes+'</dd>';
		                 html+=  '</dl>';
		                 html+=  '</div>';
		                 html+=  '<a href="#" class="poster">';
		                 html+=  '<img src="../resources/images/concerts/'+item.coverImg+'" alt="티켓오픈이미지">';
		                 html+=  '</a>';
		                 html+=  '</li>';
	            	  })
	            	  
	            	 
	               }
				   $("#list-ajax").append(html);
		
			 }
	   })
}
var cp =2 ;
$(window).scroll(function(){
	   if($(document).height()-$(window).scrollTop()-$(window).height()<=0.1){
		   
		   var opt = $("#select-opt-box").val();
		   var keyword = $("#search-content").val();
		   var orders = '${param.orders}';
		   $.ajax({
			   type:"get",
			   url:"openTicketPlus.do",
			   data:{cp:cp,opt:opt,keyword:keyword,orders:orders},
			   dataType:"json",
			   success:function(result){
				   var html = "";
				   if(!result.length){
					   $("#search-row").html("").remove();
					   
					   html+= '<div class="row" id="search-row">';
					   html+= '<div class="col-xs-12 text-center">';
					   html+= '더이상 해당 정보가 없습니다..';
					   html+= '</div>';
					   html+= '</div>';
					  
	            	   
	               } else {
	            	   cp++;
	            	  $.each(result,function(index,item){
		            	 html+=  '<li>';
		                 html+=  '<div class="ticket_data">';
		                 html+=  '<span class="ticket_state">티켓오픈</span>';
		                 html+=  '<span class="date">'+item.ticketOpenDate+'</span>';
		                 html+=  '</div>';
		                 html+=  '<div class="link_concert">';
		                 html+=  '<a href="#" class="tit">'+item.title+'</a>';
		                 html+=  '<dl class="register_info">';
		                 html+=  '<dt class="first tit_date">등록일</dt>';
		                 html+=  '<dd class="txt_date">'+item.createDate+'</dd>';
		                 html+=  '<dt class="tit_review">조회</dt>';
		                 html+=  '<dd class="txt_review">'+item.likes+'</dd>';
		                 html+=  '</dl>';
		                 html+=  '</div>';
		                 html+=  '<a href="#" class="poster">';
		                 html+=  '<img src="../resources/images/concerts/'+item.coverImg+'" alt="티켓오픈이미지">';
		                 html+=  '</a>';
		                 html+=  '</li>';
	            	  })        	 
	               }
				   $("#list-ajax").append(html);	
			 	}	   
		   })
	   }
})



$(function(){
  getSearch(1);
  $("#btn_next").click(function(event){
    event.preventDefault();
    var prev_no = $("#prev_number").text();
    if(prev_no == 1) {
      $("#list_slider").animate({left:"0px"});
      $("#prev_number").text("2");
    } else {
      $("#list_slider").animate({left:"0px"});
      $("#prev_number").text("1");
    }
  });

  $("#btn_prev").click(function(event){
    event.preventDefault();
    var prev_no = $("#prev_number").text();
    if(prev_no == 2) {
      $("#list_slider").animate({left:"0px"});
      $("#prev_number").text("1");
    } else{
      $("#list_slider").animate({left:"0px"});
      $("#prev_number").text("2");
    }
  })
  
  
  
})

var slideIndex = 1;
showSlides(slideIndex);
function plusSlides(n){
  showSlides(slideIndex +=n);
}
function showSlides(n){
  var i;
  var slides = $("#list_slider").find('li');
  if(n > slides.length) {
    slideIndex = 1;
  }
  if(n < 1) {
    slideIndex = slides.length;
  }
  for (i = 0; i < slides.length; i++) {
   slides[i].style.display = "none";
 }
 if(slideIndex == 1){
    $("#list_slider li:nth-child("+slideIndex+")").animate({left:"0px"}).attr("style", "display:block");
 } else{
     $("#list_slider li:nth-child("+slideIndex+")").animate({left:"-890px"}).attr("style", "display:block");
 }
}

</script>

</head>
<body>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysdate"><fmt:formatDate value="${now}" pattern="yy.MM.dd" /></c:set>
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <div class="content">
          <div class="section_ticketopen_list">
            <div class="wrap_ticketopen_banner">
              <div class="box_hot_issue">
                <p class="tit">공연 오픈 소식</p>
                <div class="fnSlider full">
                  <div class="inner hot_issue_inner">
                    <ul class="list_slider list_hot_issue" id="list_slider" style="width: 1856px; height: auto;">
                     <li id="concert-list1">
                      	
                      </li> 
                      <li id="concert-list2">
                      
                      </li>
                     

                    </ul>
                  </div>

                  <div class="control page2">
                    <a class="prev" href="#" id="btn_prev" onclick="plusSlides(-1)"><span><i class="far fa-caret-square-left"></i></span>

                    </a>
                    <span class="now big" id="prev_number">1</span>
                    <span class="slash">/</span>
                    <span class="total big">2</span>
                    <a class="next" href="#" id="btn_next" onclick="plusSlides(1)"><span><i class="far fa-caret-square-right"></i></span>
                    </a>
                  </div>


                </div>
              </div>

            </div>
            
            <div class="wrap_ticket_cont">
              <form onsubmit="return keywordSearch(this)" action="openTicketPlus.do" method="get" id="search-form" >
                <div class="wrap_ticket_search">
                  <div class="ticket_box_select">
                    <select class="ticket_selectbox" name="opt" id="select-opt-box" onchange="keywordSearch(this);">
                      <option value="" selected>전체</option>
                      <option value="concert">콘서트</option>
                      <option value="art">공연</option>
                    </select>
                  </div>
                  <div class="ticket_box_input">
                    <input type="text" name="keyword" id="search_content" placeholder="티켓 오픈 소식 검색">
                    <button type="submit">검색</button>
                   	<div class="text-right sort">
                    	<button type="submit" name="orders"  value="createDate" onclick="keywordSearch(this);"><span class="sort_span">등록순</span></button>
                    	<button type="submit" name="orders" value="likes" onclick="keywordSearch(this);"><span class="sort_span" >조회순</span></button>
                    	<button type="submit" name="orders" value="openTicket" onclick="keywordSearch(this);"><span class="sort_span">오픈일순</span></button>
                   </div>
                  </div>
                </div>
              </form>
             
              <div class="box_ticket_cont">
              <!-- 공연 예정 리스트 -->
                <ul class="list_ticket_cont" id="list-ajax">
                
                </ul>
              </div>


            </div>
          </div>
            <div class="rightWingBanner">
                <ul class="right_event">
                  <li><a href="#"><img src="images/back.jpg" alt="" class="event_img"> </a> </li>
                </ul>
            </div>
        </div>
      </div>
    </div>
   </div>
   <script type="text/javascript">
  
   
   
   </script>
  </body>
  </html>
