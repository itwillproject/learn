<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty likeList2 }">
<fmt:requestEncoding value="utf-8"/>
					<tr><td colspan="9">좋아요가 비어 있습니다</td></tr>
				</c:if>
				<c:if test="${not empty likeList2}">
					<c:forEach var="likeList2" items="${likeList2 }">
						<div class="col-4" style="margin-bottom: 20px;">
							<div class="card" style="width: 100%; height: 500px;">
								<img class="card-img-top"
									src="${pageContext.request.contextPath}/filepath/${likeList2.lectureCoverimg }"
									alt="Card image"
									style="width: 100%; height: auto; object-fit: cover;">
								<div class="card-body" style="overflow: hidden; padding: 10px;">
									<c:choose>
								        <c:when test="${fn:length(likeList2.lectureTitle) gt 21}">
								        	<h4 class="card-title">${fn:substring(likeList2.lectureTitle, 0, 20)}...</h4>
								        </c:when>
								        <c:otherwise>
								       		<h4 class="card-title">${likeList2.lectureTitle}</h4>
								        </c:otherwise>
									</c:choose>
									<p class="card-text" style="color: gray;">${likeList2.lectureWriter }</p>
									<div class="star-ratings">
										<div class="star-ratings-fill space-x-2 text-lg" style="width: ${likeList2.reviewAverage*10*2 }%;">
											<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
										</div>
										<div class="star-ratings-base space-x-2 text-lg">
											<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
											<span><small>(<fmt:formatNumber type="number" maxFractionDigits="3" value="${likeList2.reviewCnt }"/>)</small></span>
										</div>
									</div>
									<p></p>
				
									<c:if test="${likeList2.orderCh == 0}">
										<c:if test="${likeList2.lectureSalePrice == 0}">
											<p class="card-text" style="color: blue"> &#8361;<fmt:formatNumber type="number" maxFractionDigits="3" value="${likeList2.lecturePrice }"/></p>
										</c:if>
										<c:if test="${likeList2.lectureSalePrice > 0}">
											<p class="card-text" style="color: blue"> &#8361;<fmt:formatNumber type="number" maxFractionDigits="3" value="${likeList2.lectureSalePrice }"/></p>
										</c:if>
									</c:if>
									<c:if test="${likeList2.orderCh == 1}">
										<p class="card-text" style="color: green"><B>학습중</B></p>
									</c:if>
									<a href="#" class="stretched-link"></a>
								</div>
								<div class="info">
									<h3>${likeList2.lectureTitle }</h3>
									<p>${likeList2.lectureSummary }</p>
									<p>${likeList2.lectureLevel }</p>
									<p>${likeList2.categoryName }</p>
									<div id="menu">
									
									<a href="javascript:likeCancel(${likeList2.lectureNo });" id="${likeList2.lectureNo }"
									style="position: absolute; right: 15px; bottom: 10px; z-index: 2"><i id="like${likeList2.lectureNo }" class="fas fa-heart" style="color: red"></i></a>
									<!-- data-toggle="tooltip" data-placement="left" title="좋아요 등록/취소" -->
									</div>
								</div>
								
							</div>
							<br>
						</div>
					</c:forEach>
				</c:if>