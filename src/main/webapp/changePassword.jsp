<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 페이지</title>
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
				<form action="changePassword" method="post" class="form-group">
					<table>
						<thead>
							<tr>
								<td colspan="2" class="text-left">
									변경할 비밀번호로 정확히 입력해 주세요.
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="text-left m">비밀번호</th>
								<td>
									<input type="text" name="userId" class="form-control my-2"> 
								</td>
							</tr>
							<tr>
								<th class="text-left">비밀번호 확인</th>
								<td>
									<input type="text" name="userId" class="form-control my-2">  
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" class="btn-block btn btn-success my-2" value="비밀번호 변경" onclick="change_password(this.form)">
									<!-- location.href='이동할 페이지' return false; -->
									<!-- location.href='이동할 페이지' 인프런에서는 로그인 페이지인 듯 -->
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>

	</div>

</body>
</html>