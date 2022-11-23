<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 강의 목록</title>
<style>
.tape {
	color: white;
	height: 50px;
}

.gray-line{
	border-bottom: solid 1px #dddddd;
}



</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>

</script>
</head>
<body>

	<!-- 채팅창 -->
	<div class="d-flex flex-row fixed-bottom">
		<p>채팅창 입니다</p>
	</div>

	<!-- 헤더 올리기 -->
	<%@ include file="../Common/header.jsp"%>
	
	<!-- 띠지 테이프 -->
	<div class="container-fluid bg-dark mt-5">
		<div class="row w-100 tape">		
		
			<div class="col-4 d-flex flex-row  align-content-center justify-content-center w-100">
				<h2 class="mx-auto my-auto w-100" style="text-align: center;">내 학습</h2>
			</div>
									
			<div class="col-6 pl-3">
			</div>
		</div>
	</div>
	
	<!-- 아래 내용 부분 -->
	<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">

		<div class="row w-100 pb-4 justify-content-center">
		
			<!-- 왼쪽 사이드 네비 -->
			<div class="col-2 d-flex justify-content-center">
				<%@ include file="sideNav.jspf"%>
			</div>
			
			<!-- 가운데 내용 -->
			<div class="col-6 pl-3">
			
			
				<!-- 가운데 내비 / 보유한강의 / 내강의폴더 / 로드맵 / 수강확인증 / 수료증 -->
				<div class="row w-100">
				
					<div class="gray-line row w-100 pb-3">
						<ul class="nav">
						  <li class="nav-item">
						    <a class="nav-link" href="#">보유한강의</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">로드맵</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">수강확인증</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="#">수료증</a>
						  </li>						  
						</ul>
					</div>
					
					<div class="row w-100 my-3 pb-3">
					
						<div class="col d-flex">
							<div class="mr-4">
							<select onchange="">
								<option selected="selected">최근공부</option>
								<option>최근 수강신청</option>
								<option>제목순</option>
							</select>
							</div>
							
							<div>
							<select onchange="">
								<option selected="selected">모두보기</option>
								<option>학습중</option>
								<option>완강</option>
							</select>
							</div>
													
						</div>
						
						<div class="col">
							<form class="w-100 d-flex">
								<input type="text" class="w-75" name="searchKeyword" placeholder="강의명 또는 지식공유자 이름으로 검색">
								<input type="button" class="ml-auto" value="검색">
							</form>
						</div>
					</div>
					
				</div>
				
				
				
				<div class="row w-100 mt-3">
					<!-- 여기서 포이치문으로 줄 만들고 -->
					<!-- 줄 만든 후에 제이쿼리 온로드로 하나씩 넣기 어떰? 첫번째 놈에 첫번째 넣고, 이런식으로 -->
					<div class="row w-100">
						<div class="col border">
							<div class="row"><img width="100%" src="https://cdn.inflearn.com/public/courses/325630/cover/56f635a3-3a44-4096-a16b-453ea1696b1a/325630-eng.png"></div>
							<div class="row d-flex">
								<span class="pl-2">제목</span>
								<span class="ml-auto" style="width: 100px">플레이버튼</span>
							</div>
						</div>
						<div class="col border">
							<div class="row"><img width="100%" src="https://cdn.inflearn.com/public/courses/325630/cover/56f635a3-3a44-4096-a16b-453ea1696b1a/325630-eng.png"></div>
							<div class="row d-flex">
								<span class="pl-2">제목</span>
								<span class="ml-auto" style="width: 100px">플레이버튼</span>
							</div>
						</div>
						<div class="col border">
							<div class="row"><img width="100%" src="https://cdn.inflearn.com/public/courses/325630/cover/56f635a3-3a44-4096-a16b-453ea1696b1a/325630-eng.png"></div>
							<div class="row d-flex">
								<span class="pl-2">제목</span>
								<span class="ml-auto" style="width: 100px">플레이버튼</span>
							</div>
						</div>
					</div>
					
				</div>
				

		<footer>
			<%@ include file="../Common/footer.jsp"%>
		</footer>
</body>
</html>