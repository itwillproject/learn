<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>

.active {
	font-weight: bold;
	text-decoration: underline;
}

.nav-link {
	color: black;
}

.active-btn {
	color: #fff;
	background-color: #00C471;
}
</style>
</head>
<body>
	<%@ include file="../Common/header.jsp"%>
	<div class="container-fluid bg-dark">
		<div class="container tape">
			<section class="tapeContent">
				<h2>문의게시판</h2>
			</section>
		</div>
	</div>
	<div class="container">

		<div class="row">
			<div class="col-2">
				<%@ include file="sideNav.jspf"%>
			</div>
			<div class="col-10">
				<h2>조회</h2>
				<div class="pb-2">
					<button type="button" class="btn btn-primary"
						onclick="location.href='index.jsp'">로그인 이동</button>
				</div>
				<div class="pb-3">
					<ul class="border nav p-1">
						<li class="nav-item"><a class="nav-link" href="#home">질문</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#menu1">자유주제</a>
						</li>
						<li class="nav-item"><a class="nav-link active">문의글</a></li>
					</ul>
				</div>
				<div class="border">
					<div class="pb-3">
						<ul class="nav pl-3 pt-3 pb-1">
							<li class="nav-item"><a
								class="nav-link btn btn-sm btn-light mr-1" href="javascript:cBoardList()">전체</a></li>
							<li class="nav-item"><a
								class="nav-link btn btn-sm btn-light mr-1" href="javascript:resolvedCBoardList()">해결</a></li>
							<li class="nav-item"><a
								class="nav-link btn btn-sm btn-light mr-1 active-btn" href="javascript:unResolvedCBoardList()">미해결</a></li>
						</ul>
					</div>
					<div id="listDisp">
					<c:if test="${not empty BoardList}">
						<c:forEach var="BoardList" items="${BoardList }">
							<div class="pt-1 pl-4 pr-4">
								<h5>
									<b> ${BoardList.qnaTitle }</b>
								</h5>
								<c:choose>
							        <c:when test="${fn:length(BoardList.qnaContent) gt 16}">
							        <c:out value="${fn:substring(BoardList.qnaContent, 0, 15)}...">
							        </c:out></c:when>
							        <c:otherwise>
							        <c:out value="${BoardList.qnaContent}">
							        </c:out></c:otherwise>
								</c:choose>
								<div class="pt-1">
									<span>${BoardList.qnaRegdate }</span>
								</div>
								<hr>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty BoardList}">
						<div class="pt-1 pl-4 pr-4">
							<h5>작성한 질문이 없습니다.</h5>
						</div>
					</c:if>
					</div>
					
				</div>
			</div>
		</div>
	</div> 
 	<script>

		function cBoardList() {
			alert("cBoardList() 실행");

			$.ajax("${pageContext.request.contextPath}/memberBoard/cBoardList.do?userId=${user.userId}", {
				type : "get",
				dataType : "json", //서버로부터 응답받는 데이터 형식
				success : function(data) {
					alert("성공~!");
					console.log("data : " + data);
					let dispHtml = "";
					var summary = "";
					$.each(data, function(index, obj){
						summary = this.qnaContent;
						if(summary.length > 15) {
							summary = summary.substring(0, 15);
							summary += '...';
						}				
						dispHtml += '<div class="pt-1 pl-4 pr-4">';
						dispHtml += "<h5><b>" + this.qnaTitle + "</b></h5>"
						dispHtml += "<span>" + summary + "</span><br>";
						dispHtml += '<div class="pt-1"><span>' + this.qnaRegdate + "</span></div><hr></div>";	
					});

					$("#listDisp").html(dispHtml);
				},
				error : function() {
					alert("실패!");
				}
			});
		}
		</script>
		<script>
		function resolvedCBoardList() {
			alert("resolvedCBoardList() 실행");
			$.ajax("${pageContext.request.contextPath}/memberBoard/resolvedCBoardList.do?userId=${user.userId}", {
				type : "get",
				dataType : "json", //서버로부터 응답받는 데이터 형식
				success : function(data) {
					alert("성공~!");
					console.log("data : " + data);
					let dispHtml = "";
					var summary = "";
					$.each(data, function(index, obj){
						summary = this.qnaContent;
						if(summary.length > 15) {
							summary = summary.substring(0, 15);
							summary += '...';
						}
						dispHtml += '<div class="pt-1 pl-4 pr-4">';
						dispHtml += "<h5><b>" + this.qnaTitle + "</b></h5>"
						dispHtml += "<span>" + summary + "</span><br>";
						dispHtml += '<div class="pt-1"><span>' + this.qnaRegdate + "</span></div><hr></div>";	
					});

					$("#listDisp").html(dispHtml);
				},
				error : function() {
					alert("실패!");
				}
			});
		}
		</script>
		<script>
		function unResolvedCBoardList() {
			alert("unResolvedCBoardList() 실행");

			$.ajax("${pageContext.request.contextPath}/memberBoard/unResolvedCBoardList.do?userId=${user.userId}", {
				type : "get",
				dataType : "json", //서버로부터 응답받는 데이터 형식
				success : function(data) {
					alert("성공~!");
					console.log("data : " + data);
					let dispHtml = "";
					var summary = "";
					$.each(data, function(index, obj){
						summary = this.qnaContent;
						if(summary.length > 15) {
							summary = summary.substring(0, 15);
							summary += '...';
						}
						dispHtml += '<div class="pt-1 pl-4 pr-4">';
						dispHtml += "<h5><b>" + this.qnaTitle + "</b></h5>"
						dispHtml += "<span>" + summary + "</span><br>";
						dispHtml += '<div class="pt-1"><span>' + this.qnaRegdate + "</span></div><hr></div>";	
					});

					$("#listDisp").html(dispHtml);
				},
				error : function() {
					alert("실패!");
				}
			});
		}
	</script>
	<footer>
		<%@ include file="../Common/footer.jsp"%>
	</footer>
</body>
</html>
