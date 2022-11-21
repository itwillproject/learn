<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 아이디(이메일) 찾기</title>
<meta name="description" content="계정에 등록된 휴대폰 번호를 인증하시면 사용중인 계정의 이메일 주소를 알려드립니다....">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	html, body {
		height: 100%;
	}
</style>   
</head>
<body>
<div class="container h-100 text-center">
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div class="mx-auto">
			<h3>아이디(이메일) 찾기</h3>
			<p>
				계정에 등록된 이름과 생년월일을 입력해 주시면 <br>
				사용중인 계정의 이메일 주소를 알려드립니다.
			</p>
			<div class="w-100 p-3 mx-auto">
				<form action="ajaxFineId" method="post" class="form-group">
					<input type="text" name="userName" class="form-control" placeholder="이름:"> 
					<input type="text" name="userBirth" class="form-control" placeholder="19990101">
					<input type="button" class="m-3 btn btn-outline-secondary" value="인증요청" onclick="">
				</form>
			</div>
		</div>
	</div>	
	
	<!-- 에이젝스 처리로 변경해 줘야 하는데 일단 기능구현 안 되어서 밑에 단락으로 표시 -->


	<!-- 정보가 정확할시 -->
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div class="mx-auto">
			<h3>아이디(이메일) 찾기</h3>
			<p>
				인증한 휴대폰 번호로 가입된 계정입니다.
			</p>
			<div class="w-100 p-3 mx-auto">
				<p class="text-left">
					아이디(이메일)${pageContext.request.contextPath }
				</p>
				<ul class="find-account nav">
				  <li class="text-left nav-item float-left">
				    <img src="${pageContext.request.contextPath }/resources/img/findAccountImg/inflean.png" alt="inflean" width="10%">
				    <img src="${pageContext.request.contextPath }/resources/img/findAccountImg/KakaoTalk_logo.png" alt="inflean" width="10%">
				  </li>
				</ul>
				<p class="float-clear"></p>
				<p class="text-left">
					abc***@gmail.com
				</p>
				<input type="button" class="btn-block btn btn-success px-5" value="로그인"
					onclick="location.href='loginModal.jsp';">
			</div>
		</div>
	</div>	

	<!-- 일치하는 정보가 없을시 -->
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div class="mx-auto">
			<h3>아이디(이메일) 찾기</h3>
			<p>
				인증한 휴대폰 번호로 가입된 계정입니다.
			</p>
			<div class="w-100 p-3 mx-auto">
				<p>
					해당 정보로 조회되는<br>
					사용자가 없습니다.
				</p>
				<p>
					<input type="button" class="btn-block btn btn-success my-2" value="확인"
						onclick="location.href='findId.jsp'">
						<!-- inflearn 확인 버튼 클릭시 아이디 찾기 화면으로 이동 -->
				</p>
			</div>
		</div>
	</div>	


</div>
</body>
</html>