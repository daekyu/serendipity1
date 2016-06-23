<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<script type="text/javascript"
	src="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.css">
<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
	
</script>
<link rel="stylesheet" type="text/css"
	href=".././resources/js/sweetalert.css">
<script type="text/javascript"
	src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=${sessionScope.locale}"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<input type="hidden" id="lat" value="${boarddto.BOARD_LATITUDE}" />
<input type="hidden" id="lng" value="${boarddto.BOARD_LONGITUDE}" />
<input type="hidden" id="meeting_place"
	value="${boarddto.MEETING_PLACE}" />
<input type="hidden" id="meeting_address"
	value="${boarddto.MEETING_ADDRESS}" />
<script type="text/javascript">
	/* 	$(function(){
			$('#delete').click(function(){
				if(confirm("글을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/board/board_delete.htm?board_num=${dto.board_Num}&check=1";
				}else{
				    return false;
				}
			});
		}); */

	$(function() {
		$('#delete')
				.click(
						function() {

							swal(
									{
										title : "정말로 삭제하시겠습니까?",

										type : "warning",
										showCancelButton : true,
										confirmButtonColor : "#DD6B55",
										confirmButtonText : "삭제",
										cancelButtonText : "취소",
										closeOnConfirm : false,
										closeOnCancel : false
									},
									function(isConfirm) {
										if (isConfirm == true) {

											swal("삭제되었습니다.");
											/* location.href = "${pageContext.request.contextPath}/board/board_delete.htm?board_num=${dto.board_Num}&check=1";  */
											location.href = "${pageContext.request.contextPath}/board/board_delete.htm?board_num=${boarddto.BOARD_NUM}&check=1"; 

										} else {

											swal("취소되었습니다 :)");
										}
									});

						});
	});

	var map;
	var marker;
	var myLatlng;
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value;
	var meeting_place = document.getElementById('meeting_place').value;
	var meeting_address = document.getElementById('meeting_address').value;

	function initialize() {

		// set initial position
		myLatlng = new google.maps.LatLng(lat, lng);

		var myOptions = { // default map options
			zoom : 18,
			center : myLatlng,
			icon : marker,
			scrollwheel : false
		};

		map = new google.maps.Map(document.getElementById('gmap_detail'),
				myOptions);

		var request = {
			radius : 50,
			location : myLatlng
		};

		// send request
		service = new google.maps.places.PlacesService(map);
		service.search(request, createMarker);
	}

	function createMarker() {
		var image = '${pageContext.request.contextPath}/resources/img/flag_marker.png';
		marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			icon : image
		});
		var infowindow = new google.maps.InfoWindow({
			content : '<font style="color:#000;">' + meeting_place
					+ '<br />주소: ' + meeting_address + '</font>'
		});

		infowindow.open(map, marker);

		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map, marker);
		});

	}

	// initialization
	google.maps.event.addDomListener(window, 'load', initialize);
	/* 	google.maps.disableScrollWheelZoom();  */

	$(function() {
		$("#datepicker").datepicker({
			startDate : new Date()
		}).datetimepicker('update', new Date());
	});
</script>

<div class="breadcrumb-box breadcrumb-none"></div>

