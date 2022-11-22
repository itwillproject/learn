<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<h2>해드 네비</h2>
</head>
<body>
	<h1>사이드 네비</h1>
	<hr><a href="getResume.do?userId=hh">지식 공유 현황보기</a>
	<hr>
	<hr>
	<hr>

	<main id="main">
		<div class="text-center">
			<div class="mx-auto" style="width: 50%;">
				<form action="modifyUser.do" method="post">
					<div class="">
						<img alt="낙엽" src="${pageContext.request.contextPath }/picture/myPageMark.png" width="200px">
						<br>
						<label> <span>이메일</span>
						</label>
						<div class="">
							<input id="email_ch" type="email" class="w-75" name="userId"
								value="${user.userId }" readonly="readonly"> 
						</div>
						<label> <span>이름</span>
						</label>
						<div class="">
							<input id="name_ch" type="text" class="w-75" name="userName"
								value="${user.userName }" readonly="readonly"> 
						</div>
					</div>
					<div class="">	
						<label class=""><span>비밀번호</span></label>
							<button class="btn" onclick="location.href='findPassword.jsp'">
							<small>비밀번호를 모르신다면?</small>
						</button>
					</div>

					<input id="password" name="password" type="password" class="w-75" placeholder="현재 비밀번호">
					
					<div class="" id="checkPwd"></div>
					<p><small> </small><p>
					<input id="user_pw" name="userPwd" type="password" class="w-75" placeholder="새 비밀번호">
					<div class="" id="pw_check"></div>
					<p><small> </small><p>
					<input id="user_pw2" type="password" class="w-75"
						placeholder="새 비밀번호 확인">
					<div class="" id="pw2_check"></div><br>	
					<div class="">
						<button id="reg_submit" class="btn btn-success w-25" type="button">저장하기</button>
					</div>
				</form>
			</div>
		</div>
	</main>


	<h2>본문 바디 끝</h2>
	<hr>
	<hr>
	<hr>
	<hr>
	<script>
		// 비밀번호 정규식
		var pwJ = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,32}$/;
		// 비밀번호 체크 확인
		$('#user_pw').keyup(function() {
							if (pwJ.test($('#user_pw').val())) {
								console.log('true');
								$('#pw_check').text('비밀번호 통과');
								$('#pw_check').css('color', 'blue');
							} else {
								console.log('false');
								$('#pw_check').text('영문/숫자/특수문자 2가지 이상 포함+8자 이상 32자 이하 입력 (공백 제외)');
								$('#pw_check').css('color', 'red');
							}
						});
		$('#user_pw2').keyup(function() {
			if ($('#user_pw').val() != $(this).val()) {
				console.log('false');
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
			} else {
				console.log('true');
				$('#pw2_check').text('비밀번호 통과');
				$('#pw2_check').css('color', 'blue');
			}
		});

	</script>
	<script>
		var inval_Arr = new Array(2).fill(false);
		let go = document.forms[0];
		$('#reg_submit').click(
				function() {
					var userPwd2 = $('#password').val();
					var userId2 = $('#email_ch').val();
					var typeVl = {userPwd: userPwd2, userId: userId2};
					$.ajax({
						url : "pwdCheck.do",
						data : typeVl,
						type : "post",
						
						success : function(data){
							console.log("1 = 일치o / 0 = 불일치x : "+ data);
							if (data == 1) {
								inval_Arr[1] = true;
							} else {
								inval_Arr[1] = false;
									$('#checkPwd').text('현재 비밀번호가 틀렸습니다');
									$('#checkPwd').css('color', 'red');	
							}
						}, error : function () {
									console.log("실패");
						}
					});
					// 비밀번호가 같은 경우 && 비밀번호 정규식
					if (($('#user_pw').val() == ($('#user_pw2').val()))
							&& pwJ.test($('#user_pw').val())) {
						inval_Arr[0] = true;
					} else {
						inval_Arr[0] = false;
					}
					for (var i = 0; i < inval_Arr.length; i++) {
						if (inval_Arr[i] == false) {
							alert('입력한 정보들을 다시 한번 확인해주세요 :)');
							return false;
						} else if (inval_Arr[i] == true) {
							go.submit();
							return true;
						}
					}
				});
	</script>
	<footer>
		<h2>푸터 네비</h2>
	</footer>
</body>
</html>