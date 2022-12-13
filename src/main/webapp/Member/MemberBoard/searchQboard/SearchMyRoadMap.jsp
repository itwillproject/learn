<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="myRoadMaps">            

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

