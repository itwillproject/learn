<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(function(){
	var time = 60*3; // 기준 시간 3 분
	var min = ""; //분
	var sec = "";
	
	var x = setInterval(function(){
		min = parseInt(time/60);
		sec = time%60;
		
		$(".timer").text(min + "분" + sec + "초");
		time--;
		
		if (time < 0) {
			clearInterval(x);
			$("input[name=verifyNo]").attr("disabled", true);
			$(".timer").text("인증 시간이 만료되었습니다. 다시 인증 요청을 진행해 주세요.");
			$("input[name=text]").attr("disabled", true);
			$(".timer").text("인증 시간이 만료되었습니다. 다시 이메일 입력부터 진행해 주세요.");
		}
		
	}, 1000);
		
	
});
</script>
</head>
<body>
	<h3>아웃런 비밀번호 재설정 인증 번호입니다</h3>
	<p>인증번호 []를 화면에 입력 후<br>
	비밀번호 변경 페이지로 이동합니다.<br>
	해당 인증번호는 전송 후 3 분 간 유효합니다.</p>
	
	<form action="${pageContext.request.contextPath }/user/findPassword.do">
		<input type="text" name="text">
		<input type="submit" value="submit">
		<br>
		<small class="timer text-danger"></small>
	</form>

</body>
</html>