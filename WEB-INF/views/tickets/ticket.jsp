
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Home</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://momentjs.com/downloads/moment.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/fullcalendar.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/locale/ko.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.3.1/locale/ko.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">

	
    .fc-sat { color:#0000FF; }
    .fc-sun { color:#FF0000; }
	
	.fc-past, .fc-today.fc-widget-content {
	    background-color: #fff;
	}
	
	.active.fc-widget-content {
		background-color: #5accc7;
	}
	.seat {
		margin: 7px;
	}
	.seat.selected {
		background-color: red;
	}
	
	
	
	

</style>

<script type="text/javascript">
$(function() {	
		
		var currentStep = 0;
		var stepFlag = 0;
		
		var startDate = moment(${startDate});
		var endDate = moment(${endDate});
		var now = new Date();
		var concertNo = '${param.concertNo}';
		var paramPerformanceDay = '${param.performanceDay}';
		var paramPerformanceNo = '${param.performanceNo}';
		
		
		// 예매화면에서 넘어오는 값 처리
		if (paramPerformanceDay) {
			 $.ajax({
		        	url : "getPerformanceList.do",
		        	data : {concertNo:concertNo, performanceDay:paramPerformanceDay},
		        	dataType : "json",
		        	success : function(performances) {
		        		$('#performance-times').empty();
		        		
		        		$.each(performances, function(index, p) {
		        			
				        	var html = '<li class="list-group-item">';
				        		html += (index + 1) + '회차 <span id="show">'+p.time+'</span>';
/* 				        		html += (index + 1) + '회차 <span id="show">'+p.hall.no+'</span>'; */
				        		html += '<button class="btn btn-warning btn-xs pull-right" id="btn-performance-time-'+p.no+'">선택</button>';
		        				html += '</li>';
				        	$('#performance-times').append(html);
		        		})
		        		$('#sDate').text(paramPerformanceDay);
		        		
		        		
		        		if (paramPerformanceNo) {
		        			$("#btn-performance-time-" + paramPerformanceNo).parent().addClass('active').siblings().removeClass('active');
		        			
		        			
		        			$("#perNo").val(paramPerformanceNo);
		        			
		        			var showTime = $("#btn-performance-time-" + paramPerformanceNo).prev().text();
		        			$('#sTime').text(showTime);
		        		
		        			$.ajax({
		        				url : "restSeatCount.do",
		        				data : {performanceNo: paramPerformanceNo},
		        				dataType : "json",
		        				success : function(result) {
		        					
		        					$('#total-seat-count').text(result.seatCount);
		        					$('#rest-seat-count').text(result.restSeatCount);
		        					stepFlag = 1;
		        				}
		        			})
		        		}
		        	} 
		        	
		        });
		}
		
		
		
		$("#ticket-body-content").html('<div id="calendar-box"></div>');
		
		//버튼 아이디
		$("#btn-next-step").click(function() {
			
			if (currentStep == 0) {
				if (stepFlag != 1) {
					alert('날짜와 시각을 선택해 주세요.');
					return;
				} else {
					displaySeat();
				}
			} else if (currentStep == 1) {
				if (stepFlag != 2) {
					alert('좌석을 1개 이상 선택해 주세요.');
					return;
				}
				discountEvent();
				
			} else if (currentStep == 2) {
				if (stepFlag != 3) {
					alert('이벤트를 선택해 주세요.');
					return;
				}
				payment();
			} else if (currentStep == 3) {
				if (stepFlag != 4) {
					alert('결제를 다시 해 주세요.');
					return;
				}
				payment();
			} 
			else if (currentStep == 4) {
				if (stepFlag != 4) {
					alert('결제를 다시 해 주세요.');
					return;
				}
				alert('결제가 두번 이상 취소되어 결제가 취소되었습니다. 초기화 버튼을 눌러주세요');
				
			} 
			currentStep++;
			$('#step-' + currentStep).addClass('active').siblings().removeClass('active');
			
		});
		
		
		function discountEvent() {
			
			$("#ticket-body-content").empty();
			
			var discountHtml = '<form id="menu-panel" method="post">';
				discountHtml += '<div><input type="radio" id="105" name="discount" value="0" /><label for="105"> 없음</label><p>선택하신 이벤트가 없습니다.</p><br></div>';
				discountHtml += '<div><input type="radio" id="100" name="discount" value="'+${price}*0.2+'" /><label for="100"> 군인할인(20%)</label><p>군복을 입고 오시거나 휴가증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>';
				discountHtml += '<div><input type="radio" id="103" name="discount" value="'+${price}*0.3+'" /><label for="103"> 직장인 할인(30%)</label><p>정장을 입고 오시거나 사원증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>';
				discountHtml += '<div><input type="radio" id="101" name="discount" value="'+${price}*0.1+'" /><label for="101"> 대학생 할인(10%)</label><p>학생증을 가지고 오셔야 티켓을 수령하실 수 있습니다.</p><p>위의 조건을 만족시키지 못하시면 차액을 제출하셔야 티켓을 수령하실 수 있습니다.</p><br></div>';
				discountHtml += '</form>';
				
			$("#ticket-body-content").append(discountHtml);
			var str = document.getElementById("ticket-body-title").innerHTML;
    		var res = str.replace("STAGE", "할인 이벤트");
    		document.getElementById("ticket-body-title").innerHTML = res;
			
			$("input").on("click", function () {
				//$("#discount").html(" -" +$( "input:checked" ).val() +" 원" ).css('color', 'red');
				
				
				var discountEventNo = $(":input:radio[name=discount]:checked").attr("id");
				
				$("#discountEventNo").val(discountEventNo);
				
				var discountPrice = $(":input:radio[name=discount]:checked").val();
				var discountPriceText = new Number(discountPrice).toLocaleString();
				$("#discount").text(' -' +discountPriceText+ '원').css('color', 'red');
				var count = selectedSeats.length;
				var discountTicketPrice = '${price}'-discountPrice;
				var totalPrice = count * discountTicketPrice;
				$("#total").val(totalPrice);
				$("#discoPrice").val(discountTicketPrice)
				var totalPriceText = new Number(totalPrice).toLocaleString();
				$('#total-ticket-price').text(totalPriceText + ' 원');
				
				stepFlag = 3;
			})
			
	}
		
		function completeTicket(imp_uid, merchant_uid, paid_amount, apply_num) {
			
			var noItems = [];
			for (var i=0; i<selectedSeats.length; i++) {
				var seat = selectedSeats[i];
				noItems.push(seat.no)
			}
			
			
		 	var ticket = {performanceNo:$("#perNo").val(), properId:imp_uid, merchantId:merchant_uid, totalPrice:paid_amount, cardApprovalNo:apply_num, discountedPrice:$("#discoPrice").val(), discountEventNo:$("#discountEventNo").val(), seatNos:noItems.join(",")};
			//console.log(ticket);
			$.ajax({
				url : "createTicket.do",
				data : ticket,
				dataType : "text",
				success : function(result) {
					
				 	if (result == "success") {
					 	alert('예매내역을 확인해 주세요.');
				 		location.href = "../mypage/mypage.do";		 		
				 	} else {
				 		alert("결재정보 저장 중 오류가 발생하였습니다. 결재를 취소하고 다시 시도하시기 바랍니다.")
				 	}
		         	//self.close();
				}
			}); 
		} 
		
		 function payment() {
			   stepFlag = 4;
			var IMP = window.IMP; // 생략가능
			   IMP.init('imp66053338');  // 가맹점 식별 코드
			   
			   console.log("##222222222222222결재 성공");

			   IMP.request_pay({
			      pg : 'kakao', // 결제방식
			       pay_method : 'card',	// 결제 수단
			       merchant_uid : 'merchant_' + new Date().getTime(),
			      name : '주문명: ${title}',	// order 테이블에 들어갈 주문명 혹은 주문 번호
			       amount : $("#total").val(),	// 결제 금액
			       buyer_email : '',	// 구매자 email
			      buyer_name :  '',	// 구매자 이름
			       buyer_tel :  '',	// 구매자 전화번호
			       buyer_addr :  '',	// 구매자 주소
			       buyer_postcode :  '',	// 구매자 우편번호
			       m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
			    	
			   }, function(rsp) {
				if ( rsp.success ) { // 성공시
					console.log("##################################결재 성공");
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					
					completeTicket(rsp.imp_uid, rsp.merchant_uid, rsp.paid_amount, rsp.apply_num);
				} else { // 실패시
					
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
			}); 
		}
		//3
		function displaySeat() {
			
			$("[id^=btn-performance-time]").remove();
			
			$.ajax({
				url : "seat.do",
	        	data : {performanceNo:$("#perNo").val()},
	        	dataType : "json",
	        	success : function(result) {
	        		
	        		$("#ticket-body-content").empty();
	        		var str = document.getElementById("ticket-body-title").innerHTML;
	        		var res = str.replace("관람일 선택", "STAGE");
	        		document.getElementById("ticket-body-title").innerHTML = res;
	        		var preLine = 0;
        			var $seatLine;
	        		$.each(result.seats, function(index, seat) {
	        			
	        			if (seat.line > preLine) {
	        				$seatLine = $('<div></div>');
	        				$("#ticket-body-content").append($seatLine);
	        				preLine = seat.line;
	        				//console.log(preLine);
	        			}
	        			var $seat = $('<button class="btn btn-primary btn-xs seat" id="seat-'+seat.no+'">'+seat.seatName+'</button>');
	        			$seatLine.append($seat);			
	        		});
	        		
	        		$.each(result.reservedTickets, function(index, ticket) {
	        			$("#seat-" + ticket.seatInfo.no).css('backgroundColor', 'green').addClass('disabled');
	        		})
	        	}
			})
		}		
		
		//1
		$("#calendar-box").fullCalendar({
			selectable: true,
			dayRender: function(date, cell){
				
				if (date >= startDate && date <= endDate){
			    	$(cell).addClass('active');
			    }
				if (date < now) {
					$(cell).removeClass('active');					
				}
			},
			select: function(startDate, endDate) {
				
			},
			dayClick: function(date, jsEvent, view) {
			
				if (date < startDate || date > endDate){
					
					alert("예매 가능한 날짜가 아닙니다.");
					return;
					
				}
				if (date < now-60*60*24*1000) {
					alert("가능 날짜가 아닙니다.");
					return;
				}
				
		        var selectedDate = date.format();	        
		        $.ajax({
		        	url : "getPerformanceList.do",
		        	data : {concertNo:concertNo, performanceDay:selectedDate},
		        	dataType : "json",
		        	success : function(performances) {
		        		
		        		var nowHour = now.getHours();	        		
		        		
		        		$('#performance-times').empty();
		        		
		        		$.each(performances, function(index, p) {
		        			
		        			var pDate = moment(p.dayString + " " + p.time, "YYYY.MM.DD HH:mm");
							var hour = p.time.split(":")[0];
							
				        	var html = '<li class="list-group-item">';
				        		html += (index + 1) + '회차 <span id="show">'+p.time+'</span>';
/* 				        		html += (index + 1) + '회차 <span id="show">'+p.hall.no+'</span>'; */
				        		if (moment().add(5, 'hours').isBefore(pDate)) {
				        			html += '<button class="btn btn-warning btn-xs pull-right" id="btn-performance-time-'+p.no+'">선택</button>';
				        		} else {
				        			html += '<button class="btn btn-warning btn-xs pull-right disabled" id="btn-performance-time-'+p.no+'" disabled>선택</button>';
				        		}
				        		html += '</li>';
				        	$('#performance-times').append(html);
		        		})
		        		$('#sDate').text(selectedDate);
		        	} 
		        	
		        });
		    }
	        
		});
		
		//2
		$('#performance-times').on('click', '[id^=btn-performance-time]', function() {
			var no = $(this).attr("id").replace('btn-performance-time-', '');
			
			$(this).parent().addClass('active').siblings().removeClass('active');
			
			
			$("#perNo").val(no);
			
			var showTime = $(this).prev().text();
			$('#sTime').text(showTime);
			
			$.ajax({
				url : "restSeatCount.do",
				data : {performanceNo: no},
				dataType : "json",
				success : function(result) {
					
					$('#total-seat-count').text(result.seatCount);
					$('#rest-seat-count').text(result.restSeatCount);
					stepFlag = 1;
				}
			})
		});
		
		//4
		var selectedSeats = [];
		
  		$("#ticket-body-content").on('click', '.seat', function() {
	
			if ($(this).hasClass('disabled')) {
				alert("이미 선택된 좌석입니다.");
				return;
			}
	
			if (selectedSeats.length >=4 && !$(this).hasClass('selected')) {				
				alert("선택할 수 있는 좌석개수는 4개뿐입니다.");
				return;
			}  
	
			var seatName = $(this).text();
			
			var seatNo = $(this).attr('id').replace("seat-", "");
			
	
			if (!$(this).hasClass('selected')) {
				selectedSeats.push({no:seatNo, name:seatName});
			} else {
				selectedSeats = selectedSeats.filter(function(seat, index) {
					return seat.no != seatNo;
				})
			}
			if (selectedSeats != 0) {
				stepFlag = 2;
			} else {
				stepFlag = 1;
			}
			$(this).toggleClass('selected');
			
	
	 		var seatNames = "";
	 		
	 		$.each(selectedSeats, function(index, seat) {
	 			if (index == 0) {
	 				seatNames += seat.name;
	 			} else {
	 				seatNames += (","+ " " + seat.name)
	 			}
	 		})
	 		
			$('#cSeat').text(seatNames);
			
		})
		
		
		
});
</script>
</head>
<body>
<input type="hidden" name="" id="perNo" />
<input type="hidden" name="" id="total" />
<input type="hidden" name="" id="discoPrice" />
<input type="hidden" name="" id="discountEventNo" />
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<ul class="nav nav-pills" id="step-list">
									<li class="active" id="step-0"><a href="#">1. 관람일/회차선택</a></li>
									<li  id="step-1"><a href="#">2. 좌석 선택</a></li>
									<li  id="step-2"><a href="#">3. 가격 할인 선택</a></li>
									<li  id="step-3"><a href="#">4. 결제하기</a></li>
									<!-- <li  id="step-4"><a href="#">5. 결제하기</a></li> -->
								</ul>  
							</div>
						</div>
						<hr/>
						<div class="row">
							<div class="col-xs-9">
								<div class="row">
									<div id="second-removd" class="col-xs-9">
										<div class="panel panel-default">
											<div id="ticket-body-title" class="panel-heading text-center">
												관람일 선택	
											</div>
											<div class="panel-body" id="ticket-body-content"></div>
										</div>
									</div>
									<div  id="second-screen" class="col-xs-3">
										<div class="row">
											<div class="col-xs-12">
												<div class="panel panel-info">
													<div class="panel-heading">
														회차 (시간선택)	
													</div>
													<ul class="list-group" id="performance-times">
														<!-- <li class="list-group-item">
															1 회차 <span class="text-danger">15시 00분</span>
															<button class="btn btn-primary btn-xs pull-right">선택</button>
														</li>
														<li class="list-group-item">
															2 회차 <span class="text-danger">17시 00분</span>
															<button class="btn btn-primary btn-xs pull-right">선택</button>
														</li> -->
													</ul>
												</div>
											</div>
										</div>
										<hr />
										<div class="row">
											<div class="col-xs-12">
												<div class="panel panel-info">
													<div id="hide" class="panel-heading">
														현재 예매 현황	
													</div>
													<table class="table">
														<tbody>
															<tr>
																<th>총 좌석수</th>
																<td><span id="total-seat-count"></span> 석</td>
															</tr>
															<tr>
																<th>남은 좌석수</th>
																<td><span id='rest-seat-count'></span> 석</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="panel panel-default">
											<div class="panel-heading">
												유의사항
											</div>
											<div class="panel-default">
												<ul>
													<li class="small">장애인, 국가유공자 활인가격 예매시 현장수령만 가능하며, 현장에서 증빙설 미지참시 할인 불가합니다.</li>
													<li class="small">관람일 전일 아래시간까지만 취소 가능하며, 당일 관람 상품 예매 시에는 추소 불가합니다.</li>
													<li class="small">공연전일 평일/일요일/공휴일 오후5시, 토용일 오전 11시 (단, 토요일이 공휴일인 경우는 오전 11시)</li>
													<li class="small">당일관람 상품예매시는 취소불가합니다.</li>
													<li class="small">ATM기기에서 가상계좌입금이 안될 수 있으니 인터넷/폰뱅킹이 어려우시면 무통장 입금외 다른 결재수단을 선택해주세요</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-3">
								<div class="row">
									<div class="col-xs-12">
										<div class="panel panel-default">
											<table class="table">
												<tbody>
													<colgroup>
														<col width="30%" />
														<col width="*" />
													</colgroup>
													<tr>
														<td colspan="2">
															<img src="/jhta/resources/images/concerts/${img}" class="img-thumbnail" alt="Cinque Terre">
														</td>
													</tr>
													<tr>
														<th>제목</th>
														<td id=''>${title}</td>
													</tr>
													<tr>
														<th>시작일</th>
														<td><fmt:formatDate value="${start1Date}" pattern="yyyy.MM.dd"/></td>
													</tr>
													<tr>
														<th>종료일</th>
														<td><fmt:formatDate value="${end1Date}" pattern="yyyy.MM.dd"/></td>
													</tr>
											</table>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="panel panel-primary">
											<div class="panel-heading">
												나의 예매정보
											</div>
											<table class="table">
												<tbody>
													<tr>
														<th>날짜</th>
														<td id='sDate'></td>
													</tr>
													<tr>
														<th>시간</th>
														<td id='sTime' ></td>
													</tr>
													<tr>
														<th>좌석</th>
														<td id='cSeat'></td>
													</tr>
													<tr>
														<th>티켓금액</th>
														<td class="text-right"><fmt:formatNumber value="${price}" pattern="##,###"/> 원 </td>
													</tr>
													<tr>
														<th>할인금액</th>
														<td id="discount" class="text-right"><fmt:formatNumber value="" pattern="##,###"/> 원 </td>
													</tr>
												</tbody>
												<tfoot>
													<tr class="active">
														<th>총결제금액</th>
														<td id="total-ticket-price" class="text-right"> 원</td>
													</tr>
													
												</tfoot>
											</table>
										</div>
									</div>
									<div class="row ">
										<div class="col-xs-12 text-right" >
											<a class="btn btn-warning btn-lg" target=""  href="../ticket/home.do?concertNo=${no }">초기화</a>
											<button class="btn btn-primary btn-lg" id="btn-next-step" style="margin-right: 13px;">다음으로</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>