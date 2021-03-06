<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.css">
<script type="text/javascript" src=".././resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href=".././resources/js/sweetalert.css">
<script type="text/javascript" src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=${sessionScope.locale}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<input type="hidden" id="lat" value="${boarddto.BOARD_LATITUDE}" />
<input type="hidden" id="lng" value="${boarddto.BOARD_LONGITUDE}" />
<input type="hidden" id="meeting_place" value="${boarddto.MEETING_PLACE}" />
<input type="hidden" id="meeting_address" value="${boarddto.MEETING_ADDRESS}" />
<input type="hidden" id=cp value="${boarddto.BOARD_CAPACITY}"/>
<input type="hidden" id=ac value="${accept}"/>

<script type="text/javascript">
	
	//시간차에 따른 버튼 처리
	function getTimeStamp() {
	    var d = new Date();
	    var s =
	        leadingZeros(d.getMonth() + 1, 2) + '/' +
	        leadingZeros(d.getDate(), 2) + '/' +
	        leadingZeros(d.getFullYear(), 4);
	    return s;
	}
	
	function leadingZeros(n, digits) {
	    var zero = '';
	    n = n.toString();
	 
	    if (n.length < digits) {
	        for (i = 0; i < digits - n.length; i++)
	            zero += '0';
	    }
	    return zero + n;
	}
	
	$(function() {
		$('#msg_btn').click(function() {
			$.ajax({
				type : "post",
				url : getContextPath() + "/message/sendMessageFromBoard.htm",
				data : {
					"receiver" : $('#receiver').val(),
					"sender" : $('#sender').val(),
					"message_title" : $('#message_title').val(),
					"message_content" : $('#message_content').val()
				},
				success : function(data) {
					if(data == 1) {
						swal("메세지 전송이 완료되었습니다.");
						$('#receiver').val("");
						$('#sender').val("");
						$('#message_title').val("");
						$('#message_content').val("");
					}
				}
			});
		});
		
		
		var today = new Date();
		var dateString = $('#wd').val();
		var dateArray = dateString.split("/");  
		var dateObj = new Date(dateArray[2], Number(dateArray[0])-1, dateArray[1]);
		var betweenDay = (dateObj.getTime()-today.getTime())/1000/60/60/24;
		if(betweenDay < 0){
			$('#beforeDate').remove();
			$('#afterDate').append("마감된 글입니다.");
		}
		$('#date').val(today);
		$('#date2').val(today.getTime());
		$('#wd').val(dateString);
		$('#cd').val(dateObj.getTime());
		$('#mi').val(betweenDay);
		
		$('#sm').click(function(){
			if($('#ac').val() == null){
				$('#ac').val(0);
			}
			var mi = $('#cp').val() - $('#ac').val();
			if(mi < $('#many').val()){
				swal("최대 신청 인원수를 초과 합니다! 신청할 수 없습니다!");
				return false;
			}else{
				return true;
			}
		});
		
		$('#delete').click( function() {
			swal({
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

		map = new google.maps.Map(document.getElementById('gmap_detail'), myOptions);

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
		
		var infowindow = new google.maps.InfoWindow({content : '<font style="color:#000;">'+'주소: '+ meeting_address + '</font>'});

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
				<spring:message code="board.guide_detail" />
			</h1>
			<!-- 지우지 마세요. 일단위로 체크해야 하는 항목입니다. - 민규<br> -->
			<!-- 현재 시간 : -->
			<input type="hidden" id="date">
			<!-- 현재 시간 변환 : -->
			<input type="hidden" id="date2">
			<!-- 글 마감 시간 : -->
			<input type="hidden" id="wd" value="${boarddto.BOARD_DATE}">
			<!-- 글 마감 시간 변환 :  -->
			<input type="hidden" id="cd">
			<!-- 현재 시간과 마감 시간의 차이 :  -->
			<input type="hidden" id="mi">
		</div>
	</header>

	<div class="container">
		<div class="row">
			<article class="content product-page col-sm-12 col-md-12">
				<div class="row">
					<div class="col-sm-5 col-md-5">
						<div class="image-box">
							<div class="general-img">
								<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}" width="500" height="500">
							</div>
							<!-- .general-img -->
							<div class="thumblist-box load">
								<a href="#" class="prev">
									<svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
										<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="8,15.999 9,14.999 2,8 9,1.001 8,0.001 0,8 "></polygon>
				  					</svg>
								</a> 
								<a href="#" class="next"> 
									<svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
										<polygon fill-rule="evenodd" clip-rule="evenodd" fill="#fcfcfc" points="1,0.001 0,1.001 7,8 0,14.999 1,15.999 9,8 "></polygon>
				  					</svg>
								</a>

								<div id="thumblist" class="thumblist">
									<a href="#" class="active" data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}" data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}">
										<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE1}" width="100" height="100">
									</a> 
									<a href="#" data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}" data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}">
										<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE2}" width="100" height="100">
									</a> 
									<a href="#" data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}" data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}">
										<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE3}" width="100" height="100">
									</a> 
									<a href="#" data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}" data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}">
										<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE4}" width="100" height="100">
									</a> 
									<a href="#" data-image="${pageContext.request.contextPath}/resources/img/board_picture/${boraddto.BOARD_PICTURE5}" data-zoom-image="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}">
										<img class="replace-2x" alt="" src="${pageContext.request.contextPath}/resources/img/board_picture/${boarddto.BOARD_PICTURE5}" width="100" height="100">
									</a>
								</div>
								<!-- #thumblist -->
							</div>
							<!-- .thumblist -->
						</div>
					</div>

					<div class="col-sm-7 col-md-7">
						<div class="reviews-box table-responsive">
							<div class="price-box">
								<span class="entry-title">${boarddto.BOARD_TITLE}</span>
							</div>
						</div>
						<table class="table table-striped table-bordered text-center my-orders-table">
							<thead>
								<tr class="first last">
									<th><spring:message code="board.traveler_detail1" /></th>
									<th><spring:message code="board.traveler_detail2" /></th>
									<th><spring:message code="board.traveler_detail3" /></th>
									<th><spring:message code="index.inc.carousel-box-recommended12" /></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<a data-toggle="modal" data-target="#myModal">${boarddto.ID}</a>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty language}">
												없음
											</c:when>
											<c:otherwise>
												<c:forEach var="i" items="${language}">
													${i.LANGUAGE_NAME} 
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty hobby}">
												없음
											</c:when>
											<c:otherwise>
												<c:forEach var="j" items="${hobby}">
													${j.HOBBY_NAME} 
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										${boarddto.LOCAL_NAME}
									</td>
								</tr>
							</tbody>
						</table>
						<div class="description"></div>

						<h4 class="entry-title">${boarddto.PRICE} / a hour<br>${boarddto.BOARD_DATE}</h4>

						<div id="beforeDate">
							총 모집 인원 : ${boarddto.BOARD_CAPACITY}<br>
							<c:choose>
								<c:when test="${empty accept}">
										현재 수락된 (참여) 인원 : 0명<br>
								</c:when>
								<c:otherwise>
											현재 수락된 (참여)인원 : ${accept}<br>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${sessionScope.user_num == boarddto.USER_NUM}">
									<c:choose>
										<c:when test="${empty accept}">
										현재 ${boarddto.BOARD_CAPACITY}명 신청 가능 <br>
										</c:when>
										<c:otherwise>
											현재 ${boarddto.BOARD_CAPACITY - accept}명 신청 가능 <br>
										</c:otherwise>
									</c:choose>

									<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/board/guide_modify.htm?board_num=${boarddto.BOARD_NUM}">
										<i class="livicon shadowed" data-s="24" data-n="pen" data-c="white" data-hc="0"></i> 
										<spring:message code="board.review_detail4" />
									</a>
									<a class="btn btn-danger btn-sm" id="delete">
										<i class="livicon shadowed" data-s="24" data-n="trash" data-c="white" data-hc="0"></i> 
										<spring:message code="board.traveler_detail0.4" />
									</a>
								</c:when>

								<c:otherwise>
									<c:choose>
										<c:when test="${boarddto.BOARD_CAPACITY <= accept}">
											신청 인원이 가득 찼습니다.
											(신청 마감)
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${empty accept}">
													현재 ${boarddto.BOARD_CAPACITY}명 신청 가능 <br>
												</c:when>
												<c:otherwise>
													현재 ${boarddto.BOARD_CAPACITY - accept}명 신청 가능 <br>
												</c:otherwise>
											</c:choose>
											<br>
											<c:if test="${!empty sessionScope.user_num}">
												<c:choose>
													<c:when test="${realcheck eq 1}">
														이미 신청한 여행 입니다.
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${sessionScope.country_code eq 82}">
																외국인만 여행 참가 신청이 가능합니다.
															</c:when>
															<c:otherwise>
																<form action="${pageContext.request.contextPath}/board/guideParty.htm" class="form-inline add-cart-form" method="post" id="form1">
																	<input type="hidden" name="board_num" value="${boarddto.BOARD_NUM}"> 
																	<input type="hidden" name="user_num" value="${sessionScope.user_num}"> 
																	<input type="hidden" id="ac" value="${accept}"> 
																	<input type="submit" class="btn-default btn-lg" value="신청하기" id="sm">
																	<div class="number">
																		<label>인원수:</label> 
																		<input type="text" value="1" class="form-control" name="many" id="many">
																		<div class="regulator">
																			<a href="#" class="number-up">
																				<i class="fa fa-angle-up"></i>
																			</a> 
																			<a href="#" class="number-down">
																				<i class="fa fa-angle-down"></i>
																			</a>
																		</div>
																	</div>
																</form>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="afterDate"></div>
					</div>
				</div>

				<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#reviews">
							<spring:message code="board.traveler_detail13" /></a>
						</li>
						<li>
							<a href="#description">
								<spring:message code="board.traveler_writeform5" />
							</a>
						</li>
					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">
						<!-- 지도 들어가는 부분 시작 -->
						<div class="tab-pane active" id="reviews">
							<div class="timeline-content border border-danger" data-appear-animation="fadeInRight">
								<div class="entry-content">
									<div class="map-box not-margin">
										<div id="gmap_detail" style="height: 400px; width: auto"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- #reviews -->
						<!-- 지도 끝 -->
						<div class="tab-pane" id="description">
							${boarddto.BOARD_CONTENT}<br>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">${boarddto.ID}</h4>
			</div>
			<div class="modal-body">
				<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#profile">프로필보기</a></li>
						<li><a href="#sendMessage">쪽지보내기</a></li>
						<li><a href="#reporting">신고하기</a></li>
					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">
						<div class="tab-pane active" id="profile">
							<div class="bottom-padding">
								<div class="row">
									<a class="img-thumbnail img-polaroid lightbox" rel="fancybox" href="${pageContext.request.contextPath}/resources/img/profile_picture/${boarddto.PROFILE_PICTURE}">
										<img class="avatar replace-2x animated rotateIn" src="${pageContext.request.contextPath}/resources/img/profile_picture/${boarddto.PROFILE_PICTURE}" alt="" title="" width="150px" height="150px"> 
										<span class="bg-images"><i class="fa fa-search"></i></span>
									</a>
									<div class="employee-description col-sm-8 col-md-8">
										<h3 class="name">${boarddto.NAME}</h3>
										<div class="role"></div>
										<div>
											<p>${boarddto.PROFILE_DESCRIPTION}</p>
										</div>
										<div class="social"></div>
									</div>
									<div class="clearfix"></div>
								</div>
								<br><br>
								<div class="table-responsive">
									<table class="table table-bordered">
										<tr>
											<th class="danger" align="center" colspan="2">Information</th>
										</tr>
										<tr>
											<th class="danger">지역</th>
											<td>${boarddto.LOCAL_NAME}</td>
										</tr>
										<tr>
											<th class="danger">언어</th>
											<td>
												<c:forEach var="i" items="${language}">
													${i.LANGUAGE_NAME} 
												</c:forEach>
											</td>
										</tr>
										<tr>
											<th class="danger">취미</th>
											<td>
												<c:forEach var="j" items="${hobby}">
													${j.HOBBY_NAME} 
												</c:forEach>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>

						<div class="tab-pane" id="sendMessage">
							<table class="table center">
								<tr>
									<td>
										<input type="hidden" name="sender" id="sender" value="${sessionScope.user_num}"> <input type="hidden" name="receiver" id="receiver" value="${boarddto.USER_NUM}">
										<input type="text" class="form-control" id="message_title" name="message_title" placeholder="메세지 제목 입력">
									</td>
								</tr>
								<tr>
									<td>
										<textarea class="form-control" style="resize: none; height: 100px;" wrap="soft" id="message_content" name="message_content" placeholder="메세지 내용 입력"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<button class="btn btn-success" id="msg_btn">전송</button>
									</td>
								</tr>
							</table>
						</div>

						<div class="tab-pane" id="reporting">
							<form action="${pageContext.request.contextPath}/report/report_write2.htm?reporter=${sessionScope.user_num}&villain=${boarddto.USER_NUM}&board_num=${boarddto.BOARD_NUM}" method="post">
								<table class="table center">
									<tr>
										<td>
											<input type="text" class="form-control" placeholder="제목을 입력해주세요" name="report_title">
										</td>
									</tr>
									<tr>
										<td>
											<textarea class="form-control" placeholder="상세한 이유를 작성해주세요" name="report_content" style="resize: none; height: 100px;" wrap="soft" name=""></textarea>
										</td>
									</tr>
									<tr>
										<td>
											<input type="submit" class="btn btn-success" value="전송">
										</td>
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
