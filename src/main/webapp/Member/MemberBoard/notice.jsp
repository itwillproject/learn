<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	.getNotice a {color: black;}
	 	.getNotice a:hover {
	  	text-decoration: none;
	  	color: green;
	 	}
	 	.center { text-align: center; }
	.tape {
		height: 100px;
		margin: 50px auto;
		padding-top: 15px;
		color: white;
	}
	.table #N { color: lime;}  
	.table #fontSize { font-size: 0.7em }
	 	.inner {
		display: inline-block;
		text-align: left;
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
	
	/* 페이징처리 css */
	.page_wrap {
		text-align:center;
		font-size:0;
	 }
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation a {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation a.active {
		background-color:green;
		color:white;
		border:1px solid green;
	}
	.textfield {
		position: relative;
		text-align: center;
		width: 500px;
		height: 32px;
		font-size: 15px;
		border: 0;
	 	border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
	}
	
</style>
<script>
  	function press(f) {
	    if(f.keyCode == 13) { //javascript에서는 13이 enter키를 의미함
			search.submit(); //formname에 사용자가 지정한 form의 name입력
	    }
	}
</script>
</head>
<body>
	<!-- 헤더 -->
    <%@ include file="/Common/header.jsp" %>
    <div class="container-fluid bg-dark">
		<div class="container tape">
			<section class="tapeContent">		
				<h2>새로운 소식들!</h2>
				<p>신규 컨텐츠, 이벤트, 기능 추가 등의 새로운 아웃풋런의 이야기를 들어주세요.</p>
			</section>
		</div>
	</div>
	
  	<div class="outer">
		<div class="inner">
			<form action="getBoardList.do" method="post" name="search">
		        <input  class="textfield" name="keyword" type="text" size="30" onkeypress="JavaScript:press(this.form)" placeholder="검색어를 입력하세요."> 
			</form>
		</div>
	</div>

 	<br><br>
    
    <!-- 리스트 출력 -->
	<div class="container">      
	  <table class="table">
	    <tbody>
	    <c:if test="${not empty list }">
	      <c:forEach var="notice" items="${list }">
		      <tr>
		        <td class="getNotice">
			        <a href="getNotice.do?boardNo=${notice.boardNo }">
			        	<span id="N">N.</span> ${notice.boardTitle }
						<br>
						<span id="fontSize">${notice.boardRegdate } 관리자</span>
					</a>	
				</td>
		      </tr>
	      </c:forEach>
	    </c:if>
	    <c:if test="${empty list }">
			<tr>
				<td class="center">데이터가 없습니다.</td>
			</tr>
		</c:if>		
	    </tbody>
	  </table>
	</div>
	
	<!-- 페이징 처리 -->
	<div class="page_wrap">
	   <div class="page_nation">
		<c:if test="${pageMaker.prev}">
			<a class="arrow prev" href="getNoticeList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">&lt</a>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
            <a href="getNoticeList.do${pageMaker.makeQuery(idx)}">${idx}</a>
	    </c:forEach>
	    
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<a class="arrow next" href="getNoticeList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">&gt</a>
	    </c:if> 
	   </div>
	</div>
	
	
<%--	<div>
	  <ul>
	    <c:if test="${pageMaker.prev}">
	    	<li><a href="getNoticeList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
	    </c:if> 
	
	    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
	    	<li><a href="getNoticeList.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
	    </c:forEach>
	
	    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
	    	<li><a href="getNoticeList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
	    </c:if> 
	  </ul>
	</div> --%>
	
	
<%--	<div class="page_wrap">
	   <div class="page_nation">
		<c:if test="${pvo.beginPage != 1}">	
			<a class="arrow prev" href="noticePage.do?cPage=${pvo.beginPage - 1 }">&lt</a>
		</c:if>
		
		<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
			<c:if test="${pageNo == pvo.nowPage }">
				<a class="active">${pageNo}</a>
			</c:if>
			<c:if test="${pageNo != pvo.nowPage }">
				<a href="noticePage.do?cPage=${pageNo }">${pageNo}</a>
			</c:if>
		</c:forEach>	
		
		<c:if test="${pvo.endPage < pvo.totalPage}">
			<a class="arrow next" href="noticePage.do?cPage=${pvo.endPage + 1 }">&gt</a>
		</c:if>
	   </div>
	</div> --%>
	
<%-- <div class="page_wrap">
	   <div class="page_nation">
	      <a class="arrow prev" href="#">&lt</a>
	      <a href="#" class="active">1</a>
	      <a href="#">2</a>
	      <a href="#">3</a>
	      <a href="#">4</a>
	      <a href="#">5</a>
	      <a href="#">6</a>
	      <a href="#">7</a>
	      <a href="#">8</a>
	      <a href="#">9</a>
	      <a href="#">10</a>
	      <a class="arrow next" href="#">&gt</a>
	   </div>
	</div> --%>
	
	<br><br><br>
	 <%@ include file="/Common/footer.jsp" %>
</body>
</html>
