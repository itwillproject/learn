<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<style type="text/css">
	#inquiry {
		display: none;
	}
</style>
</head>
<body>
	<%@ include file="../Common/header.jsp"%>
	<div class="container-fluid" style="background-color: lightgreen;">
				<h2>&nbsp; </h2>
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>방 번호</th>
					<th>방 아이디</th>
					<th>최근 채팅일</th>
					<th>답변 상태</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty contentRoomList }">
					<tr><td colspan="4">채팅방이 없습니다</td></tr>
				</c:if>
			<c:if test="${not empty contentRoomList}">
				<c:forEach var="contentRoomList" items="${contentRoomList }">
					<tr>
						<td>${contentRoomList.chatNo }</td>
						<td><a href="${pageContext.request.contextPath}/Admin/chatTest2.do?bang_id=${contentRoomList.userId }&userId=${contentRoomList.userId }">${contentRoomList.userId }</a></td>
						<td>${contentRoomList.chatRegdate }</td>
						<td>${contentRoomList.chatOk }</td>
					</tr>
				</c:forEach>
			</c:if>
				
			</tbody>
		</table>
	</div>

</body>

	<footer>
		<%@ include file="../Common/footer.jsp"%>
	</footer>
</html>