<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="deleteAccount w-75 secession mx-auto">
			<div class="mx-auto">
				<label class="label p-3">
					<span class="h5 font-weight-bold">탈퇴</span>
				</label>
			</div>
			<div class="w-75 mx-auto p-3">
				<h5 class="font-weight-bold">탈퇴 안내 사항</h5>
				<p>
					서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?
					<br>
					그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!
				</p>
				<p>🙇🏻‍♂️ 감사합니다 🙇🏻‍♀️</p>
				<br>
				<p>1. 계정 탈퇴 시, 인프런과 랠릿 서비스에서 모두 탈퇴됩니다.</p>
				<p>2. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.</p>
				<p>3. 직접 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.</p>
				<p>4. 탈퇴 후 동일한 메일로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.</p>
				<p>5. 탈퇴 후 연동된 소셜 계정 정보도 사라지며 소셜 로그인으로 기존 계정 이용이 불가능합니다.</p>
				<p>6. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</p>
			</div>
			<div class="m-5">
				<input class="input form-control" type="password" placeholder="현재 비밀번호">
				<small class="invalid">입력시 처리될 부분</small>
			</div>
			<div class="mx-auto w-25 m-3">
				<button class="button btn-block btn btn-success" disabled>탈퇴하기</button>
			</div>
			<!--
				공란 아닐시 disabled 속성 지워주기
				<small class="invalid on_error text-danger mx-3">비밀번호를 입력해 주세요</small>
			-->
		</div>
		
		<!-- ajax 처리시 class secession active로 처리하기 -->
	</div>

</body>
</html>