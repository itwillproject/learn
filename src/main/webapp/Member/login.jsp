<%--
  Created by IntelliJ IDEA.
  User: itwill
  Date: 2022-11-21
  Time: 오전 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body>
<div class="container mt-3">
    <div style="width: 450px;margin:auto">
        <div class="text-center">
            <h5>로그인</h5>
            <span>인프런 계정으로 로그인 할 수 있어요.</span>
        </div>
        <form action="login.do" method="post" class="w-100 pl-4 pr-4 pt-4">
            <input type="email" class="form-control w-100 mb-3" id="userId" placeholder="이메일" name="userId">
            <input type="password" class="form-control w-100 mb-4" id="userPwd" placeholder="비밀번호" name="userPwd">
            <button type="submit" class="btn w-100" style="background-color: #00C471; color: white">로그인</button>
        </form>
        <div class="text-center">
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
                    callbackUrl: "http://localhost:8080/learn/Member/naverLogin.jsp",
                    isPopup: false,
                    loginButton: {color: "green", type: 1, height: 40}
                  }
              );
              naverLogin.init();
            </script>
            <div id="g_id_onload"
                 data-client_id="932637000454-djioa17of7es3sepu6i5h271k51kmgr1"
                 data-login_uri="http://localhost:8080/learn/Member/googleLogin.jsp"
                 data-auto_prompt="false">
            </div>
            <div class="g_id_signin"
                 data-type="icon"
                 data-size="large"
                 data-theme="outline"
                 data-text="sign_in_with"
                 data-shape="rectangular"
                 data-logo_alignment="left">
            </div>
        </div>
    </div>
    <%@include file="/Common/footer.jsp" %>
</div>
</body>
</html>
