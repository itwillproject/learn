<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="${pageContext.request.contextPath}/summernote/summernote-bs4.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/summernote/summernote-bs4.js"></script>
    <title>강의자  - 강의 관리</title>
</head>
<style>
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
  .light-btn {
    color: black;
    background-color: #f8f9fa;
    padding: 5px;
    border: 1px solid #f5f5f5;
    border-radius: 5px;
    margin-right: 5px;
  }
  .tape {
    height: 70px;
    margin: 50px auto;
    padding-top: 15px;
    color: white;
  }
  .pagination > li > a
  {
    background-color: white;
    color: #1dc078;
  }

  .pagination > li > a:focus,
  .pagination > li > a:hover,
  .pagination > li > span:focus,
  .pagination > li > span:hover
  {
    color: #5a5a5a;
    background-color: #eee;
    border-color: #ddd;
  }

  .pagination > .active > a
  {
    color: white;
    background-color: #00C471 !Important;
    border: solid 1px #00C471 !Important;
  }

  .pagination > .active > a:hover
  {
    background-color: #00C471 !Important;
    border: solid 1px #00C471;
  }

  .tab-pane h3 {
    font-weight: bold;
    padding-bottom: 15px;
  }

  .tab-pane label {
    padding-bottom: 10px;
  }
</style>
<body>
${lecture}
${classList}
<%@include file="/Common/header.jsp" %>
<div class="container-fluid bg-dark">
    <div class="container tape">
        <section class="tapeContent">
            <h2>강의 추가</h2>
        </section>
    </div>
