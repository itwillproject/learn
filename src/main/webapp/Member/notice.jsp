<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
	.tape {
		height: 100px;
		margin: 50px auto;
		padding-top: 15px;
		color: white;
	}
	.table #N { color: lime;}  
	.table #fontSize { font-size: 0.7em }
  	.inner {
		width: 630px;
		display: inline-block;
		text-align: left;
	}
	.outer {
		text-align: center;
	}
	.menuborder {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
 	    border-bottom: 1px solid #e7e7e7; 
	}
	.menu {
	    float: left;
	}
	.menu a {
	    display: block;
		color: black;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	
	/* 페이징처리 css */
	.page_wrap {
		text-align:center;
		font-size:0;
	 }
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation a.active {
		background-color:green;
		color:white;
		border:1px solid green;
	}
  </style>
</head>
<body>
    <%@ include file="/Common/header.jsp" %>
    <div class="container-fluid bg-dark">
		<div class="container tape">
			<section class="tapeContent">		
				<h2>새로운 소식들!</h2>
				<p>신규 컨텐츠, 이벤트, 기능 추가 등의 새로운 인프런의 이야기를 들어주세요.</p>
			</section>
		</div>
	</div>
    <br>
	<div class="container">      
	  <table class="table">
	    <tbody>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]11월 1주차 - 학습 알림 기능 업데이트
				<br>
				<span id="fontSize">2022-11-17 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]10월 4주차 - 주간 학습 현황 카드 업데이트
				<br>
				<span id="fontSize">2022-10-28 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]10월 3주차 - 강의실 커뮤니티 질문 업데이트
				<br>
				<span id="fontSize">2022-10-21 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]10월 2주차 - 강의실 커뮤니티 질문 업데이트
				<br>
				<span id="fontSize">2022-10-21 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]10월 1주차 - 강의실 커뮤니티 질문 업데이트
				<br>
				<span id="fontSize">2022-10-21 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]9월 4주차 - 강의실 커뮤니티 질문 업데이트
				<br>
				<span id="fontSize">2022-10-21 관리자</span></td>
	      </tr>
	      <tr>
	        <td><span id="N">N.</span> [업데이트소식]9월 3주차 - 강의실 커뮤니티 질문 업데이트
				<br>
				<span id="fontSize">2022-10-21 관리자</span></td>
	      </tr>
	    </tbody>
	  </table>
	</div>
	<div class="page_wrap">
	   <div class="page_nation">
	      <a class="arrow prev" href="#">&lt</a>
	      <a href="#" class="active">1</a>
	      <a href="#">2</a>
	      <a href="#">3</a>
	      <a href="#">4</a>
	      <a href="#">5</a>
	      <a href="#">6</a>
	      <a href="#">7</a>
	      <a href="#">8</a>
	      <a href="#">9</a>
	      <a href="#">10</a>
	      <a class="arrow next" href="#">&gt</a>
	   </div>
	</div>
	<br><br><br>
	 <%@ include file="/Common/footer.jsp" %>
</body>
</html>
