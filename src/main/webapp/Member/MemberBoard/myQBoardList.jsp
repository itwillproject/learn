<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            
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
		width: 840px;
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
	    font-size: 15px;
	}
	.faq-content {
	    border-bottom: 1px solid #e0e0e0;
	}
	.question {
	    padding: 25px 0;
	    background: none;
	    cursor: pointer;
	    border: none;
	    outline: none;
	    width: 100%;
	    text-align: left;
	    font-size: 18px;
	    
	}
	.question:hover {
	    color: black;
	}
	[id$="-toggle"] {
	    margin-right: 10px;
	}
  
 	.answer, .question { 
 		font-family: 'Gamja Flower', cursive; 
 	    font-size: 20px; 
 	    font-weight: 400; 
 	} 
 	
 	table a {
		color: black;
		text-decoration: none;
	}
	
	table a:hover {
		color: black;
		font-weight: bold;
		text-decoration: none;
 	}
	
  </style>
</head>
<body>
	<%@ include file="/Common/header.jsp" %>

	<div class="container-fluid">
		<div class="row justify-content-center">
		
			<!-- 왼쪽 네비 -->
			<div class="col-sm-2">
				<p>-------왼쪽네비-------</p>
			</div>
			
			
			<!-- 가운데 내용 -->
			
			<div class="col-sm-6 align-content-center">
			
				<br><br>
				<!-- 하위 네비 -->
				<div class="outer">
					<div class="inner">
						<ul class="menuborder">
						  <li class="menu"><a href="/learn/getFaqList.do">자주 묻는 질문</a></li>
						  <li class="menu"><a class="active"  href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do">고객센터 문의하기</a></li>
						  <li class="menu"><a href="/learn/Member/MemberBoard/serviceIntegrationPolicy.jsp">통합서비스 이용약관</a></li>
						  <li class="menu"><a href="/learn/Member/MemberBoard/generalPolicy.jsp">아웃풋런 이용약관</a></li>
						  <li class="menu"><a href="/learn/Member/MemberBoard/privacyPolicy.jsp">개인정보 취급방침</a></li>
						</ul>
					</div>
				</div>
			
			<!-- 섹션 구분 -->
				<div class="d-flex flex-row pr-5">
				<nav class="navbar navbar-expand-sm navbar-light p-3">
                    <ul class="navbar-nav gray-botton w-100" style="border-bottom: 1px solid gray">
                        <li class="nav-item active black-line">
                        <a class="nav-link" href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do">전체</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do?qnaAdopt=FALSE">미해결</a>
                        </li>
                        <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do?qnaAdopt=TRUE">해결됨</a>
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
								
						<c:if test="${pvo.totalRecord == 0 }">
							<p>검색한 내용이 없습니다.</p>
						</c:if>
						
				<table class="table table-hover mt-5">
					<tbody>
						<c:forEach var="memberBoard" items="${memberBoardList }">							
							<tr>
								<td style="height: 100px">
								<div class="row">
									<div class="col-10">
									<a href="${pageContext.request.contextPath}/memberBoard//viewPage.do?qnaNo=${memberBoard.qnaNo }"><h4>${memberBoard.qnaTitle }</h4>
									<p>${memberBoard.qnaContent }</p>
									<p>${memberBoard.userId } ·${memberBoard.qnaRegdate } </p></a>
									</div>	
								</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<!-- 페이지네이션 페이징 paging -->
				
				<c:if test="${pvo.totalRecord != 0 }">
				
				<div class="pagination p12 justify-content-center">
			      <ul>
 					<c:if test="${pvo.beginPage == 1 }">
			        	<a href="#" disabled><li>이전페이지</li></a>
					</c:if>
					<c:if test="${pvo.beginPage != 1 }">
			        	<a href="${pageContext.request.contextPath}/memberBoard//getMyQBoardList.do?cPage=${pvo.beginPage -1 }&searchKeyword=${memberBoard.searchKeyword}">
			        	<li>이전페이지</li></a>
					</c:if>
					
					
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:if test="${pageNo == pvo.nowPage }">
				        	<a href="#" class="is-active" disabled><li>${pageNo }</li></a>
						</c:if>
						
						<c:if test="${pageNo != pvo.nowPage }">
					        <a href="${pageContext.request.contextPath}/memberBoard//getMyQBoardList.do?cPage=${pageNo }&searchKeyword=${memberBoard.searchKeyword}"><li>${pageNo }</li></a>
						</c:if>
					</c:forEach>

					
					<c:if test="${pvo.endPage < pvo.totalPage }">
				        <a href="${pageContext.request.contextPath}/memberBoard//getMyQBoardList.do?cPage=${pvo.endPage + 1 }&searchKeyword=${memberBoard.searchKeyword}"><li>다음페이지</li></a>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
				        <a href="#" class="" disabled><li>다음페이지</li></a>
					</c:if>
					
			      </ul>
			    </div>
			    </c:if>
				
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