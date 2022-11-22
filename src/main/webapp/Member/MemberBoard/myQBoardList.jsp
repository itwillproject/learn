<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>자주묻는질문 FAQ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap" rel="stylesheet">
  
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
  
  <style>
  	.inner {
		width: 640px;
		display: inline-block;
		text-align: left;
	}
	.inner2 {
		width: 700px;
		display: inline-block;
		text-align: left;
		font-size: 1.3em;
	}
	.outer {
		text-align: center;
	}
	.menuborder {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
 	    border-bottom: 1px solid #e7e7e7; 
	}
	.menu {
	    float: left;
	}
	.menu a {
	    display: block;
		color: black;
	    text-align: center;
	    padding: 14px 16px;
	    text-decoration: none;
	}
	.menu a:hover:not(.active) {
		text-decoration: none;
		color: black;
	}
	.menu a.active {
	    color: white;
	    background-color: #4CAF50;
	}
	a:hover {
		text-decoration: none;
	}
	.main { 
		text-align: center; 
		font-size: 1.3em;
	}
	.answer {
	    display: none;
	    padding-bottom: 30px;
	}
	.faq-content {
	    border-bottom: 1px solid #e0e0e0;
	}
	.question {
	    padding: 30px 0;
	    cursor: pointer;
	    border: none;
	    outline: none;
	    background: none;
	    width: 100%;
	    text-align: left;
	}
	.question:hover {
	    color: green;
	}
	[id$="-toggle"] {
	    margin-right: 10px;
	}
 	.answer, .question { 
 		font-family: 'Gamja Flower', cursive; 
 	    font-size: 20px; 
 	    font-weight: 400; 
 	} 
	
  </style>
</head>
<body>
	<%@ include file="/Common/header.jsp" %>
	<br><br>
	
	<div class="outer">
		<div class="inner">
			<ul class="menuborder">
			  <li class="menu"><a class="active" href="#">자주 묻는 질문</a></li>
			  <li class="menu"><a href="#">통합서비스 이용약관</a></li>
			  <li class="menu"><a href="#">인프런 이용약관</a></li>
			  <li class="menu"><a href="#">개인정보 취급방침</a></li>
			  <li class="menu"><a href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do">나의 질문</a></li>
			</ul>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row justify-content-center">
		
			<!-- 왼쪽 네비 -->
			<div class="col-sm-2">
				<p>-------왼쪽네비-------</p>
			</div>
			
			<div class="col-sm-6 align-content-center">
				<div class="d-flex flex-row pr-5">
				<nav class="navbar navbar-expand-sm navbar-light p-3">
                    <ul class="navbar-nav gray-botton w-100" style="border-bottom: 1px solid gray">
                        <li class="nav-item active black-line">
                        <a class="nav-link" href="#">전체</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#">미해결</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="#">해결됨</a>
                        </li>
                    </ul>
				</nav>
				
				<button class="btn btn-dark ml-auto my-auto h-50"
				 onclick="location.href='${pageContext.request.contextPath}/memberBoard/qnaWriteForm.do'" style="height: 30px">글쓰기</button>
				</div>
				
				<div class="d-flex flex-row p-3">
					<form action="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do" class="w-100 d-flex align-content-center">
						<input type="text" class="w-75" name="searchKeyword" placeholder="궁금한 질문을 검색해보세요!">
						<button class="btn btn-success ml-auto px-4">검색</button>
					</form>
				</div>
								
				<table class="table table-hover mt-5">
					<tbody>
						<tr>
							<td style="height: 100px">
							<div class="row">
								<div class="col-10">
								<h4>목차용 에디터 만들기 강좌에서</h4>
								<p>내용이 어쩌고 저쩌고</p>
								<p>아이디 ·몇분전·강의제목</p>
								</div>

								<div class="col-2">
									<div class="row d-flex justify-content-center">
										<div class="ball">
											<p>0</p>
											<p>답변</p>
										</div>
									</div>
									<div class="row d-flex justify-content-center">
										<p class="text-center">♥ 0</p>
									</div>
								</div>
							</div>
							</td>
						</tr>

				</table>
				
				<div class="pagination p12 justify-content-center">
			      <ul>
			        <a href="#"><li>이전페이지</li></a>
			        <a href="#"><li>1</li></a>
			        <a href="#"><li>2</li></a>
			        <a href="#"><li>3</li></a>
			        <a href="#"><li>4</li></a>
			        <a href="#"><li>5</li></a>
			        <a class="is-active" href="#"><li>6</li></a>
			        <a href="#"><li>다음페이지</li></a>
			      </ul>
			    </div>
				
			</div>			
			
			<!-- 오른쪽 네비 -->
			<div class="col-sm-2">
				<p>------오른쪽네비--------</p>
			</div>
		</div>
	</div>
	
	<%@include file="/Common/footer.jsp" %>

</body>
<script>
	const items = document.querySelectorAll('.question');
	
	function openCloseAnswer() {
	  const answerId = this.id.replace('que', 'ans');
	
	  if(document.getElementById(answerId).style.display === 'block') {
	    document.getElementById(answerId).style.display = 'none';
	    document.getElementById(this.id + '-toggle').textContent = '+';
	  } else {
	    document.getElementById(answerId).style.display = 'block';
	    document.getElementById(this.id + '-toggle').textContent = '-';
	  }
	}
	items.forEach(item => item.addEventListener('click', openCloseAnswer));
</script>
</html>