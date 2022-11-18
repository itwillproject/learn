<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 비밀번호 재설정</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
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
			<h3 class="h3-bold">비밀번호 재설정</h3>
			<p>
				비밀번호를 잃어버리셨나요? <br>
				이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다.
			</p>
			<div class="w-50 p-3 mx-auto">
				<form action="ajaxSendPassword" method="post" class="form-group">
					<input type="text" name="userId" class="form-control my-2" placeholder="example@gmail.com"> 
					<input type="button" class="btn-block btn btn-success my-2" value="인증번호 전송" onclick="go_verify(this.form)">
					<!-- location.href='이동할 페이지' return false; -->
				</form>
			</div>
		</div>
	</div>
	
	
	<!-- 에이젝스 처리로 변경해 줘야 하는데 일단 기능구현 안 되어서 밑에 단락으로 표시 -->
	
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div class="mx-auto">
			<h3 class="h3-bold">비밀번호 설정 메일 발송</h3>
			<p>
				위 주소로  <br>
				이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다.  <br>
				(몇 분 내로 확인되지 않으면 스팸 폴더를 확인해 주세요)
			</p>
			
			<div class="w-50 p-3 border border-primary mx-auto">
			<form>
				<input type="text" name="verifyNo" class="form-control w-50 d-inline" placeholder="인증번호: "> 
				<input type="button" class="m-3 btn btn-outline-secondary" value="인증요청" onclick="go_verify(this.form)">		
			</form>
		</div>
	</div>

	<!-- 인증번호 비일치시 ajax로 처리될 화면 -->
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div class="mx-auto">
			<h3 class="h3-bold">비밀번호 설정 메일 발송</h3>
			<p>
				위 주소로  <br>
				이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다.  <br>
				(몇 분 내로 확인되지 않으면 스팸 폴더를 확인해 주세요)
			</p>
			
			<div class="w-50 p-3 border border-primary mx-auto">
				<form>
					<input type="text" name="verifyNo" class="form-control w-50 d-inline" placeholder="인증번호: "> 
					<input type="button" class="m-3 btn btn-outline-secondary" value="인증요청" onclick="go_verify(this.form)">		
				</form>
			</div>
		</div>
	</div>
	
	
		<h3>인증번호 비일치시 ajax 처리될 화면</h3>
		<div class="w-50 p-3 border border-primary mx-auto">
		<form class="border">
			<input type="text" name="verifyNo" class="form-control w-50 d-inline" placeholder="인증번호: " value="frm.verifyNo.value"> 
			<input type="button" class="m-3 btn btn-outline-secondary" value="인증요청" onclick="go_verify(this.form)">		
			<div class="border  float-left">
				<span class="float-left form-item--error text-danger text-left">
					인증번호가 일치하지 않습니다.
				</span>
			</div>
			<p class="float-clear">
		</form>
		</div>
		
		<!-- 인증번호 일치시 paging으로 비밀번호 재설정 페이지로 이동 -->
		
		
	</div>





</div>	
</body>
</html>