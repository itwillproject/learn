<%@ page    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<<<<<<< HEAD
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
=======
   <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

>>>>>>> e29acca59ff7e87b89c92c423004f45395527cf0



   <style>
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
   
   </style>

   </head>

      <header>


  <div class="container">

  <ul class="nav">
    <li class="nav-item">
<div class="dropdown">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
      강의
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">개발 프로그래밍</a>
      <a class="dropdown-item" href="#">보안 네트워크</a>
      <a class="dropdown-item" href="#">데이터 사이언스</a>
    </div>
  </div>
</li>
   
    <li class="nav-item">

    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
      로드맵
    </button>

</li>
    <li class="nav-item">
 <div class="dropdown">
<button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
      커뮤니티
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="${pageContext.request.contextPath}/board/getQnaBoardList.do">질문 & 답변</a>
      <a class="dropdown-item" href="#">자유주제</a>
    </div>
    </div>
</li>
    <li class="nav-item">
    <div class="dropdown">
    <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
     인프런
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">수강평</a>
      <a class="dropdown-item" href="#">인프런 피드</a>
      <a class="dropdown-item" href="#">강의 기능요청</a>
    </div>
    </div>
    </li>
 <li>
<button type="button" class="btn" >
      <input type="text" id="search">
    </button>
</li>    
<li>
      <button type="button" class="btn" data-toggle="modal" data-target="#login">로그인</button> &nbsp;
    <div class="modal fade" id="login">
        <div class="modal-dialog modal-dialog-centered" style="width: 400px">
            <div class="modal-content align-items-center pb-3">
                <div class="w-100 pr-2 pb-4" style="float: right">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>
                <img style="width: 120px;" src="https://cdn.inflearn.com/public/files/pages/da35da48-52a5-4ec6-b8d3-0389a47610ec/logo1.png">
                <form action="login.do" method="post" class="w-100 pl-4 pr-4 pt-4">
                    <input type="email" class="form-control w-100 mb-3" id="userId" placeholder="이메일" name="userId">
                    <input type="password" class="form-control w-100 mb-4" id="userPwd" placeholder="비밀번호" name="userPwd">
                    <button type="submit" class="btn w-100" style="background-color: #00C471; color: white">로그인</button>
                </form>
                <div>
                    <a href="findId.jsp">아이디(이메일) 찾기</a> |
                    <a href="findPassword.jsp">비밀번호 찾기</a> |
                    <a href="newMember.jsp">회원가입</a>
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
                            callbackUrl: "http://localhost:8080/Member/naverLogin.jsp",
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
    <button type="button" class="btn btn-outline-danger" onclick="location.href='newMember.jsp'">회원가입</button>&nbsp;
    </li>
    <li>
<button type="button" class="btn" onclick = "location.href='howtobelecture.jsp'">지식 공유 참여</button>
</li>


</ul>
</div>






    </header>