</div>
<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
    <div class="row w-100 pb-4 justify-content-center">
        <!-- 왼쪽 네비 -->
        <div class="col-2 d-flex justify-content-center">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <h5><b>강의 추가</b></h5>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" data-toggle="tab" href="#info">강의정보</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" data-toggle="tab" href="#detail">상세소개</a>
                </li>
                <li class="list-group-item" id="curriMenu">
                    <a class="norm-menu" data-toggle="tab" href="#curriculum">커리큘럼</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" data-toggle="tab" href="#coverimg">커버 이미지</a>
                </li>
                <li class="list-group-item">
                    <a class="norm-menu" data-toggle="tab" href="#setting">강의설정</a>
                    <div class="pt-3">
                        <button type="button" class="active-btn w-100" id="submitBtn">제출하기</button>
                        <script>
                            $('#submitBtn').click(function () {
                              // 수업 섹션
                              let lectureSection = '';
                              $('.lectureSection').each(function () {
                                lectureSection = lectureSection + $(this).val() + '/';
                              });

                              console.log($('#lectureSaledue').val());

                              // 수업 먼저 생성한 후에 lectureNo 받아오기
                              data = new FormData();
                              data.append("categoryName", $('#categoryName').val());
                              data.append("lectureTitle", $('#lectureTitle').val());
                              data.append("lectureDue", $('#lectureDue').val());
                              data.append("lectureLevel", $('#lectureLevel').val());
                              data.append("lectureContent", $('#lectureContent').val());
                              data.append("lectureSummary", $('#lectureSummary').val());
                              data.append("lectureSalerate", $('#lectureSalerate').val());
                              data.append("lectureSaledue", $('#lectureSaledue').val());
                              data.append("lecturePrice", $('#lecturePrice').val());
                              data.append("lectureOnOff", $('#lectureOnOff').val());
                              data.append("lectureSection", lectureSection.slice(0, -1));

                              $.ajax({ // ajax를 통해 파일 업로드 처리
                                data : data,
                                type : "POST",
                                url : "${pageContext.request.contextPath}/Teacher/addLecture.do",
                                cache : false,
                                contentType : false,
                                processData : false,
                                success : function(lectureNo) { // 처리가 성공할 경우
                                  for(let i = 1; i <= secNum; i++) {
                                    let hello = $("div[id^='sn"+ i +"']");
                                    if(hello.length !== 0) {
                                      hello.each(function(){
                                        let cls = $(this).attr('id');
                                        classData = new FormData();
                                        classData.append("sectionNo", i);
                                        classData.append("lectureNo", lectureNo);
                                        classData.append("categoryName", $('#categoryName').val());
                                        classData.append("className", $(this).children('.col-9').children('.className:eq(0)').val());
                                        classData.append("preview", $('#' + cls.substring(cls.indexOf('class'))).children('div:eq(1)').children('input').val());

                                        $.ajax({
                                          data : classData,
                                          type : "POST",
                                          url : "${pageContext.request.contextPath}/Teacher/addClass.do",
                                          cache : false,
                                          contentType : false,
                                          processData : false,
                                          error: function () {
                                            alert("실패...");
                                          }
                                        })
                                      });
                                    }
                                  }
                                  location.href='${pageContext.request.contextPath}/Teacher/lectureManager.do';
                                },
                                error: function(){
                                  alert("실패~~");
                                }
                              });

                            });
                        </script>
                    </div>
                </li>
            </ul>
        </div>
        <script>
          var menu = $('#lectureManager');
          console.log(menu);
          menu.removeClass('norm-menu');
          menu.addClass('active-menu');
        </script>

        <!-- 중앙 위 내용 - 글내용 -->
        <div class="col-8 pl-3 gray-line">
            <button type="button" onclick="location.href='${pageContext.request.contextPath}/Teacher/lectureManager.do'" class="active-btn mb-2">강의 관리로</button>
            <form method="post" enctype="multipart/form-data">
                <div class="tab-content">
                    <div class="tab-pane container active border mt-2 p-5" id="info">
                        <h3>강의정보</h3>
                        <div>
                            <label>
                                <h6>강의제목</h6>
                                <input type="text" class="form-control" style="width: 700px" id="lectureTitle">
                            </label>
                        </div>
                        <div>
                            <label>
                                <h6>온/오프라인</h6>
                                <button type='button' class="active-btn light-btn" id="on" onclick="changeOnOff(0)">온라인</button>
                                <button type='button' class="active-btn light-btn" id="off" onclick="changeOnOff(1)">오프라인</button>
                                <input type="hidden" id="lectureOnOff">
                                <script>
                                    function changeOnOff(num) {
                                      if(num === 0) { // 온라인
                                        $('#on').removeClass('light-btn');
                                        $('#off').addClass('light-btn');
                                        $('#lectureOnOff').val(0);
                                        $('#curriMenu').css('display', '');
                                      } else { // 오프라인
                                        $('#on').addClass('light-btn');
                                        $('#off').removeClass('light-btn');
                                        $('#lectureOnOff').val(1);
                                        $('#curriMenu').css('display', 'none');
                                      }
                                    }
                                </script>
                            </label>
                        </div>
                        <div>
                            <label>
                                <h6>카테고리</h6>
                                <c:forEach items="${categories}" var="cat" varStatus="status">
                                    <button type='button' class="active-btn light-btn"
                                            id="cat${status.index}"
                                            onclick="changeCat(${status.index})">
                                            ${cat.categoryName}
                                    </button>
                                </c:forEach>
                                <input type="hidden" id="categoryName">
                                <script>
                                    function changeCat(num) {
                                      <c:forEach items="${categories}" var="cat" varStatus="status">
                                      if('${status.index}' === String(num)) {
                                        $('#cat${status.index}').removeClass('light-btn');
                                        $('#categoryName').val('${cat.categoryName}');
                                      } else {
                                        $('#cat${status.index}').addClass('light-btn');
                                      }
                                      </c:forEach>
                                    }
                                </script>
                            </label>
                        </div>
                        <div>
                            <label>
                                <h6>강의수준</h6>
                                <button type='button' class="active-btn light-btn" id="lv1" onclick="changeLevel(1)">입문</button>
                                <button type='button' class="active-btn light-btn" id="lv2" onclick="changeLevel(2)">초급</button>
                                <button type='button' class="active-btn light-btn" id="lv3" onclick="changeLevel(3)">중급이상</button>
                                <input type="hidden" id="lectureLevel">
                                <script>
                                  function changeLevel(num) {
                                    let lv1 = $('#lv1');
                                    let lv2 = $('#lv2');
                                    let lv3 = $('#lv3');
                                    let level = $('#lectureLevel');

                                    switch (num) {
                                      case 1:
                                        lv1.removeClass('light-btn');
                                        lv2.addClass('light-btn');
                                        lv3.addClass('light-btn');
                                        level.val('입문');
                                        break;
                                      case 2:
                                        lv1.addClass('light-btn');
                                        lv2.removeClass('light-btn');
                                        lv3.addClass('light-btn');
                                        level.val('초급');
                                        break;
                                      case 3:
                                        lv1.addClass('light-btn');
                                        lv2.addClass('light-btn');
                                        lv3.removeClass('light-btn');
                                        level.val('중급이상');
                                        break;
                                    }
                                  }
                                </script>
                            </label>
                        </div>
                    </div>
                    <div class="tab-pane container fade border mt-2 p-5" id="detail">
                        <h3>상세소개</h3>
                        <label>
                            <h6>강의 두줄 요약
                                <span style="color: red">(해당 내용은 강의리스트와 강의소개 상단에 보여집니다.)</span>
                            </h6>
                            <textarea class="form-control" style="width: 900px" id="lectureSummary"></textarea>
                        </label>
                        <label>
                            <h6>강의 상세 내용
                                <span style="color: red">(해당 내용은 강의소개에서 보여집니다.)</span>
                            </h6>
                            <textarea class="form-control" id="lectureContent">
                                주제 소개, 왜 배워야 하는지, 이 강의에서 배우는 것들, 강의 특징, 섹션마다 간단한 소개 등 작성
                            </textarea>
                            <script>
                              $('#lectureContent').summernote({
                                tabsize: 2,
                                width: 900,
                                height: 500,
                                callbacks: { // 콜백을 사용
                                  // 이미지를 업로드할 경우 이벤트를 발생
                                  onImageUpload: function(files) {
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
                                  type : "POST",
                                  url : "${pageContext.request.contextPath}/Teacher/uploadImage.do",
                                  cache : false,
                                  contentType : false,
                                  processData : false,
                                  success : function(url) { // 처리가 성공할 경우
                                    console.log(url);
                                    // 에디터에 이미지 출력
                                    $(editor).summernote('editor.insertImage',
                                        '${pageContext.request.contextPath}/filepath/' + url);
                                  },
                                  error: function(){
                                    alert("실패~~");
                                  }
                                });
                              }
                            </script>
                        </label>
                    </div>
                    <div class="tab-pane container fade border mt-2 p-5" id="curriculum">
                        <h3>커리큘럼</h3>
                        <button type="button" onclick="addSection()" class="active-btn">섹션 추가</button>
                        <script>
                            let secNum = 1;
                            function addSection() {
                              let dispHtml = '<div id="s' + secNum + '" class="border p-3 mb-3 section">';
                              dispHtml += '<div class="pb-4 form-inline row">';
                              dispHtml += '<div class="col-1" style="font-weight: bold;">섹션 : </div>';
                              dispHtml += '<div class="col-9"><input type="text" class="form-control w-100 lectureSection"/></div>';
                              dispHtml += '<div class="col-2">';
                              dispHtml += '<button type="button" class="btn btn-sm btn-link addClass">수업 추가</button>';
                              dispHtml += '<button type="button" class="btn btn-sm btn-danger removeSection">삭제</button>';
                              dispHtml += '</div>';
                              dispHtml += '</div>';
                              dispHtml += '</div>';
                              $('#class').append(dispHtml);
                              secNum++;
                            }

                            $(document).on('click', '.removeSection', function() {
                              $(this).parents('div:eq(2)').remove();
                            });

                            let clsNum = 1;
                            $(document).on('click', '.addClass', function() {
                              let dispHtml = '<div class="border p-3 mb-2 form-inline" id="sn'+ $(this).parents('div:eq(2)').attr('id').substring(1) +'class'+ clsNum +'">';
                              dispHtml += '<div class="col-1" style="padding-left: 0">수업 :</div>';
                              dispHtml += '<div class="col-9"><input type="text" class="form-control w-100 className"/></div>';
                              dispHtml += '<div class="col-2 text-right">';
                              dispHtml += '<button type="button" class="btn btn-sm btn-primary mr-2" data-toggle="collapse" data-target="#class' + clsNum + '">상세</button>';
                              dispHtml += '<button type="button" class="btn btn-sm btn-danger removeClass">삭제</button>';
                              dispHtml += '</div>';
                              dispHtml += '<div id="class'+ clsNum + '" class="w-100 collapse border p-3 mt-3 ml-1">';
                              dispHtml += '<div><input type="file" class="uploadVideo" id="uploadVideo'+ clsNum + '" style="display:none;" accept="video/mp4, video/mkv"/>';
                              dispHtml += '<label class="active-btn" for="uploadVideo'+ clsNum + '" style="padding-bottom: 5px; margin-bottom: 10px">영상 업로드</label>';
                              dispHtml += '<span class="border" style="border-radius: 5px; padding: 5px;">';
                              dispHtml += '<i class="fas fa-image" style="color: #00C471"></i>';
                              dispHtml += '<a class="preview">동영상(mp4, mkv 파일만 가능)</a>';
                              dispHtml += '</span></div>';
                              dispHtml += '<div class="pb-4 pt-4"><h6>무료 공개 여부</h6>';
                              dispHtml += '<button type="button" class="active-btn light-btn openBtn">공개</button>';
                              dispHtml += '<button type="button" class="active-btn light-btn closeBtn">비공개</button>';
                              dispHtml += '<input type="hidden" class="preview"></div>';
                              dispHtml += '<div><input type="file" class="uploadBook" id="uploadBook'+ clsNum + '" style="display:none;" accept="application/pdf"/>';
                              dispHtml += '<label class="active-btn" for="uploadBook'+ clsNum + '" style="padding-bottom: 5px; margin-bottom: 10px">자료파일 업로드</label>';
                              dispHtml += '<span class="border" style="border-radius: 5px; padding: 5px;">';
                              dispHtml += '<i class="fas fa-image" style="color: #00C471"></i>';
                              dispHtml += '<a class="preview">자료파일(pdf 파일만 가능)</a>';
                              dispHtml += '</span></div>';
                              dispHtml += '</div>';
                              dispHtml += '</div>';
                              $(this).parents('div:eq(2)').append(dispHtml);
                              clsNum++;
                            });

                            $(document).on('click', '.removeClass', function() {
                              $(this).parents('div:eq(1)').remove();
                            });

                            $(document).on('change', '.uploadVideo', function() {
                              let file = $(this).val().substring(12);
                              let preview = $(this).parent('div').children('span').children('a');
                              console.log(preview);
                              preview.html(file);
                              preview.removeAttr('href');
                            });

                            $(document).on('click', '.openBtn', function() {
                              $(this).removeClass('light-btn');
                              $(this).parent('div').children('button:eq(1)').addClass('light-btn');
                              $(this).parent('div').children('input').val('0');
                            });

                            $(document).on('click', '.closeBtn', function() {
                              $(this).removeClass('light-btn');
                              $(this).parent('div').children('button:eq(0)').addClass('light-btn');
                              $(this).parent('div').children('input').val('1');
                            });

                        </script>
                        <div id="class" class="pt-3">
                        </div>
                    </div>
                    <div class="tab-pane container fade border mt-2 p-5" id="coverimg">
                        <h3>커버 이미지</h3>
                        <div class="p-4" style="background-color: #f5f5f5">
                            <b>커버 이미지 - 썸네일 등록</b><br>
                            강의 커버 이미지(썸네일)을 직접 제작하실 경우, 이미지 규정에 맞춰 주세요.<br>
                            이미지가 규정에 맞지 않을 경우, 운영팀 판단하에 임의로 변경될 수 있습니다.
                        </div>
                        <div class="row pt-3">
                            <div class="col-5 text-center">
                                <img width="400px" alt="lectureCoverimg" src="https://blog.kakaocdn.net/dn/PUn3J/btqCvx1gkCr/IiQ89PF6VfFqqDw3wFmpH1/img.png"/>
                            </div>
                            <div class="col-7">
                                <br><br>
                                <h5><b>강의를 대표하는 이미지</b></h5>
                                <ul>
                                    <li>확장자: jpg, jpeg, png</li>
                                    <li>폰트, 사진, 일러스트 저작권 확인</li>
                                    <li>페이스북 텍스트 오버레이 페널티 확인</li>
                                </ul>
                                <input type="file" id="lectureCoverimg" style="display:none;" accept="image/gif, image/jpeg, image/png"/>
                                <label class="active-btn" for="lectureCoverimg" style="border-radius: 5px 0 0 5px; margin-right: -4px">업로드</label>
                                <span class="border" style="border-radius: 0 5px 5px 0; padding: 5px 5px 11px 5px;">
                                    <i class="fas fa-image" style="color: #00C471"></i>
                                    <a class="filePreview">이미지</a>
                                </span>
                                <script>
                                  $('#lectureCoverimg').change(function() {
                                    let file = $(this).val().substring(12);
                                    let filePreview = $('.filePreview');
                                    filePreview.html(file);
                                    filePreview.removeAttr('href');
                                  });
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane container fade border mt-2 p-5" id="setting">
                        <h3>강의설정</h3>
                        <div>
                            <label>
                                <h6>가격 설정
                                    <span style="color: red">(무료 강의는 '0'으로 입력해주세요.)</span>
                                </h6>
                                <input type="number" class="form-control" style="width: 700px" id="lecturePrice">
                            </label>
                        </div>
                        <div>
                            <h6>할인 설정
                                <span style="color: red">(할인률과 할인기한을 입력해주세요.)</span>
                            </h6>
                            <button type='button' class="active-btn light-btn" id="dc" onclick="setDiscount(1)">할인</button>
                            <button type='button' class="active-btn light-btn mb-2" id="notdc" onclick="setDiscount(0)">정가</button>
                            <input type="hidden" class="form-control mb-2" style="width: 700px"
                                   id="lectureSalerate" placeholder="할인률(%)">
                            <input type="hidden" class="form-control mb-2" style="width: 700px"
                                   id="lectureSaledue" placeholder="할인기한">
                            <script>
                              function setDiscount(num) {
                                let rate = $('#lectureSalerate');
                                let due = $('#lectureSaledue');

                                if(num === 0) { // 정가
                                  $('#dc').addClass('light-btn');
                                  $('#notdc').removeClass('light-btn');
                                  rate.prop('type', 'hidden');
                                  due.prop('type', 'hidden');
                                  rate.val(0);
                                } else { // 할인
                                  $('#dc').removeClass('light-btn');
                                  $('#notdc').addClass('light-btn');
                                  rate.prop('type', 'number');
                                  due.prop('type', 'date');
                                }
                              }
                            </script>
                        </div>
                        <div class="pt-2">
                            <label>
                                <h6>수강 기한
                                    <span style="color: red">(일수를 입력하세요.)</span>
                                </h6>
                                <button type='button' class="active-btn light-btn" id="free" onclick="setFree()">무제한</button>
                                <button type='button' class="active-btn light-btn mb-2" id="limit" onclick="setLimit()">제한</button>
                                <input type="hidden" class="form-control" style="width: 700px" id="lectureDue">
                                <script>
                                  function setFree() {
                                    let due = $('#lectureDue');
                                    $('#free').removeClass('light-btn');
                                    $('#limit').addClass('light-btn');
                                    due.prop('type', 'hidden');
                                    due.val(0);
                                  }

                                  function setLimit() {
                                    $('#free').addClass('light-btn');
                                    $('#limit').removeClass('light-btn');
                                    $('#lectureDue').prop('type', 'number');
                                  }
                                </script>
                            </label>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-2 d-flex justify-content-center">
        </div>
    </div>
</div>
<%@include file="/Common/footer.jsp" %>
</body>
</html>