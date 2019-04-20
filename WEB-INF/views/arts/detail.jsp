<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=568d73592315a725a1e49d887c4ced80&libraries=services"></script>
<%@ include file="../include/main-nav.jsp"%>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.detail_box_top {
	min-height: 735px;
	padding: 36px 29px 30px;
	margin-bottom: 40px;
	border: 1px solid #dedede;
	background: #fff;
}

.box_title {
	border-bottom: 2px solid #999;
}

.detail_box_top .box_title .title {
	display: inline-block;
	position: relative;
	min-height: 34px;
	padding-bottom: 26px;
	font-weight: bold;
	font-size: 26px;
	letter-spacing: -1px;
	vertical-align: top;
	word-break: break-all;
}

.detail_info {
	float: left;
	position: relative;
	width: 675px;
	min-height: 382px;
	margin-top: 30px;
	padding: 0 30px 0 342px;
	box-sizing: border-box;
}

.detail_info .box_thumb {
	position: absolute;
	top: 0;
	left: 0;
}

.detail_info .box_thumb span.box_img {
	display: block;
}

.detail_info .box_thumb span.box_img img {
	width: 314px;
	height: 382px;
}

.box_content {
	padding-top: 7px;
}

.box_content .box_dummy:first-child {
	margin-top: 0;
}

.box_content .box_dummy {
	position: relative;
	margin-top: 9px;
}

.box_content .box_dummy.border_type {
	margin-bottom: 17px;
	padding-bottom: 13px;
	border-bottom: 1px dotted #9d9d9d;
}

.box_content em.box_tit_txt {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 68px;
	font-weight: bold;
	line-height: 18px;
}

.box_content span.box_txt {
	display: block;
	min-height: 20px;
	padding-left: 68px;
	line-height: 18px;
}

.detail_middle {
	position: relative;
	/* margin-top: 28px; */
	top: 34px;
	left: -36px;
}

.detail_middle a span {
	float: left;
	/* display: inline-block; */
	/* position: absolute; */
	/* height: 42px; */
	padding: 12px 5px 9px 51px;
	font-size: 13px;
	line-height: 20px;
	width: 166px;
	color: #666666;
	vertical-align: top;
}

.detail_middle a {
	height: 42px;
	width: 160px;
	float: left;
	/* left: 68px; */
}

.btn_like_radius_off {
	background: url(../resources/images/arts/detail/ico_planner2.png)
		no-repeat 0 0;
}

.btn_like_radius {
	/* background: url(../resources/images/arts/detail/ico_planner3.png)
		no-repeat 0 -42px; */
		
	
	border: 1px solid #e30076;
    border-radius: 20px 20px 20px 20px;
}

.detail_info_right {
	float: right;
	margin-top: 22px;
	padding-left: 30px;
	width: 255px;
	min-height: 382px;
	border-left: 1px solid #e1e1e1;
}

.detail_info_right .ui-date {
	padding-bottom: 21px;
	margin-top: -2px;
	width: 224px;
	height: 225px;
	margin-left: -7px;
}

.dotline_x {
	background: url(../resources/images/arts/detail/bg_dotline.png) repeat-x
		1px 100%;
}

.detail_info_right dl {
	padding-bottom: 21px;
	margin-bottom: 20px;
}

.detail_info_right dt {
	/* font-size: 11px; */
	letter-spacing: -1px;
	font-weight: bold;
	line-height: 26px;
	height: 26px;
	margin-top: 12px;
}

/* dd div.selectbox {
	border: 1px solid #d4d4d4;
	position: relative;
	width: 222px;
	height: 27px;
	
} */

.selectbox a.select {
	background: url(../resources/images/arts/detail/sp_ico.gif) no-repeat
		100% 0;
	height: 100%;
}

.selectbox a {
	display: block;
	padding-left: 10px;
	height: 27px;
	line-height: 27px;
}

.detail_info_right .seat {
	border: 1px solid #d4d4d4;
	height: 104px;
	overflow-y: auto;
	padding: 9px 2px 0px 10px;
}
.seat li{
	padding: 0px 0px 5px 0px;
}
.btn {
	display: inline-block;
	overflow: hidden;
	
	
	vertical-align: top;
}

.detail_info_right .reserve {
	background-position: 0 -65px;
	width: 224px;
	height: 64px;
}

.detail_box_top .detail_info_right .reserve.s_after {
	background-position: 0 0;
}

.ul-list-middle {
	height: 50px;
	border: 1px solid #fcfcfc;
	background: #fcfcfc;
}

.ul-list-middle li {
	font-size: 21px;
	display: inline;
	float: left;
	width: 174px;
	margin-top: 8px;
	height: 34px;
	font-weight: bold;
	/* border: 1px solid; */
	background: url(../resources/images/arts/detail/detail_tab.png)
		no-repeat 0 0;
	text-align: center;
	vertical-align: top;
	position: relative;
	letter-spacing: 0;
}

.ul-list-middle a span.line {
	/* display: inline-block; */
	height: 62px;
	/* line-height: 51px; */
	color: #d5d5d5;
	padding: 12px 12px 14px;
	border-bottom: 1px solid #f1f1f1;
}

A:visited {
	/* COLOR: #d5d5d5; */
	color: #000000;
	TEXT-DECORATION: none;
}

A:link {
	/* COLOR: #d5d5d5; */
	color: #000000;
	TEXT-DECORATION: none;
}

.span_on {
	height: 62px;
	/* line-height: 51px; */
	padding: 12px 12px 14px;
	border-bottom: 1px solid #e51581;
}

.detail_left_cont {
	width: 702px;
}

.box_art_time {
	margin-top: 38px;
}

.tit_sub_float {
	margin-left: 2px;
	display: block;
	width: 100%;
	height: 54px;
	font-size: 20px;
	line-height: 54px;
	color: #000;
	text-align: left;
}

.box_bace_price {
	margin-top: 36px;
}

.tit_sub_ss_float {
	display: block;
	width: 100%;
	height: 50px;
	font-weight: normal;
	font-size: 16px;
	line-height: 54px;
	color: rgb(0, 0, 0);
	text-align: left;
}

.sale_price_btn {
	margin-left: 10px;
}

.btn_arr_down_28 {
	display: inline-block;
	overflow: hidden;
	height: 28px;
	padding: 0 23px 0 0;
	background-position: right -675px;
}

.btn_arr_down_28:hover {
	background-position: right -1184px;
}

