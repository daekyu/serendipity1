<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
	/* $(function(){
		$('#delete').click(function(){
			if(confirm("글을 삭제 하시겠습니까?") == true){
			location.href="${pageContext.request.contextPath}/board/board_delete.htm?board_num=${dto.board_Num}&check=2";
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
											location.href = "${pageContext.request.contextPath}/board/board_delete.htm?board_num=${dto.board_Num}&check=2";
											location.href = "${pageContext.request.contextPath}/board/board_delete.htm?board_num=${boarddto.BOARD_NUM}&check=2"

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
</script>


<div class="breadcrumb-box breadcrumb-none"></div>


<div id="main" class="page">
	<header class="page-header">
		<div class="container">
			<h1 class="title">
				<spring:message code="board.traveler_detail" />
			</h1>
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
									<a href="#" class="active"
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
										data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boraddto.BOARD_PICTURE5}"
										data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}">
										<img class="replace-2x" alt=""
										src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}"
										width="100" height="100">
									<!-- </a> <a href="#" data-image="content/img/single-3.jpg"
										data-zoom-image="content/img/single-3.jpg"> <img
										class="replace-2x" alt="" src="content/img/single-3.jpg"
										width="100" height="100"> -->
									</a>
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
									<th><spring:message code="board.traveler_detail1" /></th>
									<th><spring:message code="board.traveler_detail2" /></th>
									<th><spring:message code="board.traveler_detail3" /></th>
									<th><spring:message code="board.traveler_detail4" /></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a data-toggle="modal" data-target="#myModal">${boarddto.ID}</a></td>
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
							<span class="price">${boarddto.PRICE} / a day</span>
						</div>
						<c:choose>
							<c:when test="${sessionScope.user_num == boarddto.USER_NUM}">
								<a class="btn btn-default btn-sm"
									href="${pageContext.request.contextPath}/board/guide_modify.htm?board_num=${boarddto.BOARD_NUM}"><i
									class="livicon shadowed" data-s="24" data-n="pen"
									data-c="white" data-hc="0"></i> <spring:message
										code="board.traveler_detail5" /></a>
								<a class="btn btn-danger btn-sm" id="delete"><i
									<%-- 					href="${pageContext.request.contextPath}/board/board_delete.htm?board_num=${boarddto.BOARD_NUM}&check=2" --%>
									class="livicon shadowed"
									data-s="24" data-n="trash" data-c="white" data-hc="0"></i> <spring:message
										code="board.traveler_detail6" /></a>
							</c:when>

							<c:otherwise>
								<form
									action="${pageContext.request.contextPath}/board/guideParty.htm"
									class="form-inline add-cart-form" method="post">
									<select>
										<option>16.06.02 - 2명남음</option>
									</select>
									<%-- ${pageContext.request.contextPath} --%>
									<c:if test="${!empty sessionScope.user_num}">
										<input type="hidden" name="board_num"
											value="${boarddto.BOARD_NUM}">
										<input type="hidden" name="user_num"
											value="${sessionScope.user_num}">
										<input type="submit" class="btn-default btn-lg" value="신청하기">
										<!-- 이 클래스 속성 먹이면 버튼이 안눌림; btn add-cart -->
										<div class="number">

											<label>인원수:</label> <input type="text" value="1"
												class="form-control" name="many">
											<div class="regulator">
												<a href="#" class="number-up"><i class="fa fa-angle-up"></i></a>
												<a href="#" class="number-down"><i
													class="fa fa-angle-down"></i></a>
											</div>
										</div>
									</c:if>
								</form>
							</c:otherwise>
						</c:choose>


					</div>
				</div>

				<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#reviews"><spring:message
									code="board.traveler_detail7" /></a></li>
						<li><a href="#description"><spring:message
									code="board.traveler_detail8" /></a></li>

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
			</article>
			<!-- .content -->
		</div>
	</div>
</div>
<!-- #main -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">${boarddto.ID}</h4>
			</div>
			<div class="modal-body">
				<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#profile">프로필보기</a></li>
						<li><a href="#sendMessage">쪽지보내기</a></li>
						<li><a href="#chatting">채팅신청하기</a></li>
						<li><a href="#reporting">신고하기</a></li>
					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">
						<div class="tab-pane active" id="profile">
							<div class="bottom-padding">
								<div class="row">
									<div class="images-box col-xs-9 col-sm-6 col-md-4">
										<div class="carousel-box load" data-carousel-pagination="true"
											data-carousel-nav="false" data-carousel-one="true"
											data-autoplay-disable="true">
											<div class="carousel">
												<div class="image">
													<img class="replace-2x"
														src=".././content/img/team-big-1.jpg" alt="" title=""
														width="768" height="768">
												</div>
											</div>
											<div class="clearfix"></div>
											<div class="pagination switches"></div>
										</div>
									</div>

									<div class="employee-description col-sm-8 col-md-8">
										<h3 class="name">${boarddto.NAME}</h3>
										<div class="role"></div>
										<div>
											<p>${boarddto.PROFILE_DESCRIPTION}</p>
										</div>
										<div class="social">
											<!-- 				<a class="icon rounded icon-facebook" href="#"><i class="fa fa-facebook"></i></a>
				<a class="icon rounded icon-twitter" href="#"><i class="fa fa-twitter"></i></a>
				<a class="icon rounded icon-google" href="#"><i class="fa fa-google"></i></a>
				<a class="icon rounded icon-linkedin" href="#"><i class="fa fa-linkedin"></i></a> -->
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
								<br> <br>
								<div class="table-responsive">
									<table class="table table-bordered">

										<tr>
											<th class="danger" colspan="2">Information</th>
										</tr>

										<tr>
											<th class="danger">지역</th>
											<td>${boarddto.LOCAL_NAME}</td>
										</tr>

										<tr>
											<th class="danger">언어</th>
											<td><c:forEach var="i" items="${language}">
							${i.LANGUAGE_NAME} 
						</c:forEach></td>
										</tr>

										<tr>
											<th class="danger">취미</th>
											<td><c:forEach var="j" items="${hobby}">
							${j.HOBBY_NAME} 
						</c:forEach></td>
										</tr>

									</table>
								</div>
							</div>
						</div>

						<div class="tab-pane" id="sendMessage">
							<form>
								<table class="table center">
									<tr>
										<td><textarea class="form-control"
												style="resize: none; height: 100px;" wrap="soft" name=""></textarea>
										</td>
									</tr>

									<tr>
										<td><input class="btn btn-success" type="submit"
											value="전송"></td>
									</tr>
								</table>
							</form>
						</div>

						<div class="tab-pane" id="chatting"></div>
						<!-- #reviews -->

						<div class="tab-pane" id="reporting">
							<form
								action="${pageContext.request.contextPath}/report/report_write2.htm?reporter=${sessionScope.user_num}&villain=${boarddto.USER_NUM}&board_num=${boarddto.BOARD_NUM}"
								method="post">
								<table class="table center">
									<tr>
										<td><input type="text" class="form-control"
											placeholder="제목을 입력해주세요" name="report_title"></td>
									</tr>

									<tr>
										<td><textarea class="form-control"
												placeholder="상세한 이유를 작성해주세요" name="report_content"
												style="resize: none; height: 100px;" wrap="soft" name=""></textarea>
										</td>
									</tr>

									<tr>
										<td><input type="submit" class="btn btn-success"
											value="전송"></td>
									</tr>
								</table>
							</form>
						</div>
						<!-- #reviews -->
					</div>
					<!-- .tab-content -->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
