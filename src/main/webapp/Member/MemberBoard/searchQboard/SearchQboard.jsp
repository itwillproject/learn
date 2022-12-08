<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="table">            
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
						<a href="${pageContext.request.contextPath}/memberBoard/viewPage.do?qnaNo=${memberBoard.qnaNo }"><h4>${memberBoard.qnaTitle }</h4>
						<p>${memberBoard.qnaContent }</p>
						<p>${memberBoard.userName } ·${memberBoard.qnaRegdate } </p></a>
						</div>	
					</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div id="paging">

	<ul>
		<c:if test="${pvo.beginPage == 1 }">
       	<a href="#" class="disabled"><li>이전페이지</li></a>
	</c:if>
	<c:if test="${pvo.beginPage != 1 }">
       	<a href="javascript:pageGo(${pvo.beginPage -1 })">
       	<li>이전페이지</li></a>
	</c:if>
	
	<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
		<c:if test="${pageNo == pvo.nowPage }">
        	<a href="#" class="is-active disabled" ><li>${pageNo }</li></a>
		</c:if>
		
		<c:if test="${pageNo != pvo.nowPage }">
	        <a href="javascript:pageGo(${pageNo })"><li>${pageNo }</li></a>
		</c:if>
	</c:forEach>

	
	<c:if test="${pvo.endPage < pvo.totalPage }">
        <a href="javascript:pageGo(${pvo.endPage + 1 })"><li>다음페이지</li></a>
	</c:if>
	<c:if test="${pvo.endPage >= pvo.totalPage }">
        <a href="#" class="disabled" ><li>다음페이지</li></a>
	</c:if>
	
     </ul>
</div>