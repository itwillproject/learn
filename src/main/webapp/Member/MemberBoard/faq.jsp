<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>자주묻는질문 FAQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  <style>
  	.inner {
		width: 640px;
		display: inline-block;
		text-align: left;
	}
	.inner2 {
		width: 700px;
		display: inline-block;
		text-align: left;
		font-size: 1.3em;
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
	.menu a:hover:not(.active) {
		text-decoration: none;
		color: black;
	}
	.menu a.active {
	    color: white;
	    background-color: #4CAF50;
	}
	a:hover {
		text-decoration: none;
	}
	.main { 
		text-align: center; 
		font-size: 1.3em;
	}
	.answer {
	    display: none;
	    padding-bottom: 30px;
	}
	.faq-content {
	    border-bottom: 1px solid #e0e0e0;
	}
	.question {
	    padding: 30px 0;
	    cursor: pointer;
	    border: none;
	    outline: none;
	    background: none;
	    width: 100%;
	    text-align: left;
	}
	.question:hover {
	    color: green;
	}
	[id$="-toggle"] {
	    margin-right: 10px;
	}
	.answer, .question {
		font-family: 'Gamja Flower', cursive;
	    font-size: 20px;
	    font-weight: 400;
	}
	
  </style>
</head>
<body>
	<%@ include file="/Common/header.jsp" %>
	<br><br>
	
	<div class="outer">
		<div class="inner">
			<ul class="menuborder">
			  <li class="menu"><a class="active" href="#">자주 묻는 질문</a></li>
			  <li class="menu"><a href="#">통합서비스 이용약관</a></li>
			  <li class="menu"><a href="#">인프런 이용약관</a></li>
			  <li class="menu"><a href="#">개인정보 취급방침</a></li>
			</ul>
		</div>
	</div>
	<br><br>
	<p class="main">궁금한 점이 있으신가요?<br>먼저 아래의 자주 묻는 질문 FAQ 리스트를 확인 해주세요!</p>
	<br>
	
<div class="outer">
	<div class="inner2">
	
		<div class="faq-content">
		  <button class="question" id="que-1"><span id="que-1-toggle">+</span><span>질문1</span></button>
		  <div class="answer" id="ans-1">답변1</div>
		</div>
		<div class="faq-content">
		  <button class="question" id="que-2"><span id="que-2-toggle">+</span><span>질문2</span></button>
		  <div class="answer" id="ans-2">답변2</div>
		</div>
		<div class="faq-content">
		  <button class="question" id="que-3"><span id="que-3-toggle">+</span><span>질문3</span></button>
		  <div class="answer" id="ans-3">답변3</div>
		</div>
		<div class="faq-content">
		  <button class="question" id="que-4"><span id="que-4-toggle">+</span><span>질문4</span></button>
		  <div class="answer" id="ans-4">답변4</div>
		</div>
		<div class="faq-content">
		  <button class="question" id="que-5"><span id="que-5-toggle">+</span><span>질문5</span></button>
		  <div class="answer" id="ans-5">답변5</div>
		</div>
	</div>
</div>
<br><br><br>
<%@ include file="/Common/footer.jsp" %>
</body>
<script>
	const items = document.querySelectorAll('.question');
	
	function openCloseAnswer() {
	  const answerId = this.id.replace('que', 'ans');
	
	  if(document.getElementById(answerId).style.display === 'block') {
	    document.getElementById(answerId).style.display = 'none';
	    document.getElementById(this.id + '-toggle').textContent = '+';
	  } else {
	    document.getElementById(answerId).style.display = 'block';
	    document.getElementById(this.id + '-toggle').textContent = '-';
	  }
	}
	items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
</html>