<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/80bed6a544.js" crossorigin="anonymous"></script>
<style>
	html, body {
		height: 100%;
	}
	
	.tape {
		height: 100px;
		margin: 50px auto;
		padding-top: 15px;
		color: white;
	}
	
	.sidebar-nav li a:hover {
		text-decoration: none;
		background: #d3d3d3;
	}
	

	.card .info {
	  color: #fff;
	  position: absolute; left: 0; bottom: 0;
	  background: rgba(0,0,0,0.8);
	  width: 100%;
	  height: 100%;
	  padding: 15px;
	  opacity: 0;
	  transition: opacity 0.35s ease-in-out;
	}
	
	.card:hover .info {
	  opacity: 1;
	}
	
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating a {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating a:first-child {margin-left:0;}
	.star_rating a.on {color:#777;}

	
</style>
<script>

	$(function(){
		
		var array = [];
	
		$.ajax("${pageContext.request.contextPath }/lecture/getLectureAll.do", {
			
	        type : "post",
	        dataType: "json",
	        success : function(data){
	            
	        	//alert("성공");
	        	console.log(data);
	        	
	        	
	        	if (data.length == 0) {
	        		
	        		console.log("오프라인 강의 없음");
	        		
	            } else {
	            	
	            	//alert(data.length);
					
	            	$.each(data, function(index, obj){

	        			geocoder.addressSearch(obj.lecturePastAddress, function(result, status) {

	        			    // 정상적으로 검색이 완료됐으면 
	        			     if (status === kakao.maps.services.Status.OK) {

	        			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        			        // 결과값으로 받은 위치를 마커로 표시합니다
	        			        var marker = new kakao.maps.Marker({
	        			            map: map,
	        			            position: coords,
	        			        });

	        			        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        			        var infowindow = new kakao.maps.InfoWindow({
	        			            content: '<div style="padding:5px; width:200px;"><small><b>'+obj.lectureTitle+'</b></small><br><a href="${pageContext.request.contextPath}/Member/getLecture.do?lectureNo='+obj.lectureNo+'" style="text-decoration:none; font-weight-bold;" target="_blank">상세정보보기</a></div>',
	        			            removable : true
	        			        });
								
	        			        array.push(infowindow);
	        			        console.log("array 사이즈: " + array.length);
	        			        
	            			    kakao.maps.event.addListener(marker, 'click', function(){
	        	   			    	map.setCenter(new kakao.maps.LatLng(result[0].y, result[0].x));     			       
	            			    	closeInfoWindow();
	        	   			    	infowindow.open(map, marker); 
	           			    	});

	        			    } 
	                    	
	        			});
	            	});

	            }

	        },
	        error: function(){
	            alert("실패");
	        }
	   });
		 
		
    	function closeInfoWindow() {
    	    for(var idx=0; idx<array.length; idx++){
    	        array[idx].close();
    	    }
    	}
    	
		
		$(document).on("click", ".page-link", function () {
			ajaxProcess("${pageContext.request.contextPath }/lecture/getLecturesFiltering.do", $(this).attr('value'));
		});
		 
		$(document).on("change", "#filter", function () {
			ajaxProcess ("${pageContext.request.contextPath }/lecture/getLecturesFiltering.do", $("#nowPage").text());        
		});
			
			$(document).on("click", "#search-button", function () {
			ajaxProcess ("${pageContext.request.contextPath }/lecture/getLecturesFiltering.do", $("#nowPage").text());        				
		});
		 	
			
		$(document).on("change", "#city", function () {

			var province = document.getElementById("province").value;
			var state = document.getElementById("state").value;
			var city = document.getElementById("city").value;
			var address = province + " " + state + " " + city;
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address, function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 

			ajaxProcess ("${pageContext.request.contextPath }/lecture/getLecturesFiltering.do", $("#nowPage").text());      
	
		})
	
	 })

	function categoryChange(e) {
		const seoul = ["강남구","마포구","서대문구"];
	
		const state = document.getElementById("state");
		
		if (e.value == '서울') {
			add = seoul;	
		}
	
		state.options.length = 1;
		// 군/구 갯수;
	
		for (property in add) {
			//console.log(add.indexOf(add[property]));
			let opt = document.createElement("option");
			opt.value = add[property];
			opt.innerHTML = add[property];
			state.appendChild(opt);
		}
	}
		
	
	
	function stateChange(e) {;
	 
		const gangnam = ["논현동","삼성동","역삼동"];
		const mapo = ["서교동","연남동","합정동"];
		const seodaemun = ["신촌동"];
		
		const city = document.getElementById("city");
	
		if (e.value == '강남구') {
			add = gangnam;	
		} else if (e.value == '마포구'){
			add = mapo;
		} else {
			add = seodaemun;
		}
		
		city.options.length = 1;
		// 군/구 갯수;
	
		for (property in add) {
			//console.log(add.indexOf(add[property]));
			let opt = document.createElement("option");
			opt.value = add[property];
			opt.innerHTML = add[property];
			city.appendChild(opt);
		}
	
	}

	 
	function ajaxProcess (url, page) {
		
		var province = document.getElementById("province").value;
		var state = document.getElementById("state").value;
		var city = document.getElementById("city").value;
		var address = $.trim(province + " " + state + " " + city);
		
	 	var find = {};
	 	find.onoff = 'off';
	 	find.searchKeyword = $.trim($("#searchRoadmap").val());
	 	find.orderKeyword = $("#filter").val();
	 	find.categoryName = "${categoryName }";
	 	find.page = page;
		find.address = address;
	 	
	 	console.log(JSON.stringify(find));
	 	//alert();
	 	
		$.ajax(url, {
			
	        type : "post",
	        data : JSON.stringify(find),
	        contentType : "application/json",
	        dataType: "json",
	        success : function(data){
	            
	        	//alert("성공");
	
	            var dispHTML = "";
	
	            if (data.list.length == 0) {
					$("#lecturesDefault").html("데이터가 없습니다.");
	            } else {
	            	
	            	$.each(data.list, function(index, obj){
			            console.log(obj);
			            
			            dispHTML += '';
			            dispHTML += '<div class="col-4 card course course_card_item border-0 mb-5" style="height:380px;">';
			            dispHTML += '<div class="card h-100 border-0">';
			            dispHTML += '<div class="card-image h-50">';
			            dispHTML += '<img class="card-img-top" src="${pageContext.request.contextPath}/filepath/'+this.lectureCoverimg+'" width="100%" alt="'+this.lectureTitle+'">';
			            dispHTML += '</div>';
			            dispHTML += '<div class="card-body w-100 overflow-hidden">';
			            dispHTML += '<p class="card-title font-weight-bold" style="height:50px;">'+this.lectureTitle+'</a></p>';
			            dispHTML += '<span class="card-user font-weight-bold">'+this.lectureWriter+'</span>';	
			            dispHTML += '<br>';	
			            dispHTML += '<span>';
			            for (var i = 1; i <= Math.round(this.lectureRate); i++) {
				            dispHTML += '<i class="fa-solid fa-star" style="color: #fada5e;"></i>';					            	
			            }
			            for (var i = 1; i <= 5-(Math.round(this.lectureRate)); i++) {
				            dispHTML += '<i class="fa-regular fa-star" style="color: #fada5e;"></i>';					            	
			            }
			            dispHTML += '('+this.reviewCount+')';
			            dispHTML += '</span>';   
			            dispHTML += '<p class="card-price">';
			            if (this.lecturePrice != this.salePrice) {
				            dispHTML += '<del class="text-secondary">&#8361;'+this.lecturePrice+'</del>';        	
				            dispHTML += '<span class="text-primary font-weight-bold h5">&#8361;'+Math.round(this.salePrice)+'</span>';        	
			            } else {
				            dispHTML += '<span class="font-weight-bold h5">&#8361;'+this.lecturePrice+'</span>';			            	
			            }
			            dispHTML += '</p>';
			            dispHTML += '<a href="${pageContext.request.contextPath}/Member/getLecture.do?lectureNo='+this.lectureNo+'" class="stretched-link"></a>';
			            dispHTML += '<span class="badge badge-success">+'+this.studentCount+'명</span>';
			            dispHTML += '</div>';
			            
			            dispHTML += '<div class="info">';
			            dispHTML += '<div class="w-100 h-75 overflow-hidden">';
			            dispHTML += '<p class="font-weight-bold">'+this.lectureTitle+'</p>';
			            if (this.lectureContent.length > 100){
				            dispHTML += '<p>'+this.lectureContent.substring(0, 100)+'...</p>';
			            } else {
			            	dispHTML += '<p>'+this.lectureContent+'</p>';
			            }
		            	dispHTML += '</div>';
		            	dispHTML += '<div class="position-absolute bottom-0 w-100 h-15">';
		            	dispHTML += '<p class="text-info font-weight-bold">'+this.lectureLevel+'</p>';
		            	dispHTML += '<p class="text-info font-weight-bold">'+this.categoryName+'</p>';
		            	dispHTML += '</div>';
		            	dispHTML += '</div>';
		            	dispHTML += '</div>';
		            	dispHTML += '</div>';
		            	dispHTML += '</div>';	
	                });
	            	
	            	$("#lecturesDefault").html(dispHTML);
	            }
	            
	            var p = data.p;
	            var dispPage = '';
	           			            
	            dispPage += '<nav aria-label="Page navigation">';
	            dispPage += '<ul class="pagination justify-content-center">';
	            
				if (p.beginPage == 1) {
		            dispPage += '<li class="page-item disabled">';
		            dispPage += '<a class="page-link" href="#">《</a>';
		            dispPage += '</li>';	
		            
		            dispPage += '<li class="page-item disabled">';
		            dispPage += '<a class="page-link disabled" href="#">〈</a>';
		            dispPage += '</li>';	
				} else {
		            dispPage += '<li class="page-item">';
		            dispPage += '<a class="page-link" value="1">《</a>';
		            dispPage += '</li>';	
		            
		            dispPage += '<li class="page-item">';
		            dispPage += '<a class="page-link" value="'+(p.beginPage-1)+'">';
		            dispPage += '〈';
		            dispPage += '</a>';
		            dispPage += '</li>';
				}
	
			
				for (let i = p.beginPage; i <= p.endPage ; i++ ) {
					if (i == p.nowPage) {
			            dispPage += '<li class="page-item disabled">';
			            dispPage += '<a id="nowPage" class="page-link" href="#">'+i+'</a>';
			            dispPage += '</li>';
					} else {
			            dispPage += '<li class="page-item">';
			            dispPage += '<a class="page-link" value="'+i+'">'+i+'</a>';
			            dispPage += '</li>';
					}
				}
				
				if (p.endPage >= p.totalPage) {
		            dispPage += '<li class="page-item disabled">';
		            dispPage += '<a class="page-link" href="#">〉</a>';
		            dispPage += '</li>';
		            
		            dispPage += '<li class="page-item disabled">';
		            dispPage += '<a class="page-link" href="#">》</a>';
		            dispPage += '</li>';
				} else {
		            dispPage += '<li class="page-item">';
		            dispPage += '<a class="page-link" value="'+(p.endPage+1)+'">〉</a>';
		            dispPage += '</li>';
		            
		            dispPage += '<li class="page-item">';
		            dispPage += '<a class="page-link" value="'+p.totalPage+'">';
		            dispPage += '》</a>';
		            dispPage += '</li>';
				}
				
	
	            dispPage += '</ul>';
	            dispPage += '</nav>';
	
	            $("#pagingArea").html(dispPage);
	
	
	            
	        },
	        error: function(){
	            alert("실패");
	        }
	   });
	}
</script>
</head>
<body>
<%@include file="/Common/header.jsp" %>
<div class="container mt-5 pb-3d-flex">
	<div class="row w-100 my-3 pb-4">
		<div class="col-2 w-100 mx-auto">	
			<!-- 사이드 바 영역 -->
			<div class="mx-auto w-100">
				<nav class="w-100">
				  <ul class="navbar-nav sidebar-nav comNav border rounded">
					    <li class="nav-item d-flex justify-content-center p-2 w-100">
					      <a href="${pageContext.request.contextPath}/lecture/getOfflineLectureList.do?categoryNo=" class="text-dark">전체</a>
					    </li>
				  	<c:forEach var="category" items="${categories}">
					    <li class="nav-item d-flex justify-content-center p-2 border-top">
					      <a href="${pageContext.request.contextPath}/lecture/getOfflineLectureList.do?categoryNo=${category.categoryNo }" class="text-dark">${category.categoryName }</a>
					    </li>
					</c:forEach>
				  </ul>
				</nav>
			</div>
		</div>
		<div class="col-10 justify-content-center">
			<div class="search_boxes row">
	         <div class="search_box col-5">
	            <select id="province" onchange="categoryChange(this)">
	              <option value>시/도 선택</option>
	              <option value="서울">서울</option>
	            </select>
	            <select id="state" onchange="stateChange(this)">
	              <option value>군/구 선택</option>
	            </select>
	            <select id="city">
	              <option value>읍/면/동 선택</option>
	            </select>
	        </div>
         	<div class="col-7">
				<div class="w-50 input-group mx-auto float-right">
					<input type="search" id="searchRoadmap" placeholder="강의 검색하기" value=""
							class="form-control">
					<button id="search-button" type="button" class="btn btn-success">
					    <i class="fas fa-search"></i>
					</button>
				</div>
				<p class="clearfix"></p>
			</div>
          </div>
			<div id="map" class="my-3" style="width:100%;height:400px;">
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c14c918690aa2993cb9ba71ac431ed6c&libraries=services"></script>
			<script>
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					//center: new kakao.maps.LatLng(37.4953666908089, 127.03306536185), //지도의 중심좌표.
					center: new kakao.maps.LatLng(37.537183, 127.005454), //현재 위치.
					level: 3 //지도의 레벨(확대, 축소 정도)						
				};
				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴			
				var geocoder = new kakao.maps.services.Geocoder();
			</script>
			</div>
			<div class="w-100 row">
				<div class="col-10">
					<c:choose>
						<c:when test="${categoryName != null}">
							<h4>${categoryName }</h4>
						</c:when>
						<c:otherwise>
							<h4>전체</h4>						
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-2 form-group pr-0">
					<select id="filter"  name="filter" class="form-control w-100 float-right pr-0">
						<option value="student">학생수순</option>
						<option value="new" selected="selected">최신순</option>
						<option value="old">오래된순</option>
					</select>	
				</div>
			</div>
			<hr>
			<div class="w-100">
				<div id="lecturesDefault" class="row"> <!-- 강의 출력 div 시작 -->		
					<c:choose>
						<c:when test="${not empty lectures }">
							<c:forEach var="lecture" items="${lectures }">
							<div class="col-4 card course course_card_item border-0 mb-5" style="height:380px;">
								<div class="card h-100 border-0">
								  	<div class="card-image h-50">
										<img class="card-img-top" src="${pageContext.request.contextPath}/filepath/${lecture.lectureCoverimg }" width="100%" alt="${lecture.lectureTitle }">
								  	</div>
								  	<div class="card-body w-100 overflow-hidden">
									    <p class="card-title font-weight-bold" style="height:50px;">${lecture.lectureTitle }</a></p>								
										<span class="card-user font-weight-bold">${lecture.lectureWriter }</span>
										<br>
										<span>
											<c:forEach var="num" begin="1" end="${Math.round(lecture.lectureRate) }" step="1"> 
												<i class="fa-solid fa-star" style="color: #fada5e;"></i>
											</c:forEach>
											<c:forEach var="num" begin="1" end="${5 - Math.round(lecture.lectureRate) }" step="1">
												<i class="fa-regular fa-star" style="color: #fada5e;"></i>											
											</c:forEach>
											(${lecture.reviewCount })
										</span>
										<c:choose>
											<c:when test="${lecture.lecturePrice != lecture.salePrice}">
												<p class="card-price">	
													<del class="text-secondary">&#8361; ${lecture.lecturePrice }</del>
													<span class="text-primary font-weight-bold h5">&#8361; ${Math.round(lecture.salePrice) }</span>
												</p>
											</c:when>
											<c:otherwise>
												<p class="card-price">
													<span class="font-weight-bold h5">&#8361; ${lecture.lecturePrice }</span>
												</p>										
											</c:otherwise>
										</c:choose>
								      	<a href="${pageContext.request.contextPath}/Member/getLecture.do?lectureNo=${lecture.lectureNo }" class="stretched-link"></a>
								  		<span class="badge badge-success">+${lecture.studentCount }명</span>
								  	</div>
								    <div class="info">
									     <div class="w-100 h-75 overflow-hidden">
										      <p class="font-weight-bold">${lecture.lectureTitle }</p>
												<c:choose>
													<c:when test="${fn:length(lecture.lectureContent) gt 100}">
														<p>${fn:substring(lecture.lectureContent, 0, 100)}...</p>
													</c:when>
													<c:otherwise>
														<p>${lecture.lectureContent }</p>
													</c:otherwise>
												</c:choose>
									     </div>
									     <div class="position-absolute bottom-0 w-100 h-15">
										      <p class="text-info font-weight-bold">${lecture.lectureLevel }</p>
										      <p class="text-info font-weight-bold">${lecture.categoryName }</p>
									     </div>
								    </div>
								</div>
							</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							데이터가 없습니다.
						</c:otherwise>
					</c:choose>
				</div> <!-- 강의 출력 div 끝 -->
				<div id="pagingArea">
				 	<%@include file="/Lecture/paging.jspf" %>
				</div>		
			</div>
		</div>
	</div>
</div>

<%@include file="/Common/footer.jsp" %>
</body>
</html>