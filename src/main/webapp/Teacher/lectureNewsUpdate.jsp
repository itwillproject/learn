<%@ page    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
      integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
      crossorigin="anonymous">
      

<!-- 서머노트를 위해 추가해야할 부분 -->
<script src="${pageContext.request.contextPath}/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/summernote/summernote-lite.css">
<title>강의자  - 강의 관리 - 새소식 수정</title>
<style>
	.dropdown:hover .dropdown-menu {
    	display: block;
    	margin-top: 0;
	}
	
	<!-- 본문css -->
	.active-menu {
	  color: #1dc078;
	  font-weight: bold;
	}
	.norm-menu {
	  color: black;
	}
	.active-btn {
	  color: #fff;
	  background-color: #00C471;
	  border-style: none;
	  padding: 5px;
	  border-radius: 5px;
	  margin-right: 5px;
	}
	.outer2 {
		text-align: center;
	}
	.button {
		display: inline-block;
		float: right;
	}
   
</style>
</head>

<!-- 헤더부분 가져오기(제이쿼리 이중 방지) -->
<header>
<ul class="nav mr-auto justify-content-center bg-white" >
	<li class="nav-item">
		<a href="${pageContext.request.contextPath}/Common/index.jsp"><img src="${pageContext.request.contextPath}/picture/mainlogo.png" alt="mainlogo" width="120px" height="40px"></a>
	</li>
 <li class="nav-item">
	<div class="dropdown">
    	<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">온라인 </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">개발 프로그래밍</a>
      <a class="dropdown-item" href="#">보안 네트워크</a>
      <a class="dropdown-item" href="#">데이터 사이언스</a>
    </div>
  </div>
</li>

<li class="nav-item">
    <div class="dropdown">
        <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">오프라인</button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#">개발 프로그래밍</a>
            <a class="dropdown-item" href="#">보안 네트워크</a>
            <a class="dropdown-item" href="#">데이터 사이언스</a>
        </div>
    </div>
</li>

<li class="nav-item">
	<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">로드맵</button>
</li>
<li class="nav-item">
	<div class="dropdown">
		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">커뮤니티</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="${pageContext.request.contextPath}/board/getQnaBoardList.do">질문 & 답변</a>
	      <a class="dropdown-item" href="#">자유주제</a>
	      <a class="dropdown-item" href="${pageContext.request.contextPath}/getNoticeList.do">공지사항</a>
	    </div>
	</div>
</li>
<li class="nav-item">
    <div class="dropdown">
	    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">인프런</button>
	    <div class="dropdown-menu">
	      <a class="dropdown-item" href="#">수강평</a>
	      <a class="dropdown-item" href="#">인프런 피드</a>
	      <a class="dropdown-item" href="#">강의 기능요청</a>
	    </div>
    </div>
</li>
<li>
	<button type="button" class="btn" ><input type="text" id="search"></button>
</li>    
<c:if test="${empty user.userId }">
	<li>
      <button type="button" class="btn" data-toggle="modal" data-target="#login">로그인</button> &nbsp;
    <div class="modal fade" id="login">
        <div class="modal-dialog modal-dialog-centered" style="width: 400px">
            <div class="modal-content align-items-center pb-3">
                <div class="w-100 pr-2 pb-4" style="float: right">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>
                <img style="width: 120px;" src="https://cdn.inflearn.com/public/files/pages/da35da48-52a5-4ec6-b8d3-0389a47610ec/logo1.png">
                <form action="${pageContext.request.contextPath}/Member/login.do" method="post" class="w-100 pl-4 pr-4 pt-4">
                    <input type="email" class="form-control w-100 mb-3" id="userId" placeholder="이메일" name="userId">
                    <input type="password" class="form-control w-100 mb-4" id="userPwd" placeholder="비밀번호" name="userPwd">
                    <button type="submit" class="btn w-100" style="background-color: #00C471; color: white">로그인</button>
                </form>
                <div>
                    <a style="color: black" href="${pageContext.request.contextPath}/Member/findId.jsp">아이디(이메일) 찾기</a> |
                    <a style="color: black" href="${pageContext.request.contextPath}/Member/findPassword.jsp">비밀번호 찾기</a> |
                    <a style="color: black" href="${pageContext.request.contextPath}/Member/newMember.jsp">회원가입</a>
                </div>
                <hr class="w-100">
                <div class="pb-1 text-center">
                    간편 로그인
                </div>
                <div class="text-center">
            <span id="naverIdLogin">
            </span>
                    <script type="text/javascript">
                      var naverLogin = new naver.LoginWithNaverId(
                          {
                            clientId: "vkx131bLLt6ehxKoqXiH",
                            callbackUrl: "http://localhost:8080/${pageContext.request.contextPath}/Member/naverLogin.jsp",
                            isPopup: false,
                            loginButton: {color: "green", type: 1, height: 40}
                          }
                      );
                      naverLogin.init();
                    </script>
                    <span style="display:inline-block;width: 40px; height: 40px; background-color: #f8f8f8; border-radius: 5px">
                <img style="margin:10px; width: 20px; height: 20px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/24px-Google_%22G%22_Logo.svg.png?20210618182606"/>
            </span>
                </div>
            </div>
        </div>
    </div>
