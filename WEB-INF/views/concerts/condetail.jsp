<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공연 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=568d73592315a725a1e49d887c4ced80&libraries=services"></script>
<%@ include file="../include/main-nav.jsp"%>
<style type="text/css">
	.perf-detail-img {
		border-radius: 10px;
		width: 100%;
		max-height: 400px;
	}
	.perf_title {
		height: 100px;
        text-align: left;
        margin-top: 20px;
	}
    .perf_title .label {
        background-color: #ee1289;
        font-size: 15px
    }
	.panel-body {
		text-align: center;
	}
	.detail_contents {
		font-size: 18px;
		vertical-align: middle;
		text-align: center;
	}
	.glyphicon {
		font-size: 20px;
	}
    .buy-btn {
        color: #ee1289;
        background-color: white;
        width: 200px;
        border: 1px solid #ee1289;
    }
    .btn-planner {
    	margin-bottom: 90px;
        border-radius: 30px;
        width: 150px;
    }
    .btn-planner-tab a.on {
    	color: #ee1289;
    	border: 1px solid #ee1289;
    }
    .perf-detail {
    }
    .perf-detail img {
        margin-top: 30px;
        width: 100%;
    }
    .buy-btn {
        margin-bottom: 5px;
    }
    .info-table td {
    	font-size: 15px;
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
	.list_seat {
		overflow: hidden;
		margin-left: 4px;
		margin-top: 10px;
		padding: 10px 0 10px 19px;
		border: 1px solid #f7f7f7;
		background-color: #fbfbfb;
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
	.rank-img {
		width: 60px;
		height: 80px;
		border-radius: 10px;
	}
	.rank-num {
		color: #ee1289;
	}
	.side-rank-table th, .side-rank-table td {
		text-align: center;
		vertical-align: middle;
	}
	.side-rank-table a {
		color: black;
	}
	.side-rank-table a:hover {
		color: #ee1289;
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
	.w3-pink, .w3-hover-orange:hover {
	    color: #fff!important;
	    background-color: #e30076!important;
	    opacity: 0.7;
	    border-radius: 11px 11px 11px 11px;
	}
	#btn_add_planner {
		margin-bottom: 90px;
		margin-left: 300px;
		
	}
	.btn-area button {
		width: 100px;
		height: 110px;
	}
	.buy-button a {
		width: 200px;
	}
    .detail_tab {padding: 0 10px; margin-bottom: 37px; border: 1px solid #E6E6E6;}
    .detail_tab a {display: inline-block; padding: 18px 22px; color: #333333; font-size: 16px;}
    .detail_tab a:hover {color: #ee1289;}
    .detail_tab a.on {color: #ee1289; font-weight: bold;}
</style>
</head>
<body>
	<div class="container">
	<input id="conNo" type="hidden" value="${con.no }" />
	<input id="artistName" type="hidden" value="${con.artist }" />
		<div class="row">
			<br />
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-3">
							<img class="perf-detail-img" src="../resources/images/concerts/${con.coverImg }" alt="" />
						</div>
						<div class="col-xs-9">
                            <div class="perf_title">
                                <label class='label label-success'>단독판매</label>
                                <h2>${con.title }</h2>
                            </div>
							<br/>
							<div class="btn-planner-tab">
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
								<div class="planner-hide" id="planner-div">
									<span class="w3-tag w3-padding w3-pink w3-center">공연플래너에 추가되었습니다.</span>
								</div>
								
								<div class="planner-close-hide" id="planner-close-div">
									<span class="w3-tag w3-padding w3-pink w3-center">공연플래너에서 삭제되었습니다.</span>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<table class="info-table">
									<colgroup>
										<col width="25%" >
										<col width="25%" >
										<col width="25%" >
										<col width="25%" >
									</colgroup>
										<tr>
											<td><strong>공연기간</strong></td>
											<td>
												<fmt:formatDate value="${con.openDate }" pattern="yyyy.MM.dd"/> - 
			                                    <fmt:formatDate value="${con.closeDate }" pattern="yyyy.MM.dd"/>
											</td>
											<td><strong>아티스트</strong></td>
											<td>${con.artist }</td>
										</tr>
										<tr>
											<td><strong>기획사</strong></td>
											<td>${con.agency }</td>
											<td><strong>장르</strong></td>
											<td>${con.genre }</td>
										</tr>
										<tr>
											<td><strong></strong></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
					<hr/>
					<div class="buy-button">
					    <a class="ejobtn ejobtn-success btn-lg pull-right" target="_blank"  href="../ticket/home.do?concertNo=${con.no }">예매하기</a>
					</div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
		    <div class="col-xs-12">
		        <div class="detail_tab">
                    <input type="hidden" id="detail_list" name="det" value="con_detail">
                    <a id="con_detail" href="javascript:void(0);" class="on">상세정보</a>
                    <a id="con_expect" href="javascript:void(0);" >기대평</a>
                    <a id="con_review" href="javascript:void(0);" >관람후기</a>
                    <a id="con_qna" href="javascript:void(0);" >Q&amp;A</a>
                    <a id="con_hall" href="javascript:void(0);" >공연장정보</a>
                    <a id="con_reserve" href="javascript:void(0);" >예매안내</a>
                </div>
		    </div>
		</div>
		<div class="row">
		    <div class="col-xs-8 perf-detail">
				
			</div>
			<div class="col-xs-4">
				<div class="side-rank"></div>
			</div>
			<div class="col-xs-12 perf-expect"></div>
			<div class="col-xs-12 perf-review"></div>
			<div class="col-xs-12 perf-qna"></div>
			<div class="col-xs-12 perf-reserve"></div>
		</div>
		<div id="map" style="width:100%; height:350px;"></div>
		<br/>
	</div>
<script type="text/javascript">
$(function() {

	$(".detail_middle").on("click",".btn_like_radius_off",function(){
        var choose = $(this);
           var concertNo = ${con.no};  
           $.ajax({
          	 type:"get",
          	 url:"../art/addPlanner.do",
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
    	var concertNo = ${con.no};
    	$.ajax({
    		 type:"get",
        	 url:"../art/deletePlanner.do",
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
	
	$.ajax({
		type : "get",
		url : "rankPerf.do",
		data : {opt: 'con', sortby: 'monthly'},
		dataType : "json",
		success : function(result) {
			console.log(result);
			$('.side-rank').empty();
			var rankHtml = "<h3>예매 랭킹</h3>";
				rankHtml += "<table class='table side-rank-table'>";
				rankHtml += "<colgroup>";
				rankHtml += "<col width='10%'>";
				rankHtml += "<col width='80%'>";
				rankHtml += "<col width='10%'>";
				rankHtml += "</colgroup>";
			if (result[0].CATENO == 1) {
				rankHtml += "<tr>";
				rankHtml += "<th class='rank-num'>";
				rankHtml += "<h3>"+result[0].RANK+"</h3></th>";
				rankHtml += "<td><a href='detail.do?conNo="+result[0].NO+"'>"+result[0].TITLE+"<br/><br/>";
				rankHtml += "";
				rankHtml += result[0].OPENDATE+" ~ "+result[0].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='detail.do?conNo="+result[0].NO+"'><img class='rank-img' src='../resources/images/concerts/"+result[0].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			} else {
				rankHtml += "<tr>";
				rankHtml += "<th class='rank-num'>"
				rankHtml += "<h3>"+result[0].RANK+"</h3></th>"
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[0].NO+"'>"+result[0].TITLE+"<br/><br/>";
				rankHtml += result[0].OPENDATE+" ~ "+result[0].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[0].NO+"'><img class='rank-img' src='../resources/images/arts/"+result[0].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			}
			if (result[1].CATENO == 1) {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[1].RANK+"</h3></th>";
				rankHtml += "<td><a href='detail.do?conNo="+result[1].NO+"'>"+result[1].TITLE+"<br/><br/>";
				rankHtml += result[1].OPENDATE+" ~ "+result[1].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='detail.do?conNo="+result[1].NO+"'><img class='rank-img' src='../resources/images/concerts/"+result[1].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			} else {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[1].RANK+"</h3></th>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[1].NO+"'>"+result[1].TITLE+"<br/><br/>";
				rankHtml += result[1].OPENDATE+" ~ "+result[1].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[1].NO+"'><img class='rank-img' src='../resources/images/arts/"+result[1].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			}
			if (result[2].CATENO == 1) {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[2].RANK+"</h3></th>";
				rankHtml += "<td><a href='detail.do?conNo="+result[2].NO+"'>"+result[2].TITLE+"<br/><br/>";
				rankHtml += result[2].OPENDATE+" ~ "+result[2].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='detail.do?conNo="+result[2].NO+"'><img class='rank-img' src='../resources/images/concerts/"+result[2].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			} else {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[2].RANK+"</h3></th>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[2].NO+"'>"+result[2].TITLE+"<br/><br/>";
				rankHtml += result[2].OPENDATE+" ~ "+result[2].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[2].NO+"'><img class='rank-img' src='../resources/images/arts/"+result[2].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			}
			if (result[3].CATENO == 1) {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[3].RANK+"</h3></th>";
				rankHtml += "<td><a href='detail.do?conNo="+result[3].NO+"'>"+result[3].TITLE+"<br/><br/>";
				rankHtml += result[3].OPENDATE+" ~ "+result[3].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='detail.do?conNo="+result[3].NO+"'><img class='rank-img' src='../resources/images/concerts/"+result[3].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			} else {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[3].RANK+"</h3></th>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[3].NO+"'>"+result[3].TITLE+"<br/><br/>";
				rankHtml += result[3].OPENDATE+" ~ "+result[3].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[3].NO+"'><img class='rank-img' src='../resources/images/arts/"+result[3].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			}
			if (result[4].CATENO == 1) {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[4].RANK+"</h3></th>";
				rankHtml += "<td><a href='detail.do?conNo="+result[4].NO+"'>"+result[4].TITLE+"<br/><br/>";
				rankHtml += result[4].OPENDATE+" ~ "+result[4].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='detail.do?conNo="+result[4].NO+"'><img class='rank-img' src='../resources/images/concerts/"+result[4].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			} else {
				rankHtml += "<tr>";
				rankHtml += "<th>";
				rankHtml += "<h3>"+result[4].RANK+"</h3></th>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[4].NO+"'>"+result[4].TITLE+"<br/><br/>";
				rankHtml += result[4].OPENDATE+" ~ "+result[4].CLOSEDATE+"</a></td>";
				rankHtml += "<td><a href='../art/detail.do?concertno="+result[4].NO+"'><img class='rank-img' src='../resources/images/arts/"+result[4].COVERIMG+"' alt='' /></a></td>";
				rankHtml += "</tr>";
			}
				rankHtml += "</table>";
				rankHtml += "<a id='more-btn' href='rank.do' style='color: black;' class='pull-right'>더보기 ></a><br/>";
			$('.side-rank').html(rankHtml);
		}
	})
	
	$('#map').hide();
	
	var perfVar = {
		detail : function() {
			var detail = "";
			detail += "<h3>출연</h3>";
			detail += "<p>${con.artist }</p>";
			detail += "<h3>공연시간</h3>";
			detail += "<fmt:formatDate value='${con.openDate }' pattern='yyyy년 MM월 dd일 (E)'/> ~ <fmt:formatDate value='${con.closeDate }' pattern='yyyy년 MM월 dd일 (E)'/><br />";
			detail += "<c:forEach var='perf' items='${perfs }'>";
			detail += "<fmt:formatDate value='${perf.day }' pattern='E'/> / ${perf.time } <br />";
			detail += "</c:forEach>";
			detail += "</p>";
			detail += "<h3>기본가</h3>";
			detail += "<ul class='list_seat'>";
			detail += "<li><span class='seat_color' style='background:#BEA886'></span> <span class='seat_name'>전석</span> <span class='price'><fmt:formatNumber value='${con.price }' type='number' /> 원</span></li>";
			detail += "</ul>";
			detail += "<h3>예매 공지사항</h3>";
			detail += "<p>";
			detail += "※ 티켓 오픈 : <fmt:formatDate value='${con.ticketOpenDate }' pattern='yyyy년 MM월 dd일 E요일 a h시'/><br/>";
			detail += "※ 매수 제한 : 회차별 1인 4매";
			detail += "</p>";
			detail += "<img src='../resources/images/concerts/${con.contentImg }'>";
			$('.perf-detail').html(detail);
		},
		expect : function() {
			
		},

		review : function() {
			
		},

		qna : function() {
			
		},

		hall : function() {
			$.ajax({
				type : "get",
				url : "perfdetail.do",
				data : {
					conNo : $('#conNo').val()
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

	perfVar.detail();

	$.ajax({
		type : "get",
		url : "perfdetail.do",
		data : {
			conNo : $('#conNo').val()
		},
		dataType : "json",
		success : function(result) {
			console.log(result);
		}
	})

	$('.detail_tab a').click(function(event) {
		if (!$(this).hasClass('on')) {
			$('.detail_tab a.on').removeClass('on');
			$(this).addClass('on');
			var detail = $(this).attr('id');
			$('#detail_list').val(detail);
			$('#map').hide();

			if ($('#detail_list').val() == 'con_detail') {
				$('.perf-detail').addClass('col-xs-8');
				$('.perf-detail').empty();
				$('.side-rank').show();
				perfVar.detail();
				
			}

			if ($('#detail_list').val() == 'con_expect') {
				$('.perf-detail').removeClass('col-xs-8');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				perfVar.expect();
			}

			if ($('#detail_list').val() == 'con_review') {
				$('.perf-detail').removeClass('col-xs-8');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				perfVar.review();
			}

			if ($('#detail_list').val() == 'con_qna') {
				$('.perf-detail').removeClass('col-xs-8');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				perfVar.qna();
			}

			if ($('#detail_list').val() == 'con_hall') {
				$('.perf-detail').removeClass('col-xs-8');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				$('#map').show();
				perfVar.hall();
			}

			if ($('#detail_list').val() == 'con_reserve') {
				$('.perf-detail').removeClass('col-xs-8');
				$('.perf-detail').addClass('col-xs-12');
				$('.perf-detail').empty();
				$('.side-rank').hide();
				perfVar.reserve();
			}
		}
	});

	var listVal = $('#detail_list').val();
	console.log(listVal);

})
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>