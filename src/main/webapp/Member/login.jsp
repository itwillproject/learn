<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-3">
    <h2>테스트</h2>
    <div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">로그인</button>
        <button type="button" class="btn btn-primary" onclick="location.href='inquiry.jsp'">조회</button>
    </div>
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-dialog-centered" style="width: 400px">
            <div class="modal-content align-items-center pb-3">
                <div class="w-100 pr-2 pb-4" style="float: right">
                    <button type="button" class="close" data-dismiss="modal">x</button>
                </div>
                    <img style="width: 120px;" src="https://cdn.inflearn.com/public/files/pages/da35da48-52a5-4ec6-b8d3-0389a47610ec/logo1.png">
                    <form class="w-100 pl-4 pr-4 pt-4">
                        <input type="email" class="form-control w-100 mb-3" id="userId" placeholder="이메일" name="userId">
                        <input type="password" class="form-control w-100 mb-4" id="userPwd" placeholder="비밀번호" name="userPwd">
                        <button type="submit" class="btn w-100" style="background-color: #00C471; color: white">로그인</button>
                    </form>
                   <div>
                       <a>아이디(이메일) 찾기</a> |
                       <a>비밀번호 찾기</a> |
                       <a>회원가입</a>
                   </div>
                <hr class="w-100">
                    <span class="pb-1">간편 로그인<br></span>
                    <div class="row">
                        <div class="col-6">
                            <img style="width: 40px; height: 40px; background-color: #fae500;" src="https://www.cellbiodx.com/Content/img/svg/kakaotalk.svg"/>
                        </div>
                        <div class="col-6">
                            <div style="width: 40px; height: 40px; background-color: #f8f8f8;">
                                <img style="margin:10px; width: 20px; height: 20px; background-color: #f8f8f8;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/24px-Google_%22G%22_Logo.svg.png?20210618182606"/>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
