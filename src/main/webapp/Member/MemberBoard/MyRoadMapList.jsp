<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 강의 목록</title>
<style>
.tape {
	color: white;
	height: 50px;
}

.gray-line{
 	border-bottom: solid 1px #dddddd;
}

#myLectures a{
	text-decoration: none;
	color: black;
}

#myLectures a:hover {
	text-decoration: none;
	color: #444444;
	font-weight: normal;
}

#lectureheader a {
	background-color: #1dc078;
	color: white;
	border: 2px solid white;
	width: 120px;
	text-align: center;
}

#lectureheader a:hover{
	text-decoration: none;
	font-weight: normal;
	background: #2ed39a;
}

#teacherName{
	font-weight: bold;
}

.col-4:hover {
	background: #eeeeee;
}
.active-menu {
	color: #1dc078;
	font-weight: bold;
}
.norm-menu {
	color: black;
}

</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	
	<script type="text/javascript">
	
// 	$(document).on("change", "#ordering", function(){
// 		ajaxserachh();
// 	});
	
	
	$(document).on("keyup", "#searchKeyword", function(){
		ajaxserachh();
	});
	
	
	
	
	function ajaxserachh(){
		var searchKeyword = $("#searchKeyword").val();
// 		var sorting = $("#ordering").val();
		
		
		
		$.ajax({
// 			url: "${pageContext.request.contextPath}/memberBoard/goMyRoadMapListAj.do?ordering="+ordering+"&searchKeyword="+searchKeyword,
			url: "${pageContext.request.contextPath}/memberBoard/goMyRoadMapListAj.do?searchKeyword="+searchKeyword,
			type : "get",
			async : true,
			
			success : function(data){
				console.log("에이젝스 성공!!");
// 				console.log(data);

				var html = jQuery('<div>').html(data);
				var myRoadMaps = html.find("div#myRoadMaps").html();
				
				console.log(myRoadMaps);
				
				
				$("#myRoadMap").html(myRoadMaps);
				
			},
			
			error : function(){
				console.log("에이젝스 실패!!");
			}
				
		});
	}
	
	

	
	</script>
	
	
	
</head>
<body>

	<!-- 채팅창 -->
<!-- 	<div class="d-flex flex-row fixed-bottom"> -->
<!-- 		<p>채팅창 입니다</p> -->
<!-- 	</div> -->

	<!-- 헤더 올리기 -->
	<%@ include file="/Common/header.jsp"%>
	
	<!-- 띠지 테이프 -->
	<div class="container-fluid bg-dark mt-5">
		<div class="row w-100 tape">		
		
			<div class="col-4 d-flex flex-row  align-content-center justify-content-center w-100">
				<h2 class="mx-auto my-auto w-100" style="text-align: center;">나의 로드맵</h2>
			</div>
									
			<div class="col-6 pl-3">
			</div>
		</div>
	</div>
	
	<!-- 아래 내용 부분 -->
	<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">

		<div class="row w-100 pb-4 justify-content-center">
		
			<!-- 왼쪽 사이드 네비 -->
			<div class="col-2 d-flex justify-content-center">
				<%@ include file="/Member/sidebar.jspf"%>
				<script>
					var menu = $('#mystudyMenu');
					console.log(menu);
					menu.removeClass('norm-menu');
					menu.addClass('active-menu');
				</script>
			</div>
			
			<!-- 가운데 내용 -->
			<div class="col-6 pl-3">
			
			
				<!-- 가운데 내비 / 보유한강의 / 내강의폴더 / 로드맵 / 수강확인증 / 수료증 -->
				<div class="row w-100">
				
					<div class="gray-line row w-100 mb-3" id="lectureheader">
						<ul class="nav">
						  <li class="nav-item">
						    <a class="nav-link" href="${pageContext.request.contextPath}/memberBoard/goMyLectureList.do">보유한강의</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="${pageContext.request.contextPath}/memberBoard/goMyRoadMapList.do">로드맵</a>
						  </li>
						</ul>
					</div>															
					
					<!-- ajax로 검색 -->
					<div class="row w-100 my-3 pb-3">
							<form id="ajaxForm" class="w-100 d-flex">
							<div class="ml-4">
<!-- 							<select id="ordering" name="sorting"> -->
<!-- 								<option value="asc" selected="selected">제목 오름차순</option> -->
<!-- 								<option value="desc">제목 내림차순</option> -->
<!-- 							</select> -->
							</div>
							
							<div class="ml-4">

							</div>
													
								<input type="text" class="w-50 ml-auto" id="searchKeyword" name="searchKeyword" placeholder="로드맵 또는 지식공유자 이름으로 검색">
							</form>
					</div>
					
				</div>
				
					
				<div class="container mt-3" id="myRoadMap">
				
				
				<div>
						<c:forEach varStatus="vs" var="roadMap" items="${roadMapList }" >
						
							<c:if test="${vs.count % 3 == 1 }">
								<div class="row w-100">
							</c:if>
							
							<div class="col-4 p-3">
							<div class="row p-2">							
								<a href="${pageContext.request.contextPath}/roadmap/roadmapDetail.do?rboardNo=${roadMap.rboardNo}">
								<img width="100%" alt="lectureImg" src="${pageContext.request.contextPath}/filepath/${roadMap.rboardCoverimg }"></a>
							</div>
							<p><a id="teacherName" style="color: #19c056" href="${pageContext.request.contextPath}/roadmap/roadmapDetail.do?rboardNo=${roadMap.rboardNo}">${roadMap.userName }</a></p>
							<p><a href="${pageContext.request.contextPath}/roadmap/roadmapDetail.do?rboardNo=${roadMap.rboardNo}">${roadMap.rboardTitle }</a> <a style="font-size: 0.8em; color: #999999; float: right;">${roadMap.categoryName }</a></p>
							
							</div>
							
							<c:if test="${vs.last }">
								<c:if test="${vs.count % 3 == 2 }">
									<div class="col-4 p-3"></div>
								</c:if>
								<c:if test="${vs.count % 3 == 1 }">
									<div class="col-4 p-3"></div>
									<div class="col-4 p-3"></div>
								</c:if>
								</div>
							</c:if>
							
							<c:if test="${vs.count % 3 == 0 }">
								</div>
							</c:if>
							
						</c:forEach>
				</div>
				
				
						
				</div>


				
	<%@include file="/Common/footer.jsp" %>
</body>
</html>