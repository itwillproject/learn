<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문게시판리스트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>
	<%@include file="/Community/tape.jsp" %>

<div>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<p>-------왼쪽네비-------</p>
			</div>
			
			<div class="col-sm-8 align-content-center">
				<nav class="navbar navbar-expand-sm navbar-light">
                    <ul class="navbar-nav gray-botton">
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
				
				<div class="searchByText row d-flex flex-row justify-content-center">
					<form action="">
						<input type="text" name="search" placeholder="궁금한 질문을 검색해보세요!">
						<button class="btn btn-success ml-4">검색</button>
					</form>
				</div>
				
				<div class="row d-flex">
					<div class="col-10">
					<nav class="navbar navbar-expand-sm navbar-light" style="margin-top: 10px">
                        <ul class="navbar-nav ">
                            <li class="nav-item active">
                            <a class="nav-link" href="#">최신순</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">정확도순</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">답변많은순</a>
                            </li>
                            <li class="nav-item">
                            <a class="nav-link" href="#">좋아요순</a>
                            </li>
                        </ul>
					</nav>
					</div>
					<div class="col-2 mt-auto">
						<button class="btn btn-dark ml-auto">글쓰기</button>
					</div>
				
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

				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#">이전페이지</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">다음페이지</a></li>
				</ul>				
				
			</div>			
			
			<div class="col-sm-2">
				<p>------오른쪽네비--------</p>
			</div>
		</div>
	</div>
</div>




</body>
</html>