<div id="main" class="page">
	<header class="page-header">
		<div class="container">
			<h1 class="title">가이드구함</h1>
		</div>
	</header>

	<div class="container">
		<div class="row">
			<article class="content product-page col-sm-12 col-md-12">
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div class="image-box">
							<span class="sale top"></span>
							<div class="general-img">
								<img class="replace-2x" alt=""
									src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}"
									data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}"
									width="500" height="500">
							</div>
							<!-- .general-img -->


							<div class="thumblist-box load">
								<a href="#" class="prev"> <svg x="0" y="0" width="9px"
										height="16px" viewBox="0 0 9 16"
										enable-background="new 0 0 9 16" xml:space="preserve">
					<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc"
											points="8,15.999 9,14.999 2,8 9,1.001 8,0.001 0,8 "></polygon>
				  </svg>
								</a> <a href="#" class="next"> <svg x="0" y="0" width="9px"
										height="16px" viewBox="0 0 9 16"
										enable-background="new 0 0 9 16" xml:space="preserve">
					<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc"
											points="1,0.001 0,1.001 7,8 0,14.999 1,15.999 9,8 "></polygon>
				  </svg>
								</a>

								<div id="thumblist" class="thumblist">
									<a class="active" href="#"
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}"
										width="100" height="100">
									</a> <a href="#"
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}"
										width="100" height="100">
									</a> <a href="#"
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}"
										width="100" height="100">
									</a> <a href="#"
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}"
										width="100" height="100">
									</a> <a href="#"
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}"
										width="100" height="100">
									<!-- </a> <a href="#" data-image="content/img/single-3.jpg"
										data-zoom-image="content/img/single-3.jpg"> <img
										class="replace-2x" alt="" src="content/img/single-3.jpg"
										width="100" height="100">
									</a> -->
								</div>
								<!-- #thumblist -->
							</div>
							<!-- .thumblist -->
						</div>
					</div>

					<div class="col-sm-7 col-md-7">
						<div class="reviews-box table-responsive">
							<a href="#reviews" class="add-review">${boarddto.BOARD_TITLE}</a>
						</div>
						<table
							class="table table-striped table-bordered text-center my-orders-table">
							<thead>
								<tr class="first last">
									<th>작성자</th>
									<th>언어</th>
									<th>관심사</th>
									<th>지역</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${boarddto.ID}</td>
									<td><c:choose>
											<c:when test="${empty language}">
									없음
								</c:when>
											<c:otherwise>
												<c:forEach var="i" items="${language}">
								${i.LANGUAGE_NAME} 
							</c:forEach>
											</c:otherwise>
										</c:choose></td>
									<td><c:choose>
											<c:when test="${empty hobby}">
									없음
								</c:when>
											<c:otherwise>
												<c:forEach var="j" items="${hobby}">
								${j.HOBBY_NAME} 
							</c:forEach>
											</c:otherwise>
										</c:choose></td>
									<td>${boarddto.LOCAL_NAME}</td>
								</tr>
							</tbody>
						</table>
						<div class="description"></div>

						<div class="price-box">
							<span class="price">${boarddto.PRICE} / a day /
								${boarddto.BOARD_DATE}</span>
						</div>

						<c:choose>
							<c:when test="${sessionScope.user_num == boarddto.USER_NUM}">
								<c:choose>
									<c:when test="${boarddto.BOARD_CAPACITY eq 1}">
										<a class="btn btn-default btn-sm"
											href="${pageContext.request.contextPath}/board/traveler_modify.htm?board_num=${boarddto.BOARD_NUM}"><i
											class="livicon shadowed" data-s="24" data-n="pen"
											data-c="white" data-hc="0"></i> Modify</a>
										<a class="btn btn-danger btn-sm" id="delete"><i
											class="livicon shadowed" data-s="24" data-n="trash"
											data-c="white" data-hc="0"></i> Delete</a>
									</c:when>
									<c:otherwise>
										신청 수락을 했기 때문에 글 삭제 및 수정이 불가 합니다.
									</c:otherwise>
								</c:choose>
							</c:when>
							<%-- href="${pageContext.request.contextPath}/board/board_delete.htm?board_num=${boarddto.BOARD_NUM}&check=1" --%>
							<c:otherwise>
								<td>
									<c:choose>
										<c:when test="${boarddto.BOARD_CAPACITY eq 1}">
											가이드 구하는 중<br><br>
											<c:if test="${!empty sessionScope.user_num}">
												<a class="btn add-cart btn-default btn-lg"
												href="${pageContext.request.contextPath}/board/travelerParty.htm?board_num=${boarddto.BOARD_NUM}&user_num=${sessionScope.user_num}">신청하기</a>
											</c:if>
										</c:when>
										<c:otherwise>
											가이드 이미 구함(마감) <br>
											가이드 : ${guide}
										</c:otherwise>
									</c:choose>
								</td>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#reviews">Meeting Point</a></li>
						<li><a href="#description">Description</a></li>

					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">
						<!-- 지도 들어가는 부분 시작 -->
						<div class="tab-pane active" id="reviews">
							<div class="timeline-content border border-danger"
								data-appear-animation="fadeInRight">
								<div class="entry-content">
									<div class="map-box not-margin">
										<div id="gmap_detail" style="height: 400px"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- #reviews -->
						<!-- 지도 끝 -->

						<div class="tab-pane" id="description">
							${boarddto.BOARD_CONTENT}<br> <br> <br> <br>
							추가사항 강 : 스마트에디터를 써보자 이곳에~~~~~~~~~~~~~~~
						</div>


					</div>
					<!-- .tab-content -->
				</div>

				<div class="clearfix"></div>
			</article>
			<!-- .content -->
		</div>
	</div>
</div>
<!-- #main -->