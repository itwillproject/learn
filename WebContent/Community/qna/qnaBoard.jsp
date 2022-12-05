<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	
	<!-- include summernote css/js -->
	<link href="${pageContext.request.contextPath}/summernote/summernote-bs4.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>
	

	<script>
	$(document).ready(function() {
		   $('#summernote').summernote({
		     height: 300,                 // set editor height
		     minHeight: null,             // set minimum height of editor
		     maxHeight: null,             // set maximum height of editor
		     focus: true,                  // set focus to editable area after initializing summernote
		     callbacks: { // 콜백을 사용
		       // 이미지를 업로드할 경우 이벤트를 발생
		       onImageUpload: function(files, editor, welEditable) {
		         sendFile(files[0], this);
		       }
		     }
		   });
		$('.summernote').summernote();
		 });

		 function sendFile(file, editor) {
		   // 파일 전송을 위한 폼생성
		   data = new FormData();
		   data.append("uploadFile", file);
		   $.ajax({ // ajax를 통해 파일 업로드 처리
		     data : data,
		     type : "POST",
		     url : "knowhowImageUpload.do", // controller
		     cache : false,
		     contentType : false,
		     processData : false,
		     success : function(data) { // 처리가 성공할 경우
		       // 에디터에 이미지 출력
		       $(editor).summernote('editor.insertImage', data.url);
		       //$("#thumbnail").val(data.url); // 썸네일 설정
		     }
		   });
		 }

		
	</script>


</head>
<body>
	<%@include file="/Common/header.jsp" %>

	<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
		<div class="row w-100 pb-4 justify-content-center">
			
			<!-- 왼쪽 네비 -->
			<div class="col-2 d-flex justify-content-center">
				<a href="#" style="position: fixed;"><img class="mt-3" height="35px" src="${pageContext.request.contextPath}/Community/img/back.png"></a>
			</div>

			<!-- 중앙 위 내용 - 글내용 -->
			<div class="col-6 pl-3 gray-line">
				<div class="row align-items-center p-3">
					<img class="mr-2" style="height: 30px" src="${pageContext.request.contextPath}/Community/img/qqq.png">					
					<h3><b>github 권한 요청 드립니다!</b></h3>
				</div>
				<div class="row pl-3 pb-3">
					<p class="mr-2"><b>아이디</b></p><p class="text-muted">2022.11.18 오전 9:20</p>
				</div>

				<div class="d-flex flex-row p-3">
					<p>내용 어쩌고</p>
					<p>배너어쩌고</p>
					<p>배너어쩌고</p>
				</div>
			</div>
			
			<!-- 오른쪽 네비 -->
			<div class="col-2">				
				<!-- A vertical navbar -->
				<nav class="navbar">
				  <!-- Links -->
				  <ul class="navbar-nav comNav">
				    <li class="nav-item d-flex justify-content-center align-items-center">
				      <a href="#">미해결</a>
				    </li>
				    <li class="nav-item d-flex justify-content-center align-items-center">
				      <a href="#">
				      	<img height="20px" src="${pageContext.request.contextPath}/Community/img/LikeOff.png">
				      	<span class="ml-3">0</span>
				      </a>
				    </li>
				    <li class="nav-item d-flex justify-content-center align-items-center">
				      <a href="#">
					     <img height="20px" src="${pageContext.request.contextPath}/Community/img/BookmarkOff.png">
					     <span class="ml-3">0</span>
				      </a>
				    </li>
				    <li class="nav-item d-flex justify-content-center align-items-center">
				      <a href="#">
				      	<img height="20px" src="${pageContext.request.contextPath}/Community/img/LinkTo.png">
				      	<span class="ml-2">공유</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			</div>
			
			
			
			
		</div>		
	</div>

	<div class="container-fluid pt-5"  style="background-color: #F8F9FA;">

		<div class="row w-50 border mx-auto rounded bg-white px-3 py-5" >
			<div class="w-100 mb-3 ml-3 text-editor-block d-flex align-items-center">
				<div class="ml-3">
					<img class="mr-2" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">
				</div>
				<div class="ml-4">
					<div class="row">
					<span><h5><b><a href="#" style="font-size: 1em">jaepang Im</a>님, 답변해주세요!</b></h5></span>
					</div>
					<div class="row">
					<span class="text-secondary">모두에게 도움이 되는 답변의 주인공이 되어주세요!</span>
					</div>
				</div>
			</div>

			<div class="row w-100 mx-auto">
				<form method="post">
					<div class="summernote">summernote 1</div>

					
					<div class="row mt-3">
						<button class="btn btn-success ml-auto">답변등록</button>
					</div>
				</form>
			</div>
		</div>

		<!-- 답변 몇개인, 글 정렬 옵션-->
		<div class="w-75 d-flex flex-row justify-content-center mx-auto mt-4 p-3">
			<div class="row w-75 d-flex flex-row justify-content-around align-items-center" >
					<span class="w-75 ml-4">
					<h3 class="text-success">A</h3><p>총 1개의 답변이 달렸습니다</p>
					</span>
					
					<span class="mr-4">
					<select>
						<option>최신순</option>
						<option>좋아요순</option>
					</select>
					</span>
			</div>				
		</div>

		<!-- 댓글 -->
		<div class="row w-50 border mx-auto rounded bg-white p-3" >

			<div class="w-100 text-editor-block d-flex align-items-center mt-3 mb-3">				
				<div class="ml-3">
					<img class="mr-2" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">
				</div>
				<div class="ml-3">
					<div class="row">
					<span><h5><b><a href="#">OMG</a></b></h5></span>
					</div>
					<div class="row text-secondary">
					<span>2022.11.18 오전 1:52</span>
					</div>
				</div>

			</div>

			<div class="row ml-5">
				<pre > Lorem ipsum dolor sit, 이거 어떻게 해야 하나요? 댓글</pre>
			</div>


			<!-- 대댓글 -->
			<div class="row w-100 border mx-auto rounded p-3 rounded" style="background-color: #F8F9FA;" >
				<div class="d-flex flex-row ml-3 mt-3 w-100 align-items-center">
					<span>
						<h5><b>댓글</b></h5>
					</span>
					<span class="ml-auto">
						<button data-toggle="collapse" data-target=".comments">더보기/접기</button>
					</span>
				</div>
				
				
				<div class="comments">
					<div class="w-100 text-editor-block d-flex align-items-center my-3">
						<div class="ml-3">					
							<img class="mr-2" style="height: 60px" src="${pageContext.request.contextPath}/Community/img/aaa.png">	
						</div>
						<div class="ml-4">
							<div class="row">
							<span><h5><b><a href="#">OMG</a></b></h5></span>
							</div>
							<div class="row text-secondary">
							<span>2022.11.18 오전 1:52</span>
							</div>
						</div>
					</div>
					
					<div class="row ml-5">
						<pre > Lorem ipsum dolor sit, 이거 어떻게 해야 하나요? 대댓글</pre>
					</div>
				</div>
			</div>

			<!-- 대댓글 달기-->

			<div class="d-flex flex-row ml-3 mt-3 w-100 align-items-center">
				<span class="mx-auto">
					<button data-toggle="collapse" data-target=".writeComments">답글쓰기</button>
				</span>
			</div>
			
			<div class="row w-100 p-3 mx-auto">
				<form method="post" class="w-100">
					<div class="summernote">summernote 2</div>
					<div class="row mt-3">
					<button class="btn btn-success ml-auto">답변등록</button>
					</div>
				</form>
			</div>
			
		</div>
	</div>
	
	<%@include file="/Common/footer.jsp" %>




</body>
</html>