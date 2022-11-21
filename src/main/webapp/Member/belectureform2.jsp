<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
	.container { margin: 0 auto;
 }
	#set { width:90%;
        margin:auto;
        display:block;}
</style>

</head>
<body>

<div class="container">

	<h2>감사합니다, 홍길동 님</h2>
	<h2>지식공유자가 되기 위해서</h2>
	<h2>아래 정보가 필요해요.</h2>
	<br>
	<form action="/action_page.php">
    <div class="form-group">
      <label for="email">인프런 계정</label>
      <input type="email" class="form-control" id="email"  name="email" value="test1234@gmail.com" readonly>
    </div>
    <div class="form-group">
      <label for="pwd">이름(실명)</label>
      <input type="text" class="form-control" id="name" placeholder="이름을 입력해주세요" name="name">
    </div>
  	 <div class="form-group">
      <label for="pwd">연락처</label>
      <input type="tel" class="form-control" id="phone" placeholder="연락처를 입력해주세요" name="phone">
    </div>
       <div class="form-group">
      <label for="text">희망분야</label>
      <input type="text" class="form-control" id="major" placeholder="희망분야를 입력해주세요" name="major">
    </div>
   
     <div class="form-group">
      <label for="text"> 나를 소개하는 글 *</label> 
      <textarea rows="10" cols="20" class="form-control" ></textarea>
    </div>
    
    <div class="form-group">
      <label for="text">나를 표현할 수 있는 링크</label>
     <input type="url" class="form-control" id="userurl" name="userurl" placeholder="test1234@gmail.com">
    </div>
    
    <button type="submit"  id="set" class="btn btn-success" onclick='self.close()'>제출</button>
  </form>
  
  
  
	
	
	</div>
</body>
</html>