<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문글작성폼</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Community/css/jyStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>

	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 300,                 // set editor height
				minHeight: null,             // set minimum height of editor
				maxHeight: null,             // set maximum height of editor
				focus: true,                  // set focus to editable area after initializing summernote
				callbacks: { // 콜백을 사용
				// 이미지를 업로드할 경우 이벤트를 발생
				onImageUpload: function(files, editor, welEditable) {
				sendFile(files[0], this);
				}
				}
			});
		});

		function sendFile(file, editor) {
		  // 파일 전송을 위한 폼생성
			data = new FormData();
			data.append("uploadFile", file);
		  	$.ajax({ // ajax를 통해 파일 업로드 처리
				data : data,
				type : "POST",
				url : "knowhowImageUpload.do", // controller
				cache : false,
				contentType : false,
				processData : false,
				success : function(data) { // 처리가 성공할 경우
				// 에디터에 이미지 출력
					$(editor).summernote('editor.insertImage', data.url);
				//$("#thumbnail").val(data.url); // 썸네일 설정
				}
			});
		}
		
		function registBoard(frm){
			frm.submit();
		}
		
		function cancelBoard(frm){
			if(confirm("정말 작성을 취소하시겠습니까??\n작성한 내용이 날아갑니다")){
				location.href = "${pageContext.request.contextPath}/memberBoard/getMyQBoardList.do";				
			}
		}
		
	</script>

</head>
<body>
	<%@include file="/Common/header.jsp" %>

<div>
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-sm-2">
				<p>-------왼쪽네비-------</p>
			</div>
			
			<div class="col-sm-6 align-content-center">
				
                <div class="d-flex flex-row p-3 writeComments">
                	<form action="${pageContext.request.contextPath}/memberBoard/qnaWriteForm.do" method="post" class="w-100">
                    <table class="table table-borderless">
                        <thead>
                            <tr>
                                <th><h2><b><input class="w-100 mx-auto border border-0" type="text" name="qnaTitle" placeholder="제목을 입력하세요"></b></h2></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><textarea class="w-100 mx-auto" id="summernote" name="qnaContent" placeholder="학습과 관련된 질문을 남겨주세요"></textarea></td>
                            </tr>
                            <tr>
                                <td class="d-flex flex-row justify-content-end">
                                	<input type="button" value="등록" onclick="registBoard(this.form)">
                                	<input type="button" value="취소" onclick="cancelBoard(this.form)">
                                
<!--                                     <button class="btn btn-success mr-3" onclick="registBoard()">등록</button> -->
<!--                                     <button class="btn btn-light mr-3">취소</button> -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
			</div>	

			<div class="col-sm-2">
				<p>------오른쪽네비--------</p>
			</div>
		</div>
	</div>
</div>

	<%@include file="/Common/footer.jsp" %>


</body>
</html>