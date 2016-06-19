<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=${sessionScope.locale}"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script>


<input type="hidden" id="latitude" value="${dto.board_latitude}" />
<input type="hidden" id="longitude" value="${dto.board_longitude}"/>

<script type="text/javascript">
window.CKEDITOR_BASEPATH = 'http://example.com/path/to/libs/ckeditor/';
	$(function() {
		$('#pic2').hide();
		$('#pic3').hide();
		$('#pic4').hide();
		$('#pic5').hide();

		var index = 2;
		$('#addBtn').click(function() {
			if (index <= 5) {
				/* $('#addPic')
						.append(
								'<input type="file" id="pic' + index + '" name="board_Picture' + index + '">'); */
				$('#pic' + index).show();
				index++;
			} else {
				alert('더 이상 추가할 수 없습니다');
			}
		});
		$('#minusBtn').click(function() {
			if (index > 2) {
				index--;
				$('#pic' + index).val("");
				$('#pic' + index).hide();
				/* $('#pic' + index).remove(); */
			} else {
				alert('더 이상 삭제할 수 없습니다.');
			}
		});
		$('#gmap_where').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#button2').trigger('click');

				return false;
			}
		});
	});

	$(function() {
		$("#datepicker").datepicker({
			startDate : new Date()
		}).datetimepicker('update', new Date());
	});
	
	var geocoder;
	var map;
	var markers = Array();
	var infos = Array();
	var latitude = document.getElementById('latitude').value;
	var longitude = document.getElementById('longitude').value;

	function initialize() {
		// prepare Geocoder
		geocoder = new google.maps.Geocoder();

		// set initial position (예전에 지정된 위치)
		var myLatlng = new google.maps.LatLng(latitude, longitude);

		var myOptions = { // default map options
			zoom : 18,
			center : myLatlng,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('gmap_canvas'),
				myOptions);
	}

	// clear overlays function
	function clearOverlays() {
		if (markers) {
			for (i in markers) {
				markers[i].setMap(null);
			}
			markers = [];
			infos = [];
		}
	}

	// clear infos function
	function clearInfos() {
		if (infos) {
			for (i in infos) {
				if (infos[i].getMap()) {
					infos[i].close();
				}
			}
		}
	}

	// find address function
	function findAddress(){
		clearOverlays();
		var address = document.getElementById("gmap_where").value;

		// script uses our 'geocoder' in order to find location by address name
		geocoder
				.geocode(
						{
							'address' : address
						},
						function(results, status) {
							clearOverlays();
							if (status == google.maps.GeocoderStatus.OK) { // and, if everything is ok

								// we will center map
								var addrLocation = results[0].geometry.location;
								map.setCenter(addrLocation);

								// store current coordinates into hidden variables
								document.getElementById('lat').value = results[0].geometry.location
										.lat();
								document.getElementById('lng').value = results[0].geometry.location
										.lng();
								var lat = document.getElementById('lat').value;
								var lng = document.getElementById('lng').value;
								var latlng = lat + ', ' + lng;

								// and then - add new custom marker
								var addrMarker = new google.maps.Marker({
									position : addrLocation,
									map : map,
									title : results[0].formatted_address
								});
								markers.push(addrMarker);

								findPlace();

							} else {
								alert('Geocode was not successful for the following reason: '
										+ status);
							}
						});

	}
	function findPlace() {
		var lat = document.getElementById('lat').value;
		var lng = document.getElementById('lng').value;
		var cur_location = new google.maps.LatLng(lat, lng);

		var request = {
			radius : 1,
			location : cur_location,

		};
		service = new google.maps.places.PlacesService(map);
		service.search(request, createMarkers);
	}

	// find custom places function
	function findPlaces() {

		// prepare variables (filter)
		var type = document.getElementById('gmap_type').value;
		var radius = document.getElementById('gmap_radius').value;

		var lat = document.getElementById('lat').value;
		var lng = document.getElementById('lng').value;
		var cur_location = new google.maps.LatLng(lat, lng);

		// prepare request to Places
		var request = {
			location : cur_location,
			radius : radius,
			types : [ type ]
		};

		// send request
		service = new google.maps.places.PlacesService(map);
		service.search(request, createMarkers);
	}

	// create markers (from 'findPlaces' function)
	function createMarkers(results, status) {
		if (status == google.maps.places.PlacesServiceStatus.OK) {

			// if we have found something - clear map (overlays)
			clearOverlays();

			// and create new markers by search result
			for (var i = 0; i < results.length; i++) {
				createMarker(results[i]);
			}
		} else if (status == google.maps.places.PlacesServiceStatus.ZERO_RESULTS) {
			alert('Sorry, nothing is found');
		}
	}

	// creare single marker function
	function createMarker(obj) {

		// prepare new Marker object
		var mark = new google.maps.Marker({
			position : obj.geometry.location,
			map : map,
			title : obj.name
		});
		markers.push(mark);

		// prepare info window
		var infowindow = new google.maps.InfoWindow(
				{
					content : '<img src="' + obj.icon + '" /><font style="color:#000;">'
							+ obj.name
							+ '<br />Rating: '
							+ obj.rating
							+ '<br />Vicinity: '
							+ obj.vicinity
							+ '<br />latlng: '
							+ obj.geometry.location.lat()
							+ ', ' + obj.geometry.location.lng() + '</font>'
				});

		// add event handler to current marker
		google.maps.event.addListener(mark, 'click', function() {
			clearInfos();
			infowindow.open(map, mark);
			document.getElementById('latitude').value = obj.geometry.location.lat();
			document.getElementById('longitude').value = obj.geometry.location.lng();
			document.getElementById('meeting_place').value = obj.name;
			document.getElementById('meeting_address').value = obj.vicinity;


		});
		infos.push(infowindow);

	}

	// initialization
	google.maps.event.addDomListener(window, 'load', initialize);

