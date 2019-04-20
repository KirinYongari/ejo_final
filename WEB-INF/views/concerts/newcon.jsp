<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>오픈예정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <style type="text/css">
      .open_news_table td {
          vertical-align: middle !important;
      }
      .list_sorting_menu {padding-top:8px}
      .list_sorting_menu li {display:inline-block;}
      .list_sorting_menu li a{display:block;padding:0 17px 0 20px;background: no-repeat left 6px; font-size:16px;;color:#333;}
      .list_sorting_menu li a:hover{color:#00b523}
      .list_sorting_menu li.first a {background:none;}
      .list_sorting_menu li.on a{color:#00b523;font-weight:bold}
      .list_sorting_menu li.last a{padding-right:0}
      .badge {
          background-color: #00b523;
      }
      .open_news_img {
          border-radius: 10px;
          max-width: 100%;
		  max-height: 100px;
      }
      .hot_open_img {
          padding: 20px;
          margin-left: 31px;
      }
      .hot_open_img img {
          width: 100%;
          border-radius: 10px;
          margin-bottom: 15px;
      }
      h4 {
          color: #00b523;
      }
      .btn-success {
          background-color: #00b523;
      }
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <hr/>
    <div class="panel panel-default row">
        <div class="panel-body">
            <h4>HOT 공연 오픈 소식</h4>
            <div class="hot_open_img col-xs-2">
                <img src="iutitle.jpg">
                <p>공연명</p>
                <p><strong>[오픈]</strong> xx.xx.xx(x)</p>
            </div>
            <div class="hot_open_img col-xs-2">
                <img src="iutitle.jpg">
                <p>공연명</p>
                <p><strong>[오픈]</strong> xx.xx.xx(x)</p>
            </div>
            <div class="hot_open_img col-xs-2">
                <img src="iutitle.jpg">
                <p>공연명</p>
                <p><strong>[오픈]</strong> xx.xx.xx(x)</p>
            </div>
            <div class="hot_open_img col-xs-2">
                <img src="iutitle.jpg">
                <p>공연명</p>
                <p><strong>[오픈]</strong> xx.xx.xx(x)</p>
            </div>
            <div class="hot_open_img col-xs-2">
                <img src="iutitle.jpg">
                <p>공연명</p>
                <p><strong>[오픈]</strong> xx.xx.xx(x)</p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-2">
            <select class="form-control">
                <option>전체</option>
                <option>콘서트</option>
                <option>아트&시어터</option>
            </select>
        </div>
        <div class="col-xs-3">
            <input class="form-control" type="text" value=""/>
        </div>
        <button class="btn btn-success btn-md">검색</button>
        <div class="box_sorting_menu pull-right">
            <ul class="list_sorting_menu">
				<li class="first on"><a href="javascript:goSearch('0');">등록순</a></li>
				<li class=""><a href="javascript:goSearch('1');">조회순</a></li>
				<li class=""><a href="javascript:goSearch('2');">오픈일순</a></li>
            </ul>
		</div>
    </div>
    <br/>
    <div>
        <table class="table open_news_table">
        <colgroup>
            <col width="30%" />
            <col width="*" />
            <col width="10%" />
        </colgroup>
            <tr>
                <td>
                    <strong>티켓오픈일</strong> <span class="badge">N</span><br/>
                    <span id="create_date">20xx.xx.xx(x) xx:xx</span>
                </td>
                <td>
                    <strong>공연명</strong><br/>
                    등록일 <span>20xx.xx.xx</span>
                     조회 <span id="view_count">xx</span>
                </td>
                <td>
                    <img class="open_news_img" src="iutitle.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>티켓오픈일</strong><br/>
                    <span id="create_date">20xx.xx.xx(x) xx:xx</span>
                </td>
                <td>
                    <strong>공연명</strong><br/>
                    등록일 <span>20xx.xx.xx</span>
                     조회 <span id="view_count">xx</span>
                </td>
                <td>
                    <img class="open_news_img" src="iutitle.jpg" />
                </td>
            </tr>
            <tr>
                <td>
                    <strong>티켓오픈일</strong><br/>
                    <span id="create_date">20xx.xx.xx(x) xx:xx</span>
                </td>
                <td>
                    <strong>공연명</strong><br/>
                    등록일 <span>20xx.xx.xx</span>
                     조회 <span id="view_count">xx</span>
                </td>
                <td>
                    <img class="open_news_img" src="iutitle.jpg" />
                </td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">

</script>
</body>
</html>