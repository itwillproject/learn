<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<head>
  <title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  </style>
</head>
<body>
<%@ include file="/Admin/common/adminHeader.jspf" %>
<br><br>
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>매출통계</h3>
      <p>...............................</p>
      <p>...............................</p>
    </div>
    <div class="col-sm-4">
      <h3>회원통계</h3>
      <p>...............................</p>
      <p>...............................</p>
    </div>
    <div class="col-sm-4">
      <h3>바로가기</h3>        
      <p>...............................</p>
      <p>...............................</p>
    </div>
  </div>
</div>

<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2>OUTPUTLEARN</h2>
      <h5>admin</h5>
      <div class="fakeimg">예시이미지1</div>
      <p>어쩌고저쩌고</p>
      <p>...............................</p>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>OUTPUTLEARN</h2>
      <h5>admin</h5>
      <div class="fakeimg">예시이미지2</div>
      <p>어쩌고저쩌고</p>
      <p>...............................</p>
      <br>
    </div>
  </div>
</div>

<%@ include file="/Common/footer.jsp" %>
</body>
</html>
