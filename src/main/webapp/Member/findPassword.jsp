<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 비밀번호 재설정</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	html, body {
		height: 100%;
	}
</style>

<script>

	function go_verify(frm) {
		var findId = {};
		findId.userId = frm.userId.value;
		
		$.ajax("/user/findPassword.do", {
	        type : "post",
	        data : JSON.stringify(findId),
	        contentType : "application/json",
	        dataType: "json",
	        success : function(data){
	            alert("성공");
	            console.log(data);
	            
	            let dispHtml = "";
	            
	            if (data.length == 0) {
	            	
	    			$("input[name=userId]").addClass("is-invalid");
	    			$("#caption").addClass("onError text-danger");
	    			$("#caption").text("메일 주소를 다시 확인해 주세요.");
	    			
	            } else {
	            	// 전달받은 아이디로 유저 유무 확인 후 메일 전송 후에 넘어 오는 폼
	            	dispHtml += '';
	            	dispHtml += '<p>';
	            	dispHtml += '위 주소로 인증 메일이 발송되었습니다. <br>';
	            	dispHtml += '이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다. <br>';
	            	dispHtml += '(몇 분 내로 확인되지 않으면 스팸 폴더를 확인해 주세요)';
	            	dispHtml += '</p>';
	            	dispHtml += '<div class="w-75 p-3 border border-primary mx-auto">';
	            	dispHtml += '<form>';
	            	dispHtml += '<input type="text" name="verifyNo" class="form-control w-50 d-inline" placeholder="인증번호: ">';
	            	dispHtml += '<input type="button" class="m-3 btn btn-outline-secondary" value="인증요청" onclick="check_verify(this.form)">';
	            	dispHtml += '<br>';
	            	dispHtml += '<small class="timer text-danger"></small>';
	            	dispHtml += '<br>';
	            	dispHtml += '<small class="invalid"></small>';
	            	dispHtml += '</form>';
	            	dispHtml += '</div>';	
	            	
	            }
	            	
	            $("#findForm").html(dispHtml);

	        },
	        error: function(){
	            alert("실패");
	        }
	   })
	}
	
	function check_verify(frm) {
		//메일 전송 후 해당 인증 번호도 전달받아 체크
		var verifyNo = frm.verifyNo.value;
		$.ajax("findUserId.do", {
	        type : "post",
	        data : JSON.stringify(findId),
	        contentType : "application/json",
	        dataType: "json",
	        success : function(data){
	            alert("성공");
	            console.log(data);
	            
	            let dispHtml = "";
	            
	            if (data.length == 0) {
	    			
	            } else {
	            	// 전달받은 아이디로 유저 유무 확인 후 메일 전송 후에 넘어 오는 폼
	            }
	            	
	            $("#findForm").html(dispHtml);

	        },
	        error: function(){
	            alert("실패");
	        }
	   })
	}

</script>

</head>
<body>
<div class="container h-100 text-center">

	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div id="findForm" class="mx-auto">
			<h3 class="h3-bold">비밀번호 재설정</h3>
			<p>
				비밀번호를 잃어버리셨나요? <br>
				이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다.
			</p>
			<div class="w-75 p-3 mx-auto">
				<form action="ajaxSendPassword" method="post" class="form-group">
					<input type="text" name="userId" class="form-control my-2" placeholder="example@gmail.com"> 
					<input type="button" class="btn-block btn btn-success my-2" value="인증번호 전송" onclick="go_verify(this.form)">
					<small id="caption" class="invalid"></small>
				</form>
			</div>
		</div>
	</div>
	
	


	<!-- 인증번호 비일치시 ajax로 처리될 화면 -->

	<h3 class="h3-bold">비밀번호 설정 메일 발송</h3>
	<p>
		위 주소로 인증 메일이 발송되었습니다. <br>
		이메일 인증을 통해 비밀번호 변경 화면으로 이동 가능합니다.  <br>
		(몇 분 내로 확인되지 않으면 스팸 폴더를 확인해 주세요)
	</p>
	<div class="w-75 p-3 border border-primary mx-auto">
		<div>
		<form>
			<input type="text" name="verifyNo" class="form-control w-50 d-inline" value="frm.verifyNo.value" placeholder="인증번호: "> 
			<input type="button" class="btn btn-outline-secondary" value="인증요청" onclick="go_verify(this.form)">		
		</form>
		
		<p class="text-left">
			<small class="invalid text-danger mx-3">비밀번호가 일치하지 않습니다</small>
		</p>
	</div>


		
	<!-- 인증번호 일치시 paging으로 비밀번호 재설정 페이지로 이동 -->
		




</div>	

</body>
</html>