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
    <title>강의자 페이지 - 매출 조회</title>
</head>
<style>
  .active-menu {
    color: #1dc078;
    font-weight: bold;
  }
  .norm-menu {
    color: black;
  }
  .tape {
    height: 70px;
    margin: 50px auto;
    padding-top: 15px;
    color: white;
  }
  .active-btn {
    color: #fff;
    background-color: #00C471;
    border-style: none;
    padding: 5px;
    border-radius: 5px;
    margin-right: 5px;
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
</style>
<body>
<%@include file="/Common/header.jsp" %>
<div class="container-fluid bg-dark">
    <div class="container tape">
        <section class="tapeContent">
            <h2>매출 조회</h2>
        </section>
    </div>
</div>
<div class="container-fluid mt-5 pb-3 d-flex justify-content-center">
    <div class="row w-100 pb-4 justify-content-center">
        <!-- 왼쪽 네비 -->
        <div class="col-2 d-flex justify-content-center">
            <%@ include file="sidebar.jspf"%>
        </div>
        <script>
          var menu = $('#salesView');
          console.log(menu);
          menu.removeClass('norm-menu');
          menu.addClass('active-menu');
        </script>

        <!-- 중앙 위 내용 - 글내용 -->
        <div class="col-8 pl-3 gray-line">
            <table>
                <tr>
                    <th>등록건수</th>
                    <td style="text-align: right">${fn:length(salesList)} (건)</td>
                </tr>
                <tr>
                    <th>총액</th>
                    <td style="text-align: right">${lectureSales} (원)</td>
                </tr>
            </table>
                <form id="saveExcel" method="post" action="${pageContext.request.contextPath}/Teacher/saveAllExcel.do">
                    <input type="hidden" id="numStr" name="numStr">
                    <input type="hidden" id="titleStr" name="titleStr">
                    <input type="hidden" id="priceStr" name="priceStr">
                </form>
            <button class="active-btn float-right mb-3" type="button" onclick="saveExcel()">엑셀파일로 저장</button>
            <script>
              let num = '';
              let title = '';
              let price = '';

                function saveExcel() {
                  console.log(num + " " + title + " " + price);
                  $('#numStr').val(num);
                  $('#titleStr').val(title);
                  $('#priceStr').val(price);
                  $('#saveExcel').submit();
                }
            </script>
            <table class="table mt-4">
                <thead>
                <tr>
                    <th style="width: 10%">강의ID</th>
                    <th style="width: 65%">강의명</th>
                    <th style="width: 10%">총수익</th>
                    <th style="width: 15%"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${salesList}" var="sales">
                    <tr>
                        <td>${sales.lectureNo}</td>
                        <td>
                            <a href="#">${sales.lectureTitle}</a>
                        </td>
                        <td style="text-align: right">${sales.lecturePrice}원</td>
                        <td class="pr-0" style="text-align: right">
                            <button class="active-btn" onclick="location.href='salesLectureView.do?lectureNo=${sales.lectureNo}'">자세히 알아보기</button>
                        </td>
                    </tr>
                    <script>
                        num = num + '${sales.lectureNo}' + '/';
                        title = title + '${sales.lectureTitle}' + '/';
                        price = price + '${sales.lecturePrice}' + '/';
                    </script>
                </c:forEach>
                </tbody>
            </table>
            <div class="pt-4">
                <ul class="pagination justify-content-center">
                    <!-- 이전 -->
                    <li class="page-item">
                        <c:if test="${pvo.beginPage == 1 }">
                            <a class="page-link disabled">이전</a>
                        </c:if>
                        <c:if test="${pvo.beginPage != 1 }">
                            <a class="page-link" href="${pageContext.request.contextPath}/Teacher/salesView.do?cPage=${pvo.beginPage - 1 }">이전</a>
                        </c:if>
                    </li>
                    <!-- 페이지 번호 -->
                    <c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
                        <c:if test="${pageNo == pvo.nowPage }">
                            <li class="page-item active">
                                <a class="page-link">${pageNo }</a>
                            </li>
                        </c:if>
                        <c:if test="${pageNo != pvo.nowPage }">
                            <li class="page-item">
                                <a class="page-link" href="${pageContext.request.contextPath}/Teacher/salesView.do?cPage=${pageNo }">${pageNo }</a>
                            </li>
                        </c:if>
                    </c:forEach>
                    <!-- 다음 -->
                    <li class="page-item">
                        <c:if test="${pvo.endPage < pvo.totalPage }">
                            <a class="page-link" href="${pageContext.request.contextPath}/Teacher/salesView.do?cPage=${pvo.endPage + 1 }">다음</a>
                        </c:if>
                        <c:if test="${pvo.endPage >= pvo.totalPage }">
                            <a class="page-link disabled">다음</a>
                        </c:if>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-2 d-flex justify-content-center">
        </div>
        </div>
    </div>
</div>
<%@include file="/Common/footer.jsp" %>
</body>
</html>