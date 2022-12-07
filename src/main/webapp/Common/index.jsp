<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Common/css/slide.css" />
<style>
	.outer {
		text-align: center;
	}
	.inner {
		margin-left: 120px;
		margin-top: 120px;
		width: 600px;
	}
	.inner2 {
		display: inline-block;
		text-align: center;
	}
	.search {
		height: 50px;
		width: 500px;
/*  	border: 1px solid #00C471; */
 		background: #E3F8EF;
	}
	.searchInput {
		margin-top: 13px;
 		font-size: 15px; 
 		width: 325px; 
		border: 0px;
 		outline: none; 
		float: left;
		background: #E3F8EF;
	}
	.searchButton {
		width: 50px;
		height: 100%;
		border: 0px;
		background: #E3F8EF;
		outline: none;
		float: right;
		color: gray;
	}
	.searchButton img {
		width: 70%;
	}

</style>
</head>
<%@include file ="/Common/header.jsp" %>
<br><br>
<a href="getLecture.do?lectureNo=10">오프라인</a><br>
<a href="getLecture.do?lectureNo=3">온라인</a>

<%-- 배너부분 --%>
<div class="slide slide_wrap">
	<div class="slide_item item1">
		<div class="inner" style="color: white;">
			<h2>무슨 강의 들을지 고민이라면?<br>현직자 Top50 강의 보기👑</h2><br>
			<p>입문부터 실전까지,<br>믿고 보는 실무자 Pick!</p>
		</div>
	</div>
	<div class="slide_item item2">
		<div class="inner" style="color: white;">
			<h2>누구나 쉬운 입문 강의<br>여기 다 모였다!🐣</h2><br>
			<p>어디서부터 시작해야 할지 모르는<br> 당신을 위한 입문 강의</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/4.webp">
	</div>
	<div class="slide_item item3">
		<div class="inner" style="color: white;">
			<h2>바쁘다 바빠 현대사회!<br>딱 3시간만 투자하세요⏰</h2><br>
			<p>부담은 적게 성장은 빠르게!<br>오늘부터 나도 프로 완강러</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/3.webp">
	</div>
	<div class="slide_item item4">
		<div class="inner">
			<h2>IT 왕초보부터 실무까지<br>아웃풋런 로드맵📖</h2><br>
			<p>코딩, 디자인, 게임, 마케팅.. 모든 IT 실무지식!<br>
			프로로 가는 최고의 길잡이가 되어드릴게요🔥</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/2.gif">
	</div>
	<div class="slide_item item5">
		<div class="inner" style="color: white;">
			<br><h2>나만 몰랐었던 이 강의~♬</h2><br>
			<p>매일 업데이트 되는<br> 인프런 신규강의를 만나보세요!</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/5.gif">
	</div>
	<div class="slide_item item6">
		<div class="inner" style="color: white;">
			<h2>강의 고르기 어려울 땐<br>램프 요정아 도와줘!✨</h2><br>
			<p>클릭 5번으로 찾아보는 맞춤 입문 강의</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/6.png">
	</div>
	<div class="slide_item item7">
		<div class="inner">
			<h2>지금 할인 중인 강의💰</h2><br>
			<p>신규 강의부터 베스트셀러까지<br>지금 바로 부담없이 시작해보세요!</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/7.gif">
	</div>
	<div class="slide_item item8">
		<div class="inner" style="color: white;">
			<h2>나누는 지식만큼<br> 커지는 보람과 보상</h2><br>
			<p>인프런 지식공유자로<br>높은 수익과 가치를 만들어보세요.</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/8.gif">
	</div>
	<div class="slide_item item9">
		<div class="inner" style="color: white;">
			<h2>우리는 성장기회의<br>평등을 추구합니다.</h2><br>
			<p>누구나 배움의 기회를 누리고 꿈을 이룰 수 있도록!<br>인프런과 함께 배우고, 나누고, 성장하세요.</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/9.png">
	</div>
	<div class="slide_item item10">
		<div class="inner" style="color: white;">
			<h2>함께 성장할<br>동료를 찾아요🌿</h2><br>
			<p>#우리 #함께성장해요<br>#동료여어디계신가요?</p>
		</div>
		<img src="${pageContext.request.contextPath}/picture/images/10.gif">
	</div>
	<div class="slide_prev_button slide_button">◀</div>
	<div class="slide_next_button slide_button">▶</div>
	<ul class="slide_pagination"></ul>
	</div>
<script src="${pageContext.request.contextPath}/Common/js/slide.js"></script>
<br><br>

<%-- 검색기능 --%>
<div class="outer">
	<div class="inner2">
		<p style="font-size: 25px;">성장기회의 평등을 추구합니다.</p>
		<div class="search">
			<input class="searchInput" type="text" placeholder="  배우고 싶은 지식을 입력해보세요.">
			<button class="searchButton"><img src="${pageContext.request.contextPath}/picture/images/search.png"> </button>
		</div>
	</div>
</div>

<%@include file ="/Common/footer.jsp"%>
</html>