.btn_flexible, .btn_flexible span {
	background:
		url(//cdnticket.melon.co.kr/resource/image/web/common/btn_flexible_20180510.png)
		no-repeat;
}

.btn_arr_down_28 span {
	display: inline-block;
	overflow: hidden;
	height: 21px;
	padding: 7px 0 4px 7px;
	background-position: left -675px;
	font-size: 12px;
	line-height: 16px;
	color: #666;
	text-align: center;
	vertical-align: top;
}

.list_seat {
	overflow: hidden;
	margin-left: 4px;
	margin-top: 10px;
	padding: 10px 0 10px 19px;
	border: 1px solid #f7f7f7;
	background-color: #fbfbfb;
}

dl, ul, ol, menu, li {
	list-style: none;
}

.list_seat li {
	display: inline-block;
	position: relative;
	width: 49%;
	height: 28px;
	vertical-align: middle;
}

.list_seat li .seat_color {
	width: 15px;
	height: 15px;
	margin: 6px 7px 7px 0;
	vertical-align: middle;
}

.list_seat li .seat_name {
	display: inline-block;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
	vertical-align: middle;
	max-width: 205px;
}

.list_seat li span {
	display: inline-block;
	font-size: 16px;
	line-height: 28px;
	color: #333;
}

.list_seat li .price {
	float: right;
	padding-right: 20px;
	color: #888;
	vertical-align: middle;
	letter-spacing: 0;
}

.notice_role {
	padding: 40px 0 20px;
	text-align: center;
}

.notice_role>p {
	display: inline-block;
	padding-left: 28px;
	margin-right: 10px;
	color: #00cd3c;
	font-size: 18px;
	vertical-align: middle;
	background:
		url(../resources/images/arts/detail/icon_package_info.png)
		no-repeat 0 5px;
	background-size: 22px 22px;
}

.notice_role .button_wrap {
	display: inline-block;
	position: relative;
	top: -2px;
	width: 130px;
}

.btColorWhite {
	padding: 7px 0px 7px 0px;
	border: 1px solid #cccccc;
	background: #fff;
}

.btSizeM {
	display: inline-block;
	height: 32px;
	line-height: 31px;
	padding: 0 10px;
	font-size: 14px;
}

.btColorWhite a.btSizeM {
	color: #333333;
}

.notice_role .layerPop {
	top: 39px;
	right: 30px;
	width: 466px;
	text-align: left;
}

.layerPop {
	display: none;
	position: absolute;
	line-height: 0;
	z-index: 99;
}

.layerPop {
	display: none;
	position: absolute;
	line-height: 0;
	z-index: 99;
}

.layerPop .la_middle, .layerPop .la_middle .la_middle1 {
	display: inline-block;
	background: #fff
		url(//cdnticket.melon.co.kr/resource/image/web/common/bg_layerpopup2.png)
		repeat-y;
}

.layerPop .la_header, .layerPop .la_header .la_header1, .layerPop .la_footer,
	.layerPop .la_footer .la_footer1 {
	display: inline-block;
	background:
		url(//cdnticket.melon.co.kr/resource/image/web/common/bg_layerpopup.png)
		no-repeat;
}

.notice_role .layerPop .arrow {
	display: inline-block;
	position: absolute;
	top: -2px;
	right: 4px;
	width: 22px;
	height: 13px;
	background:
		url(//cdnticket.melon.co.kr/resource/image/web/common/bg_layerpopup_arrow_top.png)
		no-repeat 0 0;
}

.layerPop .la_header {
	width: 100%;
	height: 70px;
	padding: 0 0 0 15px;
	background-position: 0 0;
}

.layerPop .la_header .la_header1 {
	width: 104%;
	height: 72px;
	padding: 16px 0 0 14px;
	background-position: right 0;
}

.layerPop .la_middle .la_middle1 {
	width: 104%;
	padding: 0 0 0 15px;
	background-position: right 0;
	background-color: #fff;
}

.layerPop .la_middle {
	width: 100%;
	padding: 0 0 0 15px;
	background-position: 0 0;
	background-color: #fff;
}

.layerPop h3 {
	padding: 7px 0 0 0;
	height: 32px;
	font-size: 22px;
	font-weight: normal;
	color: #1a1a1a;
}

.layerPop .popClose {
	position: absolute;
	top: 39px;
	right: 0;
}

.layerPop .popClose .btn_layerpopup_close {
	display: inline-block;
	width: 23px;
	height: 23px;
	background:
		url(//cdnticket.melon.co.kr/resource/image/web/common/btn_layerpop_close.png)
		repeat-x 0 0;
	text-indent: -9999px;
}

.layerPop .la_footer {
	width: 100%;
	height: 42px;
	padding: 0 0 0 15px;
	background-position: 0 -48px;
}

.la_middle .la_con {
	color: #333;
	font-size: 14px;
	margin-top: 20px;
	padding-right: 10px;
	margin-right: 9px;
	line-height: 1.5em;
}

.layerPop .la_footer .la_footer1 {
	width: 104%;
	height: 42px;
	padding: 0 0 0 15px;
	background-position: right -48px;
}

.selectbox {
	border: 1px solid #d4d4d4;
	position: relative;
}

.selectbox a {
	display: block;
	padding-left: 10px;
	height: 27px;
	line-height: 27px;
}

dd {
	margin-left: 2px;
}
em, address {
    font-style: normal;
}
.selectbox .select_list {
	position: absolute;
	border: 1px solid #d4d4d4;
	background: #fff;
	width: 101%;
	padding-left: 6px;
	margin-top: 26px;
	left: -1px;
	color: #444;
	max-height: 150px;
	overflow-y: auto;
	z-index: 10;
}

a {
	color: #000000;
	/*  color: #444;*/
	text-decoration: none;
}
a:hover {
    text-decoration: none;
}
.btn-comment1 {
    position: absolute;
    top: 31px;
   left: 142px;
   color: #b2b2b2;
}
.btn-comment2 {
    position: absolute;
    top: 31px;
   left: 142px;
   color: #b2b2b2;
}
.comment_hide{
	display: none;
}
.commentBtnStyle{
    width: 102px;
    margin-left: 6px;
    height: 112px;
    background-color: #fff;
    border: 1px solid #dadada;
    font-weight: 700;
    font-style: #000;
    color: #000;
    font-size: 18px;
}
.commentBackground{
	    background: #fcfcfc;
    padding-top: 24px;
    padding-bottom: 24px;
}
.count_font{
	overflow: hidden;
    padding: 37px 0 0px;
    font-weight: bold;
    font-size: 20px;
    line-height: 28px;
    color: #000;
}
.comment-date{
	font-size: 11px;
    color: #aaa;
    display: block;
}
.media img{
	border-radius : 31px 31px 31px 31px;

}
.review-span{
border: 1px solid #989595;
    padding-top: 0px;
    padding: 2px 6px 2px 6px;
    color: #914ece;
    border-color: #914ece;
    border-radius: 10px 10px 10px 10px;
    margin-right: 6px;
}
.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a { color: red; }



/* QnA */
.none {
    overflow: hidden;
    font-size: 0 !important;
    width: 0 !important;
    height: 0 !important;
    line-height: 0 !important;
    text-indent: -9999px;
}
.btn_qna {
    text-align: center;
    padding-bottom: 36px;
}
.btn_qna p.txt {
    font-size: 22px;
    color: #333;
    
    padding: 13px 0 12px;
}
.btn_qna p.txt2 {
    font-size: 14px;
    letter-spacing: 0;
}
.qnabtn-comment{
    position: absolute;
    top: 59px;
    left: 31px;
	color: #b2b2b2;
}
.panel-hide{
	display: none;

}

.planner-hide{
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	opacity: 0.6px;
}
.planner-close-hide{
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	opacity: 0.6px;
}
.position-style{
	position: absolute;
	min-width: 32%;
    min-height: 40%;
	
}
.class-btn-image{
	    background: url(../resources/images/arts/detail/btn_layerpop_close.png) repeat-x 0 0;
        position: relative;
		padding-right: 23px;
   		padding-top: 22px;
    	left: 395px;
   		 top: 18px;
}
.w3-red, .w3-hover-red:hover {
    
    color: #e30076!important;
    background-color: #fff!important;
    border: 1px solid #d5d8e0;
}
.w3-pink, .w3-hover-orange:hover {
    color: #fff!important;
    background-color: #e30076!important;
    opacity: 0.7;
    border-radius: 11px 11px 11px 11px;
}
#btn-reserve-ticket{
    width: 224px;
    height: 82px;
    text-align: center;
    font-size: 23px;
    padding: 27px 0px 0px 0px;
    color: white;
    border-collapse: collapse;
}
</style>

<script type="text/javascript">

		/* var plannerTime = setTimeout(function(){
				$("#planner-div").removeClass("planner-hide");
		},4000);	 */

	function ticketfunction(artNo){
  		  var performanceNo = $("#performanceNo-input").val();
  		  var performanceDay = $("#performanceDay-input").val();
  		  location.href = "../ticket/home.do?concertNo="+artNo+"&performanceDay="+performanceDay+"&performanceNo="+performanceNo+"";
  				  
  	  }
		
      $(function(){
    	  
    	
    	 
    	  
    	  
    	  $("[id='btn-span-list1']").removeClass("line").addClass("span_on");
    	  $(".detail_left_cont").attr("style","display:block");
	  		$("#notice_role2").attr("style","display:none");
	  		$("#notice2").attr("style","display:none");
	  		$("#notice_role3").attr("style","display:none");
	  		$("#notice3").attr("style","display:none");
	  		$(".wrap_detailview_cont").attr("style","display:none");
	  		$('#map').hide();
	  	//공연 플래너 담기
        $(".detail_middle").on("click",".btn_like_radius_off",function(){
          var choose = $(this);
             var concertNo = ${art.no};  
             $.ajax({
            	 type:"get",
            	 url:"addPlanner.do",
            	 data:{concertNo:concertNo},
            	 success: function(result){
            		 html = "";
            		 console.log(result);
            		 
            		 if(result == 'true'){ 
            			 console.log("성공");
            			 
            				 $("#planner-div").fadeIn(1000).fadeOut(1000).addClass("planner-hide");
            				
            			 
            			 $(choose).removeClass("btn_like_radius_off").addClass("btn_like_radius");
                         
                         $("#btn_add_planner span").css("color","#e30076").css("padding", "13px 5px 9px 71px").text("공연플래너");   			 
            		 }
            	 }
             })
             
            // $("#btn_add_planner span").css({"color":"#00b523","padding":"13px 5px 9px 71px"}).text("공연플래너");
        });

        $(".detail_middle").on("click",".btn_like_radius",function(){
         
        	var choose = $(this);
        	var concertNo = ${art.no};
        	$.ajax({
        		 type:"get",
            	 url:"deletePlanner.do",
            	 data:{concertNo:concertNo},
            	 success: function(result){
            		 html = "";
            		 console.log(result);
            		 
            		 if(result == 'true'){ 
            			 console.log("성공");
            			 
            			$("#planner-close-div").fadeIn(1000).fadeOut(1000).addClass("planner-close-hide");;
            				
            			$(choose).removeClass("btn_like_radius").addClass("btn_like_radius_off");
            		    
            		    $("#btn_add_planner span").css("color","black").css("padding","12px 5px 9px 51px").text("공연플래너 담기");
            			  			 
            		 }
            	 }
             })	
        	
        
        })
		

        $("#btn_list li").click(function(){
            $("[id^='btn-span-list']").removeClass("span_on").addClass("line");
            var list_no = $(this).attr("class").replace("li-list-middle","");
            if(!$("#btn_list span").is(".span_on")){
              $("#btn-span-list"+list_no).removeClass("line").addClass("span_on");
            }else {
                $("#btn-span-list"+list_no).removeClass("span_on").addClass("line");
            }
        })
        
        $("#commentA").click(function(event){
        	 event.preventDefault();
        	 
        	var className = $(this).find("label").attr("class").replace("btn-comment","");
        	$(".btn-comment2").removeClass("comment_hide");
	       	 $(".qnabtn-comment").removeClass("comment_hide");
       	  	$(".btn-comment"+className+"").addClass("comment_hide");
       	  	$("#comment-"+className+"").focus();
        })
         $("#commentB").click(function(event){
        	 event.preventDefault();
        	 
        	var className = $(this).find("label").attr("class").replace("btn-comment","");
        	$(".btn-comment1").removeClass("comment_hide");
        	$(".qnabtn-comment").removeClass("comment_hide");
       	  	$(".btn-comment"+className+"").addClass("comment_hide");
       	 	
       	  	$("#comment-"+className+"").focus();
        })
         $("#commentC").click(function(event){
        	 event.preventDefault();
        		$(".btn-comment1").removeClass("comment_hide");
        		$(".btn-comment2").removeClass("comment_hide");
        		$(".qnabtn-comment").addClass("comment_hide");
        		$("#comment-3").focus();
        
        })
        
        
        $("#btn_list li").click(function(event){
        	event.preventDefault();
        	if($(this).is(".li-list-middle1")){
        		$(".detail_left_cont").attr("style","display:block");
        		$("#notice_role2").attr("style","display:none");
        		$("#notice2").attr("style","display:none");
        		$("#notice_role3").attr("style","display:none");
        		$("#notice3").attr("style","display:none");
        		$(".wrap_detailview_cont").attr("style","display:none");
        		$('.perf-detail').removeClass('col-xs-8');
				$('.side-rank').removeClass('col-xs-4');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
        	}else if($(this).is(".li-list-middle2")){
        		$(".detail_left_cont").attr("style","display:none");
        		$("#notice_role2").attr("style","display:block");
        		$("#notice2").attr("style","display:block");
        		$("#notice_role3").attr("style","display:none");
        		$("#notice3").attr("style","display:none");
        		$(".wrap_detailview_cont").attr("style","display:none");
        		$('.perf-detail').removeClass('col-xs-8');
				$('.side-rank').removeClass('col-xs-4');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
        	}else if($(this).is(".li-list-middle3")){
        	$(".detail_left_cont").attr("style","display:none");
    		$("#notice_role3").attr("style","display:block");
    		$("#notice3").attr("style","display:block");
    		$("#notice_role2").attr("style","display:none");
    		$("#notice2").attr("style","display:none");
    		$(".wrap_detailview_cont").attr("style","display:none");
    		$('.perf-detail').removeClass('col-xs-8');
			$('.side-rank').removeClass('col-xs-4');
			$('.perf-detail').addClass('col-xs-12');
			$('.perf-detail').empty();
			$('.side-rank').hide();
        	}else if($(this).is(".li-list-middle4")){
        		$(".wrap_detailview_cont").attr("style","display:block");
        		$(".detail_left_cont").attr("style","display:none");
        		$("#notice_role3").attr("style","display:none");
        		$("#notice3").attr("style","display:none");
        		$("#notice_role2").attr("style","display:none");
        		$("#notice2").attr("style","display:none");
        		$('.perf-detail').removeClass('col-xs-8');
				$('.side-rank').removeClass('col-xs-4');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
        	}else if($(this).is(".li-list-middle5")){
        		$(".wrap_detailview_cont").attr("style","display:none");
        		$(".detail_left_cont").attr("style","display:none");
        		$("#notice_role3").attr("style","display:none");
        		$("#notice3").attr("style","display:none");
        		$("#notice_role2").attr("style","display:none");
        		$("#notice2").attr("style","display:none");
        		
        		$('.perf-detail').removeClass('col-xs-8');
				$('.side-rank').removeClass('col-xs-4');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				$('#map').show();
				perfVar.hall();
        		
        	}
        	console.log(this);
        	console.log(event);
        })
     
       var ajaxVar = {
        	expect: function(){
        		$.ajax({
        		   type: "get",
          		   url :"expect.do",
          		   data:{paramDate:paramDate},
          		   success : function(result){
          			   
          		   }
        		})
        	},
        	review: function(){
        		
        	}
        }
        
        
       $("#expect-btn").click(function(event){
    	   event.preventDefault();
    	   
    	   $("#expect-list").empty();
    	   var paramDate = $("#ajax-expect").serialize();
    	   //{no:23, "concert.no":1000, content:"dks"}
    	   
    	   $.ajax({
    		   type: "get",
      		   url :"expect.do",
      		   data:paramDate,
      		   dataType:"json",
      		   success : function(result){
      		     var html = "";
      			 var countExpect = result.countExpect;
      			 var expects = result.expects;
      			 html += '<div class="count_font"><span class="text-left" style="padding-left: 21px;">기대평 총'+countExpect.countExpect+'개</span></div><hr>';
					/* 다른 유저 */
				$.each(expects,function(index,expect){
					
					if(${empty LOGIN_USER} || countExpect.user.no != expect.user.no){
						html +='<div class="media">';
						 html +='<div class="media-left" style="padding-left: 20px; padding-right: 111px;">';
						 html +='<img src="../resources/images/profile/'+expect.user.theme.img+'" class="media-object" style="width:60px">';
						 html +='</div>';
						 html +='<div class="media-body">';
						 html +='<h6 class="media-heading">'+expect.user.nickname+'</h6>';
						 html +='<p>'+expect.comments+'</p>';
						 html +='<span class="comment-date">'+expect.createDate+'</span>';
						 html +='<span>댓글</span>';
						 html +='</div>';
						 html +='</div>';
						 html +='<hr>';		

					}else if(countExpect.user.no == expect.user.no ){
						/* 나 자신  */
						html +='<div class="media">';
						html +='<div class="media-body" style="padding-left: 20px">';
						html +='<h6 class="media-heading">'+expect.user.nickname+'</h6>';
						html +='<p>'+expect.comments+'</p>';
						html +='<span class="comment-date">'+expect.createDate+'</span>';
						html +='<span>댓글</span>';
						html +='</div>';
						html +='<div class="media-right" style="padding-left: 111px; padding-right: 20px;">';
						html +='<img src="../resources/images/profile/'+expect.user.theme.img+'" class="media-object" style="width:60px">';
						html +='</div>';
						html +='</div>';
						html +='<hr>';
					}
				})
				$("#expect-list").append(html);
				$("#badge1").text(countExpect.countExpect);
				$("#comment-1").val("");
				
				$(".btn-comment1").removeClass("comment_hide");
      		   }
    	   })
       })
       
       $("#review-btn").click(function(event){
    	   event.preventDefault();
    	   var paramDate = $("#ajax-review").serialize();
  			$.ajax({
  			   type: "get",
       		   url :"review.do",
       		   data:paramDate,
       		   dataType:"json",
       		   success : function(result){
       		     var html = "";
       		  	$("#review-list").empty();
       			 var countReview = result.countReview;
       			 var reviews = result.reviews;
       			 html += '<div class="count_font"><span class="text-left" style="padding-left: 21px;">관람후기 총' +countReview.countReview+'개</span></div><hr>';
 					/* 다른 유저 */
 				$.each(reviews,function(index,review){
 					
 					if(${empty LOGIN_USER} || countReview.user.no != review.user.no){
 						html +='<div class="media">';
 						 html +='<div class="media-left" style="padding-left: 20px; padding-right: 111px;">';
 						 html +='<img src="../resources/images/profile/'+review.user.theme.img+'" class="media-object" style="width:60px">';
 						 html +='</div>';
 						 html +='<div class="media-body">';
 						 html +='<h6 class="media-heading">'+review.user.nickname+'</h6>';
 						 html +='<p>'+review.comments+'</p>';
 						 html +='<span class="comment-date">'+review.createDate+'</span>';
 						 html +='<span>댓글</span>';
 						 html +='</div>';
 						 html +='</div>';
 						 html +='<hr>';		

 					}else if(countReview.user.no == review.user.no ){
 						/* 나 자신  */
 						html +='<div class="media">';
 						html +='<div class="media-body" style="padding-left: 20px">';
 						html +='<h6 class="media-heading">'+review.user.nickname+'</h6>';
 						html +='<p>'+review.comments+'</p>';
 						html +='<span class="comment-date">'+review.createDate+'</span>';
 						html +='<span>댓글</span>';
 						html +='</div>';
 						html +='<div class="media-right" style="padding-left: 111px; padding-right: 20px;">';
 						html +='<img src="../resources/images/profile/'+review.user.theme.img+'" class="media-object" style="width:60px">';
 						html +='</div>';
 						html +='</div>';
 						html +='<hr>';
 					}
 				})
 				$("#review-list").append(html);
 				$("#badge2").text(countReview.countReview);
 				$("#comment-2").val("");
 				
 				$(".btn-comment2").removeClass("comment_hide");
       		   }
     	   })	   
       })
       
       $("#question-btn").click(function(event){
    	   event.preventDefault();
    	   var paramDate = $("#ajax-question").serialize();
  			$.ajax({
  			   type: "get",
       		   url :"question.do",
       		   data:paramDate,
       		   dataType:"json",
       		   success : function(result){
       		     var html = "";
       		  	$("#question-list").empty();
       			 var countQuestion = result.countQuestion;
       			 var questions = result.questions;
       			 html += '<div class="count_font"><span class="text-left" style="padding-left: 21px;">관람후기 총' +countQuestion.countQuestion+'개</span></div><hr>';
 					/* 다른 유저 */
 				$.each(questions,function(index,question){
 					
 					if(${empty LOGIN_USER} || countQuestion.user.no != question.user.no){
 						html +='<div class="media">';
 						 html +='<div class="media-left" style="padding-left: 20px; padding-right: 111px;">';
 						 html +='<img src="../resources/images/profile/'+question.user.theme.img+'" class="media-object" style="width:60px">';
 						 html +='</div>';
 						 html +='<div class="media-body">';
 						 html +='<h6 class="media-heading">'+question.user.nickname+'</h6>';
 						 html +='<p>'+question.comments+'</p>';
 						 html +='<span class="comment-date">'+question.createDate+'</span>';
 						 html +='<span>댓글</span>';
 						 html +='</div>';
 						 html +='</div>';
 						 html +='<hr>';		

 					}else if(countQuestion.user.no == question.user.no ){
 						/* 나 자신  */
 						html +='<div class="media">';
 						html +='<div class="media-body" style="padding-left: 20px">';
 						html +='<h6 class="media-heading">'+question.user.nickname+'</h6>';
 						html +='<p>'+question.comments+'</p>';
 						html +='<span class="comment-date">'+question.createDate+'</span>';
 						html +='<span>댓글</span>';
 						html +='</div>';
 						html +='<div class="media-right" style="padding-left: 111px; padding-right: 20px;">';
 						html +='<img src="../resources/images/profile/'+question.user.theme.img+'" class="media-object" style="width:60px">';
 						html +='</div>';
 						html +='</div>';
 						html +='<hr>';
 					}
 				})
 				$("#question-list").append(html);
 				$("#badge3").text(countQuestion.countQuestion);
 				$("#comment-3").val("");
 				
 				$(".qnabtn-comment").removeClass("comment_hide");
       		   }
     	   })	   
       })
       
       //할인 가격 정보 
       $("#discount-btn").click(function(event){
 			event.preventDefault();
 			console.log("패널 버튼 클릭");
 			/* 
 			var windowW = 602;  // 창의 가로 길이
 	        var windowH = 200;  // 창의 세로 길이
 	        var left = Math.ceil((window.screen.width - windowW)/2);
 	        var top = Math.ceil((window.screen.height - windowH)/2);
 	        $("#discount-panel").css({'left':''+left+'px','top':''+top+'px'}); */
 	       
   				var sWidth = window.innerWidth;
   				var sHeight = window.innerHeight;

   				var oWidth = $('#discount-panel').width();
   				var oHeight = $('#discount-panel').height();

   				// 레이어가 나타날 위치를 셋팅한다.
   				var divLeft = event.clientX + 70;
   				var divTop = event.clientY + 660;

   				// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
   			 	if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
   				if( divTop + oHeight > sHeight ) divTop -= oHeight; 

   				// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
   				if( divLeft < 0 ) divLeft = 0;
   				if( divTop < 0 ) divTop = 0;

   				$('#discount-panel').css({
   					"top": divTop,
   					"left": divLeft,
   					"position": "absolute"
   				}).show();
   			
 	       $("#discount-panel").removeClass("panel-hide");
 	        

 		})
 		
 		$("#panel-close-btn").draggable();
 		$("#close-btn").click(function(event){
 			event.preventDefault();
 			
        	$("#discount-panel").addClass("panel-hide").hide();
        	
        	
 		})
       
     })
   	$('#map').hide();
	 var perfVar = {
			hall : function() {
				$('.perf-detail').empty();
				$.ajax({
					type : "get",
					url : "perfdetail.do",
					data : {
						concertNo : $('#concertNo-input').val()
					},
					dataType : "json",
					success : function(result) {
						console.log(result);
						
						var hall = "";
						
						$.each(result.con.halls, function(index, item) {
							hall += "<h3>공연장 이름</h3>";
							hall += "<p>" + item.name + "</p>";
							hall += "<h3>공연장 상세 주소</h3>";
							hall += "<p>" + item.address + "</p>";
							hall += "<h3>공연장 연락처</h3>";
							hall += "<p>" + item.tel + "</p>";
							hall += "<h3>공연장 상세 지도</h3>";
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	                        mapOption = {
	                            center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	                            level: 3 // 지도의 확대 레벨
	                        };  
		
		                    // 지도를 생성합니다    
		                    var map = new daum.maps.Map(mapContainer, mapOption); 
		
		                    // 주소-좌표 변환 객체를 생성합니다
		                    var geocoder = new daum.maps.services.Geocoder();
		
		                    // 주소로 좌표를 검색합니다
		                    var hallAddr = item.address;
		                    
		                    geocoder.addressSearch(hallAddr, function(result, status) {
		
		                        // 정상적으로 검색이 완료됐으면 
		                         if (status === daum.maps.services.Status.OK) {
		
		                            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
		
		                            // 결과값으로 받은 위치를 마커로 표시합니다
		                            var marker = new daum.maps.Marker({
		                                map: map,
		                                position: coords
		                            });
		
		                            // 인포윈도우로 장소에 대한 설명을 표시합니다
		                            var infowindow = new daum.maps.InfoWindow({
		                                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+item.name+'</div>'
		                            });
		                            infowindow.open(map, marker);
		
		                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                            map.setCenter(coords);
		                        } 
		                    });    
						})
						hall += "";
						
						$('.perf-detail').html(hall);
					}
				})
			},
	
			reserve : function() {
				$('.perf-detail').empty();
			}
		}	
  </script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
</head>
<body>
	
	<div class="container">
		<div class="detail_box_top">
			<div class="box_title">
				<div class="title">${art.title }</div>
				<input type="hidden" value="${art.no }" id="concertNo-input">
			</div>
			<div class="detail_info">
				<div class="box_thumb">
					<span class="box_img"> <img src="../resources/images/concerts/${art.coverImg }" alt="사진">
					</span>
				</div>
				<div class="box_content">
					<div class="box_dummy">
						<em class="box_tit_txt"> 공연기간 </em> <span class="box_txt">
							<fmt:formatDate value="${art.openDate }"/>~<fmt:formatDate value="${art.closeDate }"/> </span>
					</div>
					<div class="box_dummy">
						<em class="box_tit_txt"> 공연장 </em> <span class="box_txt">
						<c:forEach items="${art.halls }" var="hall">
							${hall.name }
						</c:forEach>	
						 </span>
					</div>
					
					 <div class="box_dummy">
						<em class="box_tit_txt"> 관람시간  </em> <span class="box_txt">
						<c:forEach items="${performances }" var="performance" begin="1" end="1" >
						
							${performance.time }
						</c:forEach>
						</span>
					</div>
					<div class="box_dummy">
						<em class="box_tit_txt"> 아티스트  </em> <span class="box_txt">
							${art.artist }
						</span>
					</div>
					<div class="box_dummy border_type">
						<em class="box_tit_txt"> 장르  </em> <span class="box_txt">
							${art.genre }
						</span>
					</div>
					
					<div class="box_dummy border_type">
						<em class="box_tit_txt"> 관람가격 </em> <span class="box_txt">
							${art.price } </span>

					</div>
				</div>
			</div>

			<div>
			<c:if test="${!empty LOGIN_USER && plannerText eq false}">
				<div class="detail_middle">
					<a href="#none" id="btn_add_planner" class="btn_like_radius_off"><span>공연플래너
							담기</span></a>
				</div>
			</c:if>
			<c:if test="${!empty LOGIN_USER && plannerText eq true}">
				<div class="detail_middle">
					<a href="#none" id="btn_add_planner" class="btn_like_radius">
					
					<span style="color:#e30076;padding:13px 5px 9px 71px;">공연플래너
							</span></a>
				</div>
			</c:if>
				<div class="detail_info_right">
					<div class="ui-date dotline_x">
						<div id="datepicker"></div>
					</div>
					<dl class="dotline_x">
						<dt>예매가능 회차</dt>
						<dd>
							
							<select name="" id="select_time_box" class="form-control">
								<option value=""> 관람일을 선택하세요</option>
							</select>
							
						</dd>
						<dt>예매가능 좌석</dt>
						<dd>
							<ul class="seat" id="seatingInfoPerRound">
								
							</ul>
						</dd>
					</dl>
					<a href="javascript:void(0)" class="btn btn-danger btn-lx " id="btn-reserve-ticket" onclick="ticketfunction(${art.no});">예매하기</a>
				</div>
				<input type="hidden" value="" id="performanceNo-input">
				<input type="hidden" value="" id="performanceDay-input">
			</div>


		</div>
		<div class="middle-content" style="padding-top: 20px;">
			<ul class="ul-list-middle" id="btn_list">
				<li class="li-list-middle1"><a href="#none" id="detail_imfor"><span
						class="line" id="btn-span-list1"><span>상세정보</span> <span></span>
					</span> </a></li>
				<li class="li-list-middle2"><a href="#none" id="expect_imfor"><span
						class="line" id="btn-span-list2"><span>기대평<span class="w3-badge w3-red" id="badge1">${countExpect}</span></span></span></a></li>
				<li class="li-list-middle3"><a href="#none" id="review_imfor"><span
						class="line" id="btn-span-list3"><span>관람후기<span class="w3-badge w3-red" id="badge2">${countReview}</span></span></span></a></li>
				<li class="li-list-middle4"><a href="#none" id="qna_imfor"><span
						class="line" id="btn-span-list4"><span>Q&A<span class="w3-badge w3-red" id="badge3">${countQuestion}</span></span><span></span></span>
				</a></li>
				<li class="li-list-middle5"><a href="#none" id="hall_imfor"><span
						class="line" id="btn-span-list5"><span>공연장정보</span> <span></span></span>
				</a></li>
				<li class="li-list-middle6"><a href="#none" id="reserve_imfor"><span
						class="line" id="btn-span-list6"><span>예매안내</span><span></span></span>
				</a></li>
			</ul>
			
			<!-- 공연장 정보 -->
			<div class="row">
		    <div class="col-xs-8 perf-detail"></div>
			<div class="col-xs-4 side-rank"></div>
			<div id="map" style="width:100%; height:350px;"></div>
		</div>
			
			
			<!-- 상세정보 -->
			<div class="detail_left_cont">
				<div class="box_art_time">
					<p>
					<span style="font-size:11pt;">
					
						<h3>출연</h3>
						<p>${art.artist }</p>
						<h3>공연시간</h3>
						<fmt:formatDate value='${art.openDate }' pattern='yyyy년 MM월 dd일 (E)'/> ~ <fmt:formatDate value='${art.closeDate }' pattern='yyyy년 MM월 dd일 (E)'/><br />
							<c:forEach var='PerformanceTiem' items='${PerformanceTiems }'>
								<fmt:formatDate value='${PerformanceTiem.day }' pattern='E'/> / ${PerformanceTiem.time } <br />
							</c:forEach>
					
					</span>	
				</div>
				<div class="box_bace_price"> 
					
	               <h3>가격정보</h3>
	                    <button type="button" class="btn ejobtn-success ejobtn-xs" id="discount-btn">할인 정보 상세보기</button></p>
	                <h3>기본가</h3>
	                <ul class="list_seat">
	                    <li><span class="seat_color " style="background:#BEA886"></span> <span class="seat_name">전석</span> <span class="price">${art.price }</span></li>
	                </ul>
            	</div>
            	<h3>예매 공지사항</h3>
				<p>
				※ 티켓 오픈 : <fmt:formatDate value='${art.ticketOpenDate }' pattern='yyyy년 MM월 dd일 E요일 a h시'/><br/>
				※ 매수 제한 : 회차별 1인 4매
				</p>
				<img src='../resources/images/concerts/${art.contentImg }'>
            
            		
			</div>
			<!--기대평 --> 
			<div class="notice_role" style="display: block;" id="notice_role2">
				<p>티켓 매매 및 양도,교환의 글은 사전 통보 없이 삭제될 수 있습니다.</p>
				<div class="button_wrap">
			    	<span class="button btColorWhite"><a href="#none" class="btSizeM" onclick="$('#role1').toggle();">게시판 운영규칙</a></span>
			    	
			    	<!-- 게시판 운영 규칙 클릭시 나타나는 팝업-->
			    	<div class="layerPop" id="role1" style="display: none" >
						<span class="arrow"></span>
						<div class="la_header">
							<div class="la_header1">
								<h3>게시판 운영규정</h3>
								<div class="popClose">
					               <a href="#none" class="btn_layerpopup_close" onclick="$('#role1').hide();">레이어팝업닫기</a>
					            </div>
							</div>
						</div>
						<div class="la_middle">
							<div class="la_middle1">
								<div class="la_con">
									1. 불량 게시물로 판단되는 글은 사전고지 없이 삭제될 수 있으며,<br>
									지속적으로 불량 게시물을 작성하실 경우 멜론티켓 및 멜론의 댓글 작성 권한이 제한 될 수 있습니다.<br><br>
									[멜론티켓 불량 게시물 기준 ]<br>
									① 티켓 매매 및 양도, 교환의 글<br>
									② 전화번호, 이메일, 메신저ID 등 회원 및 타인의 개인정보 유출이 우려되는 경우<br>
									③ 해당 공연의 특정 출연자를 비방하는 글<br>
									④ 욕설, 비방, 음란성, 도배글 등 다른 고객님들께 불쾌감을 주는 글<br><br>
									2. 게시된 글의 저작권은 글을 작성한 회원에게 있으며 게시물로 인해<br>
									발생하는 문제는 게시자 본인에게 책임이 있습니다.
								</div>
							</div>
						</div>
						<div class="la_footer"><div class="la_footer1"></div></div>		
					</div>
				</div>
				</div>
				<div id="notice2">
				<div class="row commentBackground">
					<div class="col-xs-12">
						
                        <div class="media">
						    <div class="media-left" style="padding: 23px;">
						    <c:choose>
						    	<c:when test="${empty LOGIN_USER }">
							      <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
						    	</c:when>
						    	<c:otherwise>
							      <img src="../resources/images/profile/${LOGIN_USER.theme.img }" class="media-object" style="width:60px">
						    	</c:otherwise>
						    </c:choose>
						    </div>
						    <div class="media-body">
						      <h4 class="media-heading">${LOGIN_USER.nickname }</h4>
						      <form class="form-inline" action="" method="get" id="ajax-expect">
						      <input type="hidden" name="user.no" value="${LOGIN_USER.no }">
						      <input type="hidden" name="concert.no" value="${art.no }"/>
						      <div class="form-group">
						      <a href="#none" id="commentA">
								  <label for="comment" class="btn-comment1">* 게시된 글의 저작권은 글을 작성한 회원에게 있으며 게시물로 인해 발생하는 문제는 게시자 본인에게 책임이 있습니다.</label>
								  <textarea class="form-control" rows="5" style="width: 787px;" id="comment-1" name="comments"></textarea>
							  </a>
							  </div>
							  <div class="form-group">
							  <c:choose>
							  	<c:when test="${empty LOGIN_USER}">
								  	<button type="button" id="expect-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle" disabled="disabled">등록</button>
							  	</c:when>
							  	<c:otherwise>
								  	<button type="button" id="expect-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle">등록</button>							  	
							  	</c:otherwise>
							  </c:choose>
							  </div>
							  </form>
							  <div class="text-right">
							  </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12" id="expect-list"> 
						<div class="count_font"><span class="text-left" style="padding-left: 21px;" >기대평 총 ${countExpect} 개</span></div>
						 <hr>
						<!-- 다른 유저 -->
						<c:forEach items="${initExpects }" var="initExpect">
						<c:choose>
							<c:when test="${empty initExpect} ">
								<div class="text-center">등록된 기대평이 없습니다.</div>
								<hr>
							</c:when>
							<c:when test="${empty LOGIN_USER }">
								<div class="media">
									  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
									  	 <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${LOGIN_USER.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
									  </div>
									  <div class="media-body">
									    <h6 class="media-heading">${initExpect.user.nickname }</h6>
									    <p>${initExpect.comments }</p>
									    <span class="comment-date"><fmt:formatDate value="${initExpect.createDate }" pattern="yyyy.MM.dd"/> </span>
									    <span>댓글</span>
									  </div>
								</div>
								
								 <hr>
							</c:when>
							<c:when test="${user.no ne initExpect.user.no}">
								<div class="media">
								  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
								   <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initExpect.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
								  </div>
								  <div class="media-body">
								    <h6 class="media-heading">${initExpect.user.nickname }</h6>
								    <p>${initExpect.comments }</p>
								    <span class="comment-date"><fmt:formatDate value="${initExpect.createDate }" pattern="yyyy.MM.dd"/> </span>
								    <span>댓글</span>
								  </div>
								</div>
								 <hr>
							</c:when>
							<c:when test="${user.no eq initExpect.user.no }">
								<div class="media">
									  <div class="media-body" style="padding-left: 20px">
									    <h6 class="media-heading">${initExpect.user.nickname }</h6>
									    <p>${initExpect.comments }</p>
									    <span class="comment-date"><fmt:formatDate value="${initExpect.createDate }" pattern="yyyy.MM.dd"/> </span>
									    <span>댓글</span>
									  </div>
									  <div class="media-right" style="padding-left: 111px; padding-right: 20px;">
									   <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initExpect.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
									  </div>
								</div>
								 <hr>
							</c:when>
						</c:choose>
						</c:forEach>
					</div>
				</div>
				
				</div>
					
			<!-- 관람 후기 -->
			<div class="notice_role" style="display: block;" id="notice_role3">
				<p>티켓 매매 및 양도,교환의 글은 사전 통보 없이 삭제될 수 있습니다.</p>
				<div class="button_wrap">
					<span class="button btColorWhite"><a href="#none"
						class="btSizeM" onclick="$('#role2').toggle();">게시판 운영규칙</a></span>
					<div class="layerPop" id="role2" style="display: none;">
						<span class="arrow"></span>
						<div class="la_header">
							<div class="la_header1">
								<h3>게시판 운영규정</h3>
								<div class="popClose">
									<a href="#none" class="btn_layerpopup_close"
										onclick="$('#role2').hide();">레이어팝업닫기</a>
								</div>
							</div>
						</div>
						<div class="la_middle">
							<div class="la_middle1">
								<div class="la_con">
									1. 불량 게시물로 판단되는 글은 사전고지 없이 삭제될 수 있으며,<br> 지속적으로 불량 게시물을
									작성하실 경우 멜론티켓 및 멜론의 댓글 작성 권한이 제한 될 수 있습니다.<br>
									<br> [멜론티켓 불량 게시물 기준 ]<br> ① 티켓 매매 및 양도, 교환의 글<br>
									② 전화번호, 이메일, 메신저ID 등 회원 및 타인의 개인정보 유출이 우려되는 경우<br> ③ 해당
									공연의 특정 출연자를 비방하는 글<br> ④ 욕설, 비방, 음란성, 도배글 등 다른 고객님들께 불쾌감을
									주는 글<br>
									<br> 2. 게시된 글의 저작권은 글을 작성한 회원에게 있으며 게시물로 인해<br> 발생하는
									문제는 게시자 본인에게 책임이 있습니다.
								</div>
							</div>
						</div>
						<div class="la_footer">
							<div class="la_footer1"></div>
						</div>
					</div>
				</div>
			</div>
			<div id="notice3">
			<div class="row commentBackground review">
					<div class="col-xs-12">
						
                        <div class="media">
						    <div class="media-left" style="padding: 23px;">
						    		 <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${LOGIN_USER.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
						    </div>
						    <div class="media-body">
						      <h4 class="media-heading">${LOGIN_USER.nickname }</h4>
						      <form class="form-inline" action="" method="get" id="ajax-review">
						      <input type="hidden" name="user.no" value="${LOGIN_USER.no }">
						      <input type="hidden" name="concert.no" value="${art.no }"/>
						      <div class="form-group">
						      <a href="#none" id="commentB">
								  <label for="comment" class="btn-comment2">* 게시된 글의 저작권은 글을 작성한 회원에게 있으며 게시물로 인해 발생하는 문제는 게시자 본인에게 책임이 있습니다.</label>
								  <textarea class="form-control" rows="5" style="width: 787px;" id="comment-2" name="comments"></textarea>
							  </a>
							  </div>
							  <div class="form-group">
								  	<c:choose>
									  	<c:when test="${empty LOGIN_USER}">
										  	<button type="button" id="review-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle" disabled="disabled">등록</button>
									  	</c:when>
									  
									  	<c:otherwise>
										  	<button type="button" id="review-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle">등록</button>							  	
									  	</c:otherwise>
								 	 </c:choose>
							  </div>
							  </form>
							  <div class="text-right">
							  
							  
							  </div>
						    </div>
						  </div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12" id="review-list"> 
						
						<div class="count_font"><span class="text-left" style="padding-left: 21px;" >관람후기 총 ${countReview }개</span></div>
						<hr>
						<c:forEach items="${initReviews }" var="initReview">
						<c:choose>
							<c:when test="${empty initReview}">
								<div class="text-center">등록된 관람후기가 없습니다.</div>
								<hr>
							</c:when>
							<c:when test="${empty LOGIN_USER }">
								<!-- 다른 유저 -->
								<div class="media">
								  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
								     <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initReview.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
								  </div>
								  <div class="media-body">
								  
								    <h6 class="media-heading" style="margin-top: 4px;"><span class="review-span">예매자</span>${initReview.user.nickname }</h6>
								    <p>${initReview.comments}</p>
								    <span class="comment-date"><fmt:formatDate value="${initReview.createDate}" pattern="yyyy.MM.dd"/></span>
								    <span>댓글</span>
								  </div>
								</div>
								<hr>
							</c:when>
							<c:when test="${user.no ne initReview.user.no }">
								<!-- 다른 유저 -->
								<div class="media">
								  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
								     <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initReview.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
								  </div>
								  <div class="media-body">
								  
								    <h6 class="media-heading" style="margin-top: 4px;"><span class="review-span">예매자</span>${initReview.user.nickname }</h6>
								    <p>${initReview.comments}</p>
								    <span class="comment-date"><fmt:formatDate value="${initReview.createDate}" pattern="yyyy.MM.dd"/></span>
								    <span>댓글</span>
								  </div>
								</div>
								<hr>
							</c:when>
							<c:when test="${user.no eq initReview.user.no }">
								<!-- 나 자신  -->
								<!-- Right-aligned -->
								<div class="media">
									  <div class="media-body" style="padding-left: 20px">
									    
									    <h6 class="media-heading" style="margin-top: 4px;"><span class="review-span">예매자</span>${initReview.user.nickname }</h6>
									    <p>${initReview.comments}</p>
									    <span class="comment-date"><fmt:formatDate value="${initReview.createDate}" pattern="yyyy.MM.dd"/></span>
									  </div>
									  <div class="media-right" style="padding-left: 111px; padding-right: 20px;">
									     <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initReview.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
									  </div>
								</div>
								
								<hr>
							
							</c:when>
						</c:choose>
						 </c:forEach>
					</div>
				</div>
				
			</div>
			
		
			<!-- QNA -->
			<div class="wrap_detailview_cont" style="margin-top: 40px; display: block;">
			    <p class="none">Q&amp;A 콘텐츠</p>
			
			  	
			    <div class="btn_qna">
			    	<p class="txt">Q&amp;A 게시판은 여러분 모두 질문과 답변에 참여할 수 있는 공간입니다.</p>
			        <p class="txt2">예매/배송 관련 문의사항은 
			       	 	<a href="/customerservice/qnaWrite.htm">고객센터&gt;1:1문의</a> 또는 
			        	<a href="/customerservice/faq.htm">FAQ</a>나 
			        	<a href="/customerservice/howto.htm">이용안내</a>를 이용해주세요.
			        </p>
			    </div>
			    <div class="row">
			    	<div class="col-xs-12 commentBackground">
						
                        <div class="media">
						   
						    <div class="media-body">
						      <h4 class="media-heading">${LOGIN_USER.nickname }</h4>
						      <form class="form-inline" action="" method="get" id="ajax-question">
						      <input type="hidden" name="user.no" value="${LOGIN_USER.no }">
						      <input type="hidden" name="concert.no" value="${art.no }"/>
						      <div class="form-group">
						      <a href="#none" id="commentC">
								  <label for="comment" class="qnabtn-comment">
								  	<p>* 게시된 글의 저작권은 글을 작성한 회원에게 있으며 게시물로 인해 발생하는 문제는 게시자 본인에게 책임이 있습니다.</p>
								  	<p>* 게시판에 고객님의 연락처, 주소 등의 개인정보가 포함된 글을 올리실 경우에는 타인에게 해당 정보가 노출될 수 있으니 게재를 삼가하여 주시기 바랍니다.</p>
								  </label>
								  <textarea class="form-control" rows="5" style="width: 1026px;" id="comment-3" name="comments"></textarea>
							  </a>
							  </div>
							  <div class="form-group">
							  <c:choose>
							  	<c:when test="${empty LOGIN_USER }">
								  	<button type="button" id="question-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle" disabled="disabled">등록</button>							  	
							  	</c:when>
							  	<c:otherwise>
								  	<button type="button" id="question-btn" class="ejobtn ejobtn-success ejobtn-lg commentBtnStyle">등록</button>
							  	</c:otherwise>
							  </c:choose>
							  </div>
							  </form>
							  <div class="text-right">
							  
							  
							  </div>
						    </div>
						  </div>
					</div>
			    	
			    </div>
			    <div class="row">
					<div class="col-xs-12" id="question-list"> 
					
						<div class="count_font"><span class="text-left" style="padding-left: 21px;" >Q&A총 ${countQuestion }개</span></div>
						 <hr>
						<c:forEach items="${initQuestions }" var="initQuestion">
						<c:choose>
							<c:when test="${empty initQuestion}">
								<div class="text-center">등록된 Q&A가 없습니다.</div>
								<hr>
							</c:when>
							<c:when test="${empty LOGIN_USER }">
								<!-- 다른 유저 -->
								<div class="media">
								  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
								    <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initQuestion.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
								  </div>
								  <div class="media-body">
								  
								    <h6 class="media-heading" style="margin-top: 4px;">${initQuestion.user.nickname }</h6>
								    <p>${initQuestion.comments}</p>
								    <span class="comment-date"><fmt:formatDate value="${initQuestion.createDate}" pattern="yyyy.MM.dd"/></span>
								    <span>댓글</span>
								  </div>
								</div>
								<hr>
							</c:when>
							<c:when test="${user.no ne initQuestion.user.no }">
								<!-- 다른 유저 -->
								<div class="media">
								  <div class="media-left" style="padding-left: 20px; padding-right: 111px;">
								     <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initQuestion.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
								  </div>
								  <div class="media-body">
								  
								    <h6 class="media-heading" style="margin-top: 4px;">${initQuestion.user.nickname }</h6>
								    <p>${initQuestion.comments}</p>
								    <span class="comment-date"><fmt:formatDate value="${initQuestion.createDate}" pattern="yyyy.MM.dd"/></span>
								    <span>댓글</span>
								  </div>
								</div>
								<hr>
							</c:when>
							<c:when test="${user.no eq initQuestion.user.no }">
								<!-- 나 자신  -->
								<!-- Right-aligned -->
								<div class="media">
									  <div class="media-body" style="padding-left: 20px">
									    <h6 class="media-heading">${initQuestion.user.nickname }</h6>
									 
									    <p>${initQuestion.comments}</p>
									    <span class="comment-date"><fmt:formatDate value="${initQuestion.createDate}" pattern="yyyy.MM.dd"/></span>
									  </div>
									  <div class="media-right" style="padding-left: 111px; padding-right: 20px;">
									     <c:choose>
									    	<c:when test="${empty LOGIN_USER }">
											    <img src="../resources/images/arts/detail/noArtist02.jpg" class="media-object" style="width:60px">
									    	</c:when>
									    	<c:otherwise>
										      <img src="../resources/images/profile/${initQuestion.theme.img }" class="media-object" style="width:60px">
									    	</c:otherwise>
									    </c:choose>
									  </div>
								</div>
								
								<hr>
							
							</c:when>
						</c:choose>
						 </c:forEach>
					</div>
				</div>
				
			</div>
			<!--공연정보  -->
			<div></div>
			
			
		</div>
	</div>
	<div class="panel-hide   position-style" id="discount-panel">
		<div class="row">
			<div class="col-xs-12 ">
				<div class="panel panel-danger" id="panel-close-btn">
			      <div class="panel-heading">할인 대상 가격 상세 보기<a href="#" id="close-btn" class="class-btn-image" style="left: 401px;"></a> </div>
			      <div class="panel-body">
					<div>군인할인(20%)<p>군복을 입고 오시거나 휴가증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>
					<div>직장인 할인(30%)<p>정장을 입고 오시거나 사원증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>
					<div>대학생 할인(10%)<p>학생증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>
				</div>
			    </div>	
			
			</div>
		</div>
	</div>
	<div class="planner-hide" id="planner-div">
		<span class="w3-tag w3-padding w3-pink w3-center">공연플래너에 추가되었습니다.</span>
	</div>
	
	<div class="planner-close-hide" id="planner-close-div">
		<span class="w3-tag w3-padding w3-pink w3-center">공연플래너에서 삭제되었습니다.</span>
	</div>
	
	
	
	
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	
	$(function(){
			
			 var selectDate;
	  		  var concertNo = ${art.no};  
	  		  var today = new Date();
	  		  var dd = today.getDate();
	  		  var mm = today.getMonth()+1; //January is 0!
	  		  var yyyy = today.getFullYear();
	  		  if(dd<10) {
	  		      dd='0'+dd
	  		  } 
	  		  if(mm<10) {
	  		      mm='0'+mm
	  		  } 
	  		  today = yyyy+'/' + mm+'/'+dd;
	  		  selectDate = today;
	  	    $("#datepicker").datepicker({
	  	    	dateFormat: 'yy/mm/dd',
	  	    	minDate: 0,
	  	    	changeMonth: true,
	  	    	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	  	    	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	  	    	monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	    	monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	  	    	
	  	    	onSelect: function(dateText, inst) {
	  				$("#seatingInfoPerRound").html('');
	  				$('#btn-reserve-ticket').addClass('disabled');
	  				console.log(dateText);
	  				var secDate= dateText  /// 문자열 or  숫자 데이터
	  					var years = secDate.substr(0,4);
	  					var months = secDate.substr(5,2);
	  					var days = secDate.substr(8,2);
	  					var dates = years+'-'+months+'-'+days;  // date로 변경
	  					$("#performanceDay-input").val(dates);
	  				$.ajax({
	  		  			type:"get",
	  		  			url:"performanceCheck.do",
	  		  			dataType:"json",
	  		  			data:{dateText:dateText,concertNo:concertNo},
	  	    			success:function(result) {
	  				    	$("#select_time_box").empty();
	  				  		var html="";
	  						if (result.length) {
	  							html += '<option value=""> 회차를 선택하세요</option>';	
	  		  					$.each(result,function(index,item){
	  								html += '<option value="'+item.no+'">'+item.time+'</option>';
	  		  					})
	  					    	$("#select_time_box").html(html);
	  		  					
	  						} else {
	  							alert("선택한 날짜에 공연정보가 없습니다.");
	  							$("#select_time_box").html('<option value=""> 관람일을 선택하세요</option>');
	  							$("#seatingInfoPerRound").html('');
	  						}   				
	  	    			}
	  	    		})
	  	    		
	  	    	}
	  	  
	  	    });
	  	    
	  	    
	  	    $("#select_time_box").change(function() {
	  	    	
	  	    	if (!$(this).val()) {
	  	    		
	  	    		
	  	    		$("#seatingInfoPerRound").html('');
	  	    		return;
	  	    	}
	  	    	$("#performanceNo-input").val($(this).val());
	  	    	 $.ajax({
	  	 			type:"get",
	  	 			url:"performanceSeat.do",
	  	 			dataType:"json",
	  	 			data:{performanceNo:$(this).val()},
	  	 			success:function(result){
	  	 				var html = "";
	  					html+='<li>전체 <span class="num">'+result.restSeatCount+'</span>석</li>';
	  					html+= '<li>일반석 <span class="num">'+result.restSeatCount+'</span>석</li>';
	  					$("#seatingInfoPerRound").html(html);
	  	 			
	  					if (result.restSeatCount) {
	  						$('#btn-reserve-ticket').removeClass('disabled');
	  					} else {
	  						$('#btn-reserve-ticket').addClass('disabled');
	  					}
	  					
	  	 			}
	  	 		})
	  	 		
	  	 		
	  	 		
	  	    })
	  	    
	  	    
  	   
		  	    
		  	    
			
		})
	
	</script>
</body>
</html>