</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title">여행자가 가이드를 구하기 위해 글 작성하는 곳</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form action="" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_num" value="${sessionScope.user_num}"> <input
					type="hidden" name="board_num" value="${boarddto.board_num}">
				<table class="table center">
					<tr>
						<td><h6>글 제목</h6></td>
						<td colspan="5"><input class="form-control" type="text"
							name="board_title" value="${boarddto.board_title}"></td>
					</tr>
					<tr>
						<td>날짜</td>
						<td><input class="form-control" type="text" name="board_date"  id="datepicker"  value="${boarddto.board_date}"></td>
						<td>지불할 가격</td>
						<td><input class="form-control" type="text" name="price"
							value="${boarddto.price}"></td>
					</tr>
					<tr>
						<td>설명</td>
						<td colspan="5">
						<%-- ${dto.board_Content} --%>
							<textarea name="board_content" id="ckeditor">${boarddto.board_content}</textarea> <script
								type="text/javascript">
								CKEDITOR.replace('ckeditor', {
									width : '90%',
									height : '400px'

								});
							</script>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<!-- <td id="addPic" colspan="4"> -->
						<td>
							<input type="file" id="pic1" name="pic"> 수정전 파일 : <input type="text" readonly="readonly" value="${boarddto.board_picture1}">
							<input type="file" id="pic2" name="pic">
							<input type="file" id="pic3" name="pic">
							<input type="file" id="pic4" name="pic">
							<input type="file" id="pic5" name="pic">
						</td>
						<td align="center">
							<button type="button" id="addBtn" class="btn btn-success">추가</button>
							<button type="button" id="minusBtn" class="btn btn-danger">빼기</button>
						</td>
					</tr>
					<tr>
						<td>Meeting Point</td>
						<td colspan="5">
							<div id="container" class="row">
								<div id="gmap_canvas" style="height: 500px"></div>
								<div class="actions">
									<div class="button">
										<label for="gmap_where">Where:</label> <input id="gmap_where"
											class="form-control" type="text" name="gmap_where">
									</div>
									<div id="button2" class="btn btn-success"
										onclick="findAddress(); return false;">Search for
										address</div>
									<div class="button">
										<label for="gmap_type">Type:</label> <select id="gmap_type">
											<option value="art_gallery">art_gallery</option>
											<option value="atm">atm</option>
											<option value="bank">bank</option>
											<option value="bar">bar</option>
											<option value="cafe">cafe</option>
											<option value="food">food</option>
											<option value="store">store</option>
											<option value="subway_station">subway_station</option>
										</select>
									</div>
									<div class="button">
										<label for="gmap_radius">Radius:</label> <select
											id="gmap_radius">
											<option value="500">500</option>
											<option value="1000">1000</option>
											<option value="1500">1500</option>
											<option value="5000">5000</option>
										</select>
									</div>
									<input type="hidden" id="lat" name="board_latitude" /> <input
										type="hidden" id="lng" name="board_longitude" /> <input
										type="hidden" id="meeting_place" name="meeting_place" /> <input
										type="hidden" id="meeting_address" name="meeting_address" />
									<div id="button1" class="btn btn-success"
										onclick="findPlaces(); return false;">Search for objects</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center"><input type="submit"
							class="btn btn-success" value="등록"> <input type="reset"
							class="btn btn-danger" value="취소"></td>
					</tr>
				</table>
			</form>
		</div>
	</article>
	<!-- .content -->
</section>
<!-- #main -->