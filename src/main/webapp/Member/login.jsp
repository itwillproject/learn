<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2022-11-21
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>로그인</title>
<style>
	.tape {
		height: 100px;
		margin: 50px auto;
		padding-top: 15px;
		color: white;
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
</head>
<body>
	<%@ include file="../Common/header.jsp"%>
	<div class="container-fluid bg-dark">
	<div class="container tape">
		<section class="tapeContent">		
			<h2>로그인</h2>
		</section>
	</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-2">
				<%@ include file="sideNav.jspf"%>
			</div>
			<div class="col-10">
				<div style="width: 450px; margin: auto">
					<div class="text-center">
						<h5>로그인</h5>
						<span>인프런 계정으로 로그인 할 수 있어요.</span>
					</div>
					<form action="login.do" method="post" class="w-100 pl-4 pr-4 pt-4">
						<input type="email" class="form-control w-100 mb-3" id="userId"
							placeholder="이메일" name="userId"> <input type="password"
							class="form-control w-100 mb-4" id="userPwd" placeholder="비밀번호"
							name="userPwd">
						<button type="submit" class="btn w-100"
							style="background-color: #00C471; color: white">로그인</button>
					</form>
					<div class="text-center">
						<a>아이디(이메일) 찾기</a> | <a>비밀번호 찾기</a> | <a>회원가입</a>
					</div>
					<hr class="w-100">
					<div class="pb-1 text-center">간편 로그인</div>
					<div class="text-center">
						<img style="width: 40px; height: 40px; background-color: #fae500;"
							src="https://www.cellbiodx.com/Content/img/svg/kakaotalk.svg" />
						<a href="${google_url}"
							style="width: 40px; height: 40px; background-color: #f8f8f8;">
							<img
							style="margin: 10px; width: 20px; height: 20px; background-color: #f8f8f8;"
							src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/24px-Google_%22G%22_Logo.svg.png?20210618182606" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<%@ include file="../Common/footer.jsp"%>
	</footer>
</body>
</html>
