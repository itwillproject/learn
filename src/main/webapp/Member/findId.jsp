<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 아이디(이메일) 찾기</title>
<meta name="description" content="계정에 등록된 휴대폰 번호를 인증하시면 사용중인 계정의 이메일 주소를 알려드립니다....">
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
	function findId(frm) {
		
		// 아이디 조회 후 출력  (일치, 비일치 모두)
		
	    let findId = {};
	    findId.userName = frm.userName.value;
	    findId.userBirth = frm.userBirth.value;		
	  
	    console.log(JSON.stringify(findId));
		
	    $.ajax("${pageContext.request.contextPath }/member/findUserIdList.do", {
	        type : "post",
	        data : JSON.stringify(findId),
	        contentType : "application/json",
	        dataType: "json",
	        success : function(data){
	            alert("성공");
	            console.log(data);
	            
	            let dispHtml = "";
	            
	            if (data.length == 0) {
	            	alert("${pageContext.request.contextPath }/Member/login.jsp");
	            	dispHtml += '<h3>아이디(이메일) 찾기</h3>';
	            	dispHtml += '<p>인증한 휴대폰 번호로 가입된 계정입니다.</p>';
	            	dispHtml += '<div class="w-100 p-3 mx-auto">';
	            	dispHtml += '<p>해당 정보로 조회되는<br>사용자가 없습니다.</p>';
	            	dispHtml += '<input type="button" class="btn-block btn btn-success my-2" value="아이디 찾기"';
	            	dispHtml += 'onclick="location.href=\'${pageContext.request.contextPath }/Member/findId.jsp\';">';
    							//inflearn 확인 버튼 클릭시 아이디 찾기 화면으로 이동
	            	dispHtml += '</div>';
	            } else {
		           	dispHtml += '<h3>아이디(이메일) 찾기</h3>';
		           	dispHtml += '<p>인증한 휴대폰 번호로 가입된 계정입니다.</p>';
		           	dispHtml += '<div class="w-100 p-3 mx-auto">';
		           	dispHtml += '<p class="text-left">아이디(이메일)</p>';
	            	dispHtml += '<p class="float-clear"></p>';
		            $.each(data, function(index, obj){	
			           	dispHtml += '<p class="text-left">';
			           	dispHtml += '<img src="${pageContext.request.contextPath }/picture/findAccount/inflean.png" alt="inflean" width="20px">';
			           	dispHtml += '<img src="${pageContext.request.contextPath }/picture/findAccount/KakaoTalk_logo.png" alt="inflean" width="20px"></p>';
			           	dispHtml += '</p>';
		            	dispHtml += '<p class="text-left">'+obj+'</p>';
		            })	            	
	            	dispHtml += '<input type="button" class="btn-block btn btn-success px-5" value="로그인"';
	            	dispHtml += 'onclick="location.href=\'${pageContext.request.contextPath }/Member/login.jsp\';">';
	            	
	            	//인프런에서는 모달창 아닌 로그인 페이지로 이동 일단.. 메인 페이지로 이동
		           	dispHtml += '</div>';
	            }
	
	            $("#findSearch").html(dispHtml);

	        },
	        error: function(){
	            alert("실패");
	        }
	   });
			

	}
</script>   
</head>
<body>
<div class="container h-100 text-center">
	<div class="d-flex align-items-center mx-auto text-center h-100">
		<div id="findSearch" class="mx-auto">
			<h3>아이디(이메일) 찾기</h3>
			<p>
				계정에 등록된 이름과 생년월일을 입력해 주시면 <br>
				사용중인 계정의 이메일 주소를 알려드립니다.
			</p>
			<div class="w-100 p-3 mx-auto">
				<form action="ajaxFineId" method="post" class="form-group">
					<input type="text" name="userName" class="form-control" placeholder="이름:"> 
					<input type="text" name="userBirth" class="form-control" placeholder="생년월일 ex.19990101">
					<input type="button" class="m-3 btn btn-success" value="인증요청" onclick="findId(this.form)">
				</form>
			</div>
		</div>
	</div>	

</div>
</body>
</html>