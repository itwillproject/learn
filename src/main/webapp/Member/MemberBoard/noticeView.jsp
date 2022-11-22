<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항 상세보기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <style>
	.tape {
		height: 100px;
		margin: 50px auto;
		padding-top: 15px;
		color: white;
	}
	.inner {
		width: 800px;
		display: inline-block;
		text-align: left;
	}
	.outer {
		text-align: center;
	}
	.date { text-align: right; }
	.container { 
		width: 800px;
		text-align: right; 
		display: inline-block;
	}
	.content {
		font-family: 'Gamja Flower', cursive;
	    font-size: 20px;
	    font-weight: 400;
	}
  </style>
</head>
<body>
<%@ include file="/Common/header.jsp" %>
<div class="container-fluid bg-dark">
	<div class="container tape">
		<section class="tapeContent">	
			<p style="font-size: 2em;">NEW</p>	
		</section>
	</div>
</div>
<br>

<div class="outer">
	<div class="inner">
		<h2>[업데이트 소식] 11월 1주차 - 학습 알림 기능 업데이트</h2>
	</div>
</div>
<hr>
<div class="outer">
	<div class="inner">
		<p class="date">2022-11-07</p><br>
		<span class="content">
			안녕하세요.<br>
			인프런 관리자입니다.<br>
			어느덧 가을이 지나가고 겨울이 오고 있네요..<br>
			좋은 소식이 있어 감사의 말씀을 드릭자 공지글을 드립니다.<br>
			인프런을 만들고 운영하는 인프랩이 'IT 전문 채용 서비스, 랠릿'을 오픈했습니다.<br>
			<br>
			많은 이용 바랍니다!
		</span>
	</div>
</div>
<br><br>
<div class="outer">
	<div class="container">
	  <button type="button" class="btn btn-success">목록으로</button>
	</div>
</div>
<br><br><br>
 <%@ include file="/Common/footer.jsp" %>
</body>
</html>
