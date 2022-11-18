<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .active {
          font-weight: bold;
          text-decoration: underline;
        }
        .nav-link {
          color: black;
        }
        .active-btn {
          color: #fff;
          background-color: #00C471;
        }

    </style>
</head>
<body>
<div class="container mt-3">
    <h2>조회</h2>
    <div class="pb-2">
        <button type="button" class="btn btn-primary" onclick="location.href='login.jsp'">로그인 이동</button>
    </div>
    <div class="pb-3">
        <ul class="border nav p-1">
            <li class="nav-item">
                <a class="nav-link" href="#home">질문</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#menu1">자유주제</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active">문의글</a>
            </li>
        </ul>
    </div>
    <div class="border">
    <div class="pb-3">
        <ul class="nav pl-3 pt-3 pb-1">
            <li class="nav-item">
                <a class="nav-link btn btn-sm btn-light mr-1" href="#home">전체</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-sm btn-light mr-1" href="#menu1">해결</a>
            </li>
            <li class="nav-item">
                <a class="nav-link btn btn-sm btn-light mr-1 active-btn">미해결</a>
            </li>
        </ul>
    </div>
        <div class="pt-1 pl-4 pr-4">
            <h5><b> c++초간단한 예제 오류 질문드립니다.</b></h5>
            <span>숫자 두개를 입력받고, 두 숫자를 더하여 출력하는 코드를 짰습니다. 문제는 계속 값이 numberplus의 값이 1만 나옵니다."두 숫자의 합은 1 입니다." 어떤 수를 입력하든 계속 1이 나오네요..</span><br>
            <div class="pt-1">
                <span>김태훈</span>
                <span>1일 전</span>
            </div>
            <hr>
        </div>
        <div class="pt-1 pl-4 pr-4">
            <h5><b> c++초간단한 예제 오류 질문드립니다.</b></h5>
            <span>숫자 두개를 입력받고, 두 숫자를 더하여 출력하는 코드를 짰습니다. 문제는 계속 값이 numberplus의 값이 1만 나옵니다."두 숫자의 합은 1 입니다." 어떤 수를 입력하든 계속 1이 나오네요..</span><br>
            <div class="pt-1">
                <span>김태훈</span>
                <span>1일 전</span>
            </div>
            <hr>
        </div>
    </div>
</div>
</body>
</html>
