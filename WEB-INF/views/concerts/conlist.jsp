<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>콘서트 리스트</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%@ include file="../include/main-nav.jsp"%>
<style type="text/css">
    .grid_table .thumbnail {
        text-align: left;
    }
    .grid_table .thumbnail div {
        margin: 15px;
        margin-top: 1px;
    }
    .perf-grid-item-heading {
        text-align: center;
    }
    .label-default {
        color: #ee1289;
        background-color: white;
        border: 1px solid #ee1289;
    }
    .label-success {
        background-color: #ee1289;
        border: 1px solid #ee1289;
    }
    .top_text h3 {
        color: #ee1289;
    }
    .top_con {
        font-size: 16px;
        text-align: center;
        vertical-align: middle !important;
    }
    .top_con img {
        border-radius: 10px;
        width: 100%;
        height: 380px;
        margin-bottom: 10px;
    }
	.list-table th, .list-table td {
		vertical-align: middle !important;
	}
	.glyphicon {
		font-size: 24px;
	}
	.thumbnail {
		width: 265px;
		height: 500px;
		margin: 10px;
		text-align: center;
		margin-bottom: 10px;
		border-radius: 10px;
		padding: 10px;
	}
	.perf-grid-img {
		vertical-align: middle !important;
		text-align: center;
		border-radius: 10px;
		width: 100%;
		max-height: 300px;
	}
	.perf-list-img {
		vertical-align: middle !important;
		text-align: center;
		border-radius: 10px;
		width: 100%;
		height: 200px;
	}
	.list_title {
		text-align: left;
	}
    .list_sort {padding-top:8px}
    .list_sort li {display:inline-block;}
    .list_sort li a{display:block;padding:0 17px 0 20px;background: no-repeat left 6px; font-size:16px;;color:#333;}
    .list_sort li a:hover{color:#ee1289}
    .list_sort li.on a{color:#ee1289;font-weight:bold}
    .list_sort li.last a{padding-right:0}
    .view_btn{float:left; font-size:0}
    .view_btn button{overflow:hidden; width:36px; height:36px; padding:0; border:1px solid #eee; text-indent:-9999px; color: #ee1289; background:url(//cdnticket.melon.co.kr/resource/image/web/common/btn_ctrl_view.png) no-repeat -36px 0;}
    .view_btn button:first-child{border-right:1px solid #00cd3c;}
    .view_btn button:first-child.on, .control_list .view_btn button:first-child:hover{background-position:-36px -36px;border:1px solid #00cd3c;}
    .view_btn button:last-child{background-position:0 -36px;border-left:none}
    .view_btn button:last-child.on, .control_list .view_btn button:last-child:hover{background-position:0 0;border:1px solid #00cd3c;border-left:none;width:35px;}
    .sub_tab {padding: 0 10px; margin-bottom: 37px; border: 1px solid #E6E6E6;}
    .sub_tab a {display: inline-block; padding: 18px 22px; color: #333333; font-size: 16px;}
    .sub_tab a:hover {color: #ee1289;}
    .sub_tab a.on {color: #ee1289; font-weight: bold;}
</style>
</head>
<body>
	<div class="container">
        <div class="top_text">
        	<h3>HOT 콘서트</h3>
        </div>
        <br/>
		<div class="row top_con">
            <c:forEach var="likecon" items="${likecon }">
				    <div class="col-xs-3">
						<a href="detail.do?conNo=${likecon.no }" style="color: black;">
				        	<img width="100%;" src="../resources/images/concerts/${likecon.coverImg }" alt="${likecon.title }의 콘서트 커버 사진"/>
				        	<strong>${likecon.title }</strong>
						</a>
				    </div>
            </c:forEach>
		</div>
        <br/>
        <br/>
		<div class="row">
			<div class="col-xs-12">
				<div class="sub_tab">
                    <input type="hidden" id="opt_list" name="opt" value="all">
                    <a id="all" href="javascript:void(0);" class="on">전체</a>
                    <a id="idol" href="javascript:void(0);" >아이돌</a>
                    <a id="fan" href="javascript:void(0);" >팬클럽/팬미팅</a>
                    <a id="bal" href="javascript:void(0);" >발라드/R&amp;B</a>
                    <a id="hip_edm" href="javascript:void(0);" >힙합/EDM</a>
                    <a id="ind_roc" href="javascript:void(0);" >인디/록</a>
                    <a id="visit_kr" href="javascript:void(0);" >내한</a>
                    <a id="other" href="javascript:void(0);" >그 외 장르</a>
                </div>
				<div class="ctrl_view">
                    <div class="control_list">
                        <div class="btn-group view_btn" role="group">
                            <button id="btn-list" type="button" class="btn_list_type type_btn"></button>
                            <button id="btn-grid" type="button" class="btn_grid_type on type_btn"></button>
                        </div>
                        <input type="hidden" id="sortby_list" name="sortby" value="like" />
                        <ul class="list_sort pull-right">
                            <li class="on" id="like" value="like"><a href="javascript:void(0);">인기순</a></li>
                            <li id="date" value="date"><a href="javascript:void(0);">공연임박순</a></li>
                            <li id="new" value="new"><a href="javascript:void(0);">최신순</a></li>
                        </ul>
                    </div>
				</div>
			</div>
		</div>
		<br />
		<div class="row">
			<div class="col-xs-12">
				<div id="products" class="perf-item">
					<div class="perf-item-group"></div>
				</div>
			</div>
		</div>
		<br/>
	</div>
<script type="text/javascript">
var controlView = {//뷰 타입 선택(앨범,리스트)
    init: function(){
        var target = $(".ctrl_view");
        this.ctrlBtn = target.find(".type_btn");
        this.ctrlCont = target.find(".tapping");
        this.addEvent();
    },
    addEvent : function(){
        var self = this;
        this.ctrlBtn.on("click",function(){
        self.change($(this));
        })
    },
        change : function(btn){
        var idx = btn.index();
        this.ctrlCont.eq(idx).addClass("on").siblings(".type_sort").removeClass("on");
        btn.addClass("on").siblings(".type_btn").removeClass("on");
    }
}
controlView.init();

$(function() {

var ajaxVar = {
		grid: function() {
			$.ajax({
				type : "get",
				url : "conlist.do",
				data : {opt: $('#opt_list').val(), sortby: $('#sortby_list').val()},
				dataType : "json",
				success : function(result) {
					if ($('.btn_list_type').hasClass('on')) {
						$('.btn_list_type').removeClass('on');
						$('.btn_grid_type').addClass('on');
					}
					$('.perf-item-group').empty();
					
					if ($('.perf-item-group').hasClass('panel panel-default')) {
						$('.perf-item-group').removeClass('panel panel-default');
					}
					var gridHtml = "<div class='grid_table tapping'>";
						$.each(result, function(index, item) {
							gridHtml += "<a href='detail.do?conNo="+item.no+"' style='color: black;'>";
							gridHtml += "<div class='thumbnail col-xs-3'>";
							gridHtml += "<img class='perf-grid-img' src='../resources/images/concerts/"+item.coverImg+"' alt='' />";
							gridHtml += "<div class='perf-grid-content'>";
							gridHtml += "<h4 class='perf-grid-item-heading'>"+item.title+"</h4>";
							gridHtml += "<p class='perf-grid-item-text'>"+item.openDate+" - "+item.closeDate+"</p>";
							$.each(item.halls, function(index, hall) {
								gridHtml += "<p class='perf-grid-item-text'>"+hall.name+"</p>";
							})
					        gridHtml += "<label class='label label-success label-xs'>단독판매</label><label class='label label-default label-xs'>판매중</label>";
							gridHtml += "</div>";
							gridHtml += "</div>";
							gridHtml += "</a>";
					})
					gridHtml += "</div>";
					$('.perf-item-group').html(gridHtml);
				}
			});
		},
		list: function() {
			$('.perf-item-group').empty();
			
			$('.perf-item-group').addClass('panel panel-default');
			
			var tableHtml = "<div class='list-table tapping on'>";
			tableHtml += "<table class='table table-striped'>";
			tableHtml += "<colgroup>";
			tableHtml += "<col width='15%'>";
			tableHtml += "<col width='*'>";
			tableHtml += "<col width='20%'>";
			tableHtml += "<col width='20%'>";
			tableHtml += "</colgroup>";
			tableHtml += "<thead>";
			tableHtml += "<tr>";
			tableHtml += "<th></th>";
			tableHtml += "<th>공연명</th>";
			tableHtml += "<th>공연일시</th>";
			tableHtml += "<th>공연장소</th>";
			tableHtml += "</tr>";
			tableHtml += "</thead>";
			tableHtml += "<tbody id='tbody-list'>";
			tableHtml += "</tbody>";
			tableHtml += "</table>";
			tableHtml += "</div>";
			
			$('.perf-item-group').html(tableHtml);
			
			$.ajax({
				type : "get",
				url : "conlist.do",
				data : {opt: $('#opt_list').val(), sortby: $('#sortby_list').val()},
				dataType : "json",
				success : function(result) {
						var listHtml = "";
						$.each(result, function(index, item) {
							listHtml += "<tr>";
							listHtml += "<td><a href='detail.do?conNo="+item.no+"'><img class='perf-list-img' src='../resources/images/concerts/"+item.coverImg+"' alt='' /></a></td>";
							listHtml += "<td class='list_title'><a href='detail.do?conNo="+item.no+"' style='color: black;'><label class='label label-success label-xs'>단독판매</label><label class='label label-default label-xs'>판매중</label><br/><br/>"+item.title+"</a></td>";
							listHtml += "<td>"+item.openDate+" - "+item.closeDate+"</td>";
							$.each(item.halls, function(index, hall) {
								listHtml += "<td>"+hall.name+"</td>";
							})
							listHtml += "</tr>";
						})
					$('#tbody-list').html(listHtml);
				}
			})
		}
}
	
	ajaxVar.grid();
	
	$('.sub_tab a').click(function(event) {
		if (!$(this).hasClass('on')) {
			$('.sub_tab a.on').removeClass('on');
			$(this).addClass('on');
			var opt = $(this).attr('id');
			$('#opt_list').val(opt);
		}
		
		if ($('.btn_list_type').hasClass('on')) {
			ajaxVar.list();
		}
		
		if ($('.btn_grid_type').hasClass('on')) {
			ajaxVar.grid();
		}
		
	})
	
	$('.list_sort li').click(function(event) {
		if (!$(this).hasClass('on')) {
			$('.list_sort li.on').removeClass('on');
			$(this).addClass('on');
			var sort = $(this).attr('id');
			$('#sortby_list').val(sort);
		}
		if ($('.btn_list_type').hasClass('on')) {
			ajaxVar.list();
		}
		
		if ($('.btn_grid_type').hasClass('on')) {
			ajaxVar.grid();
		}
	})
	
	$('#btn-grid').click(function(event) {
		$('.perf-item-group').empty();
		
		if ($('.perf-item-group').hasClass('panel panel-default')) {
			$('.perf-item-group').removeClass('panel panel-default');
		}
		
		ajaxVar.grid();
	});
	
	$('#btn-list').click(function(event) {
		ajaxVar.list();
	});
});
</script>
<%@ include file="../include/footer.jsp"%>
</body>
</html>
