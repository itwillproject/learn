<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 신고관리</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style>
	.outer {
		text-align: center;
	}
	.inner {
		display: inline-block;
		text-align: center;
	}
	.save {
	  background-color: #4CAF50;
	  border: none;
	  color: white;
	  padding: 2px 8px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  margin: 4px 2px;
	  cursor: pointer;
	}
</style>
<script>


	function save_go() {
		var socket = null;
		connectWs();
		var con_test = confirm("저장하시겠습니까?");
		if (con_test == true) {
			window.opener.name = "parentPage"; // 부모창의 이름 설정
		    document.getElementById('frm').target = "parentPage"; // 타켓을 부모창으로 설정
		    document.getElementById('frm').action = "${pageContext.request.contextPath}/resultReportStatus.do";  //부모창에 호출될 url 
		    
		    document.getElementById('frm').submit();
		    
		}
		
	}
	
/////////////////////////////////////////////////////////////////////////////

/* $(document).ready(function(){
	if("${user.userId}" != null){
		connectWs();	
	}
}) */

function connectWs(){
	var ch = $("#select").val();
    // alert(ch);
    var toId = $("#reporter").val();
    var boardType = $("#boardType").val();
    var boardNo = $("#boardNo").val()
	console.log("tttttt");
	var ws = new SockJS("http://192.168.18.11:8080/learn/alram");
	
	socket = ws;
	
	ws.onopen = function() {
			console.log('open');	
			if(ch == "approve"){
			    if(socket){
					let socketMsg = "reporttrue,"+"${user.userId}"+","+toId+","+boardNo+","+boardType+","+"신고승인했다";
					console.log(socketMsg);
					ws.send(socketMsg);
		    		self.close();
		   		}
		    } else {
		    	if(socket){
					let socketMsg = "reportfalse,"+"${user.userId}"+","+toId+","+boardNo+","+boardType+","+"신고거절했다";
					console.log(socketMsg);
					ws.send(socketMsg);
					self.close();
		   		}
		    }
	};
	
	ws.onclose = function() {
		 console.log('close');
	};
 
 
	

};
	
</script>

</head>
<body>
<div class="outer">
	<div class="inner">
		<br><br>
		해당 게시글 경고 누적 횟수 : ${cnt }번
		<br><br>
		<form id="frm">
			<select style="width: 100px;" name="result" id="select">
			 	<option selected disabled>선택</option>
				<option title="승인" value="approve">승인</option>
				<option title="거절" value="reject">거절</option>
			</select>
 			<button type="button" class="save" onclick="save_go()">저장</button> 
			<input type="hidden" name="boardType" value="${vo.boardType }" id="boardType">
			<input type="hidden" name="boardNo" value="${vo.boardNo }" id="boardNo">
			<input type="hidden" name="reporter" value="${vo.reporter }" id="reporter">
			<br><br>
		</form>
	</div>
</div>
</body>
</html>