</li>
<li>
    <button type="button" class="btn btn-outline-danger" onclick="location.href='${pageContext.request.contextPath}/Member/newMember.jsp'">회원가입</button>&nbsp;
    </li>
</c:if>
<c:if test="${not empty user.userId }">
<li>
      <button type="button" class="btn"><i class="fas fa-cart-plus fa-lg"></i></button> &nbsp;
</li>
<li>
    <div class="dropdown">
        <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/Member/myPage.jsp'"><i class="far fa-user fa-lg"></i></button>
        <div class="dropdown-menu">
            <a class="dropdown-item">${user.userName }</a>
            <a class="dropdown-item"><small>${user.grade }</small></a>
            <a class="dropdown-item"><small>포인트: ${user.points }점</small></a>
            <a class="dropdown-item"><hr></a>
            <c:if test="${user.grade == '강의자' }">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/Teacher/lectureManager.jsp">강의자 페이지로 이동</a>
                <a class="dropdown-item"><hr></a>
            </c:if>
            <a class="dropdown-item" href="#">내 학습</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/Member/inquiry.jsp">작성한 게시글</a>
            <a class="dropdown-item" href="#">좋아요</a>
            <a class="dropdown-item" href="#">구매내역</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do">고객센터</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/Member/logout.do">로그아웃</a>
        </div>
    </div>
    </li>

</c:if>
    <li>
<button type="button" class="btn" onclick = "location.href='${pageContext.request.contextPath}/Member/Belecture/beLecture.jsp'">지식 공유 참여</button>
</li>
</ul>
</header>
<!-- ========================================================================= -->

<body>

<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
    <div class="row w-100 pb-4 justify-content-center">
        <!-- 왼쪽 네비 -->
        <div class="col-2 d-flex justify-content-center">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <h5><b>강의자 메뉴</b></h5>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" href="dashboard.jsp">대시보드</a>
                </li>
                <li class="list-group-item">
                    <a class="active-menu" href="lectureManager.jsp">강의 관리</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" href="salesView.jsp">매출 조회</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" href="roadmapManager.jsp">로드맵 관리</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" href="chatView.jsp">채팅방 조회</a>
                </li>
            </ul>
        </div>

        <!-- 중앙 위 내용 - 글내용 -->
        <div class="col-8 pl-3 gray-line">
			<div class="d-flex flex-row p-3 writeComments">
				<form method="post" class="w-100" action="${pageContext.request.contextPath}/updateLectureNews.do"> 
					<table class="table table-borderless">
						<thead>
							<tr>
								<th>
									<h2><b><input class="w-100 mx-auto border border-0" type="text" name="newsTitle" value="${vo.newsTitle }"></b></h2>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<textarea class="w-100 mx-auto" id="summernote" name="newsContent">${vo.newsContent }</textarea>
									<script>
										$('#summernote').summernote({
										   tabsize: 2,
										   height: 400,
										   lang : 'ko-KR',
										   callbacks: { // 콜백을 사용
										     // 이미지를 업로드할 경우 이벤트를 발생
										     onImageUpload: function(files, editor, welEditable) {
										       sendFile(files[0], this);
										     }
										   }
										 });
										    
										function sendFile(file, editor) {
										    // 파일 전송을 위한 폼생성
										    data = new FormData();
										    data.append("file", file);
										    $.ajax({ // ajax를 통해 파일 업로드 처리
										      data : data,
										      enctype: 'multipart/form-data',
										      type : "POST",
										      url : "${pageContext.request.contextPath}/uploadLecterNewsImage.do",
										      //cache : false,
										      contentType : false,
										      processData : false,
										      success : function(data) { // 처리가 성공할 경우
										        console.log("ajax 리턴받은 data : " + data);
										        // 에디터에 이미지 출력
										        $(editor).summernote('editor.insertImage', '${pageContext.request.contextPath}/filepath/' + data);
										      },
										      error: function(){
										        alert("실패~~");
										      }
										    });
										  }
									</script>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td>
									<div class="outer">
										<div class="button">
									 		<button type="submit" class="btn btn-success">작성</button>
									 		<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/getLectureNews.do?boardNo=${vo.boardNo }'">취소</button>
									 		<input type="hidden" class="btn btn-dark" name="boardNo" value="${vo.boardNo }">
									 		<input type="hidden" class="btn btn-dark" name="lectureNo" value="${vo.lectureNo }">
									 	</div>
							 		</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
				<br>
			</div>
        </div>
        <div class="col-2 d-flex justify-content-center">
        </div>
    </div>
</div>

<%@include file="/Common/footer.jsp" %>
</body>
</html>
