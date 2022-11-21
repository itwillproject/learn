<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<h2>해드 네비</h2>
</head>
<body>
	<h1>사이드 네비</h1>
	<hr>
	<hr>
	<hr>
	<hr>

	<main id="main">
		<div class="text-center">
			<div class="mx-auto" style="width: 50%;">
				<div class="">
					<img alt="낙엽" src="myPageMark.png" width="200px">
					<br>
					<label> <span>이메일</span> <small>(※ 이메일 변경 후 재인증 필요)</small>
					</label>
					<div class="">
						<input id="email_change" type="email" class="w-75" name="userId"
							value="ELteg@itwill.com"> 
						<div class=""><br>
							<button id="mail-Check-Btn" class="btn btn-success w-25" type="button">수정하기</button>
							<div class="mail-check-box">
									<input class="w-75" placeholder="인증번호를 입력해주세요!" disabled="disabled" maxlength="6">
								</div>
								<div>
									<span id="mail-check-warn"></span>
								</div>
						</div>
					</div>
				</div>
				<from>
					<div class="">	
						<label class=""><span>비밀번호</span></label>
							<button class="btn" onclick="location.href='findPassword.jsp'">
							<small>비밀번호를 모르신다면?</small>
						</button>
					</div>

					<input id="password" name="password" type="password" class="w-75" placeholder="현재 비밀번호">
					<!-- 현재비밀번호와 ajax로 실시간체크하면안댐 -->
					<div class="" id="checkPwd"></div>
					<p><small> </small><p>
					<input id="user_pw" name="userPwd" type="password" class="w-75" placeholder="새 비밀번호">
					<div class="" id="pw_check"></div><p><small> </small><p>
					<input id="user_pw2" type="password" class="w-75"
						placeholder="새 비밀번호 확인">
					<div class="" id="pw2_check"></div><br>	
					<div class="">
						<button id="reg_submit" class="btn btn-success w-25" type="button">저장하기</button>
					</div>
				</from>

				<div class="label_wrap">
					<button class="btn btn-Success dropdown-toggle" type="button" 
					data-toggle="dropdown">탈퇴하기</button>

					<div class="dropdown-menu">

						<div class="">
							<h3>탈퇴 안내 사항</h3>
							<p>
								서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?<br> 그래도
								탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!
							</p>
							<p>🙇🏻‍♂️ 감사합니다 🙇🏻‍♀️</p>
							<br>
							<p>1. 계정 탈퇴 시, 인프런과 랠릿 서비스에서 모두 탈퇴됩니다.</p>
							<p>2. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.</p>
							<p>3. 직접 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동으로 삭제되지 않으며, 만일 삭제를 원하시면
								탈퇴 이전에 삭제가 필요합니다.</p>
							<p>4. 탈퇴 후 동일한 메일로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.</p>
							<p>5. 탈퇴 후 연동된 소셜 계정 정보도 사라지며 소셜 로그인으로 기존 계정 이용이 불가능합니다.</p>
							<p>6. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</p>
						</div>

						<input class="" type="password" placeholder="현재 비밀번호">
						<div class="">
							<button type="button">탈퇴하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<h2>본문 바디 끝</h2>
	<hr>
	<hr>
	<hr>
	<hr>
	<script>
		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/;
		// 비밀번호 정규식
		var pwJ = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{8,32}$/;
		// 이메일 검사 정규식
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
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
		// 이메일
		$('#user_email').blur(function() {
			if (mailJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#email_check").text('');
			} else {
				$('#email_check').text('이메일을 확인해주세요 :)');
				$('#email_check').css('color', 'red');
			}
		});
	</script>
	<script>
		var inval_Arr = new Array(2).fill(false);
		let go = document.forms[0];
		$('#reg_submit').click(
				function() {
					var userPwd2 = $('#password').val();
					var userId2 = $('#email_change').val();
					var typeVl = {userPwd: userPwd2, userId: userId2};
					$.ajax({
						url : "insertPwdCheck.do",
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
					// 이메일 정규식
					if (mailJ.test($('#user_email').val())) {
						console.log(phoneJ.test($('#user_email').val()));
						inval_Arr[2] = true;
					} else {
						inval_Arr[2] = false;
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