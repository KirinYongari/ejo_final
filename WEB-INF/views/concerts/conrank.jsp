<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>랭킹</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <%@ include file="../include/main-nav.jsp"%>
  <style type="text/css">
      .rank_table th, .rank_table td {
          text-align: center;
          vertical-align: middle !important;
      }
      .rank_table td:nth-child(3) {
          text-align: left;
          vertical-align: middle !important;
      }
      #percent-span {
          font-size: 20px;
          color: #ee1289;
      }
      .rank_img {
          border-radius: 10px;
          width: 100%;
		  height: 100px;
      }
      #today {
          color: #ee1289;
      }
      .label-success {
          background-color: #ee1289;
      }
      .rank-btn button {
          border-radius: 30px;
          background-color: white;
          border: 1px solid grey;
      }
      .rank-btn button.on {
		  color : white;
		  background-color: #ee1289;
		  border: 1px solid #ee1289;
      }
      .rankTable {
      	  vertical-align: middle !important;
      	  text-align: center;
      }
      #con-link {
      	  color: black;
      }
      .rank-img {
      	  width: 100%;
      	  border-radius: 10px;
      	  height: 130px;
      }
      .rank-num {
      	  font-size: 30px;
      	  color: #ee1289;
      }
      .rank-rate {
      	  font-size: 25px;
      	  color: #ee1289;
      	  text-align: center;
      }
      .buy-btn {
      	  background-color: #ee1289;
      	  color: white;
      }
      .select_opt {padding: 0 10px; margin-bottom: 37px; border: 1px solid #E6E6E6;}
      .select_opt a {display: inline-block; padding: 18px 22px; color: #333333; font-size: 16px;}
      .select_opt a:hover {color: #ee1289;}
      .select_opt a.on {color: #ee1289; font-weight: bold;}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<br/>
    <div class="rank-btn text-center">
    	<input type="hidden" id="sortby" value="daily"/>
        <button id="weekly" class="btn btn-lg on">주간</button>
        <button id="monthly" class="btn btn-lg">월간</button>
    </div>
    <div class="text-center">
        <h2 id="today"></h2>
    </div>
    <br/>
   	<div class="select_opt">
        <input type="hidden" id="opt-input" name="opt" value="all"/>
        <a id="all" href="javascript:void(0);" class="on" >전체</a>
        <a id="con" href="javascript:void(0);">콘서트</a>
        <a id="art" href="javascript:void(0);">아트&amp;시어터</a>
    </div>
    <div class="rankTable row">
        <div class="rankTable_header col-xs-2">
            <h4 class="rank_sort"><strong><span id="rank_opt_daily">주간</span> TOP 10</strong></h4>
        </div>
    </div>
       <hr/>
        <div>
            <table class="table rank_table">
                <colgroup>
                    <col width="10%" />
                    <col width="10%" />
                    <col width="*" />
                    <col width="15%" />
                    <col width="15%" />
                    <col width="10%" />
                </colgroup>
                <thead>
                    <tr>
                        <th>랭킹</th>
                        <th colspan="2">공연명</th>
                        <th>아티스트</th>
                        <th>공연일시</th>
                        <th>예매</th>
                    </tr>
                </thead>
                <tbody class="rank-con">
                </tbody>
            </table>
        </div>
        <br/>
</div>
<script type="text/javascript">
$(function() {

var ajaxVar = {
	
	rankTable : function() {
		
		$.ajax({
			type : "get",
			url : "rankPerf.do",
			data : {opt: $('#opt-input').val(), sortby: $('#sortby').val()},
			dataType : "json",
			success : function(result) {
				console.log(result);
				$('.rank-con').empty();
				var rankHtml = "";
				$.each(result, function(index, item) {
					rankHtml += "<tr></tr>";
					rankHtml += "<td><span class='rank-num'>"+item.RANK+"</span></td>";
					if (item.CATENO == 1) {
						rankHtml += "<td>";
						rankHtml += "<a id='con-link' href='detail.do?conNo="+item.NO+"'><img class='rank-img' src='../resources/images/concerts/"+item.COVERIMG+"' alt='' /></a>";
						rankHtml += "</td>";
						rankHtml += "<td>";
						rankHtml += "<a id='con-link' href='detail.do?conNo="+item.NO+"'><h4>"+item.TITLE+"</h4></a>";
						rankHtml += "</td>";
					} else {
						rankHtml += "<td>";
						rankHtml += "<a id='con-link' href='../art/detail.do?concertno="+item.NO+"'><img class='rank-img' src='../resources/images/arts/"+item.COVERIMG+"' alt='' /></a>";
						rankHtml += "</td>";
						rankHtml += "<td>";
						rankHtml += "<a id='con-link' href='../art/detail.do?concertno="+item.NO+"'><h4>"+item.TITLE+"</h4></a>";
						rankHtml += "</td>";
					}
					rankHtml += "<td>"+item.ARTIST+"</td>";
					rankHtml += "<td>"+item.OPENDATE+" - "+item.CLOSEDATE+"</td>";
					rankHtml += "<td class='rank-rate'>"+item.RATE+"%<br/><a class='ejobtn ejobtn-success btn-xs'  href='../ticket/home.do?concertNo="+item.NO+"'>예매하기</a></td>";
					rankHtml += "<tr></tr>";
				})
				$('.rank-con').html(rankHtml);
			}
		})
		
	}
}
	
	ajaxVar.rankTable();
	
	$('.rank-btn button').click(function(event) {
		if (!$(this).hasClass('on')) {
			$('.rank-btn button.on').removeClass('on');
			$(this).addClass('on');
			var dateSort = $(this).text();
			$('#rank_opt_daily').text(dateSort);
			var date = $(this).attr('id');
			$('#sortby').val(date);
			ajaxVar.rankTable();
		}
	})
	
	$('.select_opt a').click(function(event) {
		if (!$(this).hasClass('on')) {
			$('.select_opt a.on').removeClass('on');
			$(this).addClass('on');
			var opt = $(this).attr('id');
			$('#opt-input').val(opt);
			ajaxVar.rankTable();
		}
	})
	
	var day = new Date();
	var yest = new Date();
	var week = new Date();
	var mon = new Date();

	var today = day.getFullYear() + '년 ' + ('0' + (day.getMonth() + 1)).slice(-2) + '월 ' + ('0' + day.getDate()).slice(-2) + '일'
	
	yest.setDate(yest.getDate() - 1);
	var yestDay = yest.getFullYear() + '년 ' + ('0' + (yest.getMonth() + 1)).slice(-2) + '월 ' + ('0' + yest.getDate()).slice(-2) + '일'
	
	week.setDate(week.getDate() - 7);
	var weekly = week.getFullYear() + '년 ' + ('0' + (week.getMonth() + 1)).slice(-2) + '월 ' + ('0' + week.getDate()).slice(-2) + '일'
	
	mon.setMonth(mon.getMonth() - 1);
	var monthly = mon.getFullYear() + '년 ' + ('0' + (mon.getMonth() + 1)).slice(-2) + '월 ' + ('0' + mon.getDate()).slice(-2) + '일'
	
	$('#today').text(yestDay+" ~ "+today+" 현재");
	
	$('.select_opt_pick').empty();
		var dailyHtml = "";
		dailyHtml += "<h4>";
		dailyHtml += ""+yestDay+" 랭킹";
		dailyHtml += "</h4>";
		$('.select_opt_pick').html(dailyHtml);
	
	$('.rank-btn #weekly').click(function(event) {
		$('.select_opt_pick').empty();
		var weeklyInput = "";
		weeklyInput += "<h4>";
		weeklyInput += ""+weekly+" ~ "+today+" 랭킹";
		weeklyInput += "</h4>";
		$('#today').empty();
		$('#today').text(weekly+" ~ "+today);
		ajaxVar.rankTable();
	})
	
	$('.rank-btn #monthly').click(function(event) {
		$('.select_opt_pick').empty();
		var monthInput = "";
		monthInput += "<h4>";
		monthInput += ""+monthly+" ~ "+today+" 랭킹";
		monthInput += "</h4>";
		$('#today').empty();
		$('#today').text(monthly+" ~ "+today);
		ajaxVar.rankTable();
	})
	
})
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>