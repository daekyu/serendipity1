<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript" src=".././resources/js/sweetalert.min.js"></script> 
<link rel="stylesheet" type="text/css" href=".././resources/js/sweetalert.css"> 

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDWka6sHvhTjjLZRCb289fsAD-U_LN-WL8&sensor=false&language=${sessionScope.locale}"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script>
<input type="hidden" id="latitude" value="${boarddto.BOARD_LATITUDE}" />
<input type="hidden" id="longitude" value="${boarddto.BOARD_LONGITUDE}"/>
<style>
.controls {
	margin-top: 10px;
	border: 1px solid transparent;
	border-radius: 2px 0 0 2px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	height: 32px;
	outline: none;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#pac-input {
	background-color: #fff;
	font-family: Roboto;
	font-size: 15px;
	font-weight: 300;
	margin-left: 12px;
	padding: 0 11px 0 13px;
	text-overflow: ellipsis;
	width: 300px;
}

#pac-input:focus {
	border-color: #4d90fe;
}

.pac-container {
	font-family: Roboto;
}

#type-selector {
	color: #fff;
	background-color: #4d90fe;
	padding: 5px 11px 0px 11px;
}

#type-selector label {
	font-family: Roboto;
	font-size: 13px;
	font-weight: 300;
}
</style>

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
			$('#pic' + index).show();
			index++;
		} else {
			swal('더 이상 추가할 수 없습니다');
		}
	});
	
	$('#minusBtn').click(function() {
		if (index > 2) {
			index--;
			$('#pic' + index).val("");
			$('#pic' + index).hide();
		} else {
			swal('더 이상 삭제할 수 없습니다.');
		}
	});
	
	$('#pac-input').keydown(function (e) {
	    if(e.keyCode == 13)
	    {
	        $('#button2').trigger('click');
	        return false;
	    }
	});
	
	$("#convert").click(function(){
		if ($('#before').val() == ''){
			swal("값을 입력해주세요!");
			$("#before").focus();
			return false;
		} else {
			var endpoint = 'live'
			var access_key = '56370edf846ec46335b07809733c304e';

			// get the most recent exchange rates via the "live" endpoint:
			$.ajax({
			    url: 'http://apilayer.net/api/' + endpoint + '?access_key=' + access_key,   
			    dataType: 'jsonp',
			    success: function(json) {
					console.log(json);
					if($('#selectoption').val()=='KRW') {
						$('#after').val(formatNumber($('#before').val())+'원');
						$('#before').val(formatNumber($('#before').val())+'원');
					} else if($('#selectoption').val()=='JPY') {
						swal({   
							title: "실시간 환율 정보",   
							text:'  ¥1= ￦' +json.quotes.USDKRW/json.quotes.USDJPY,   
							imageUrl: ".././resources/img/yen.png" ,confirmButtonColor: "#DD6B55"
						});	  
						$('#after').val(formatNumber(Math.floor($('#before').val()* json.quotes.USDKRW/json.quotes.USDJPY))+'원');
						$('#before').val(formatNumber($('#before').val())+'원');
					} else if($('#selectoption').val()=='USD') {
						swal({   title: "실시간 환율 정보",   text: '  $1= ￦'+json.quotes.USDKRW,   imageUrl: ".././resources/img/dollar.png",confirmButtonColor: "#DD6B55" });
						$('#after').val(formatNumber(Math.floor($('#before').val() * json.quotes.USDKRW))+'원');
						$('#before').val(formatNumber($('#before').val())+'원');
					}
			    }
			});
		}
	});
	
	$("#datepicker").datepicker({startDate :new Date((new Date()).valueOf() + 1000*3600*24)}).datetimepicker('update', new Date());
	
});

var geocoder;
var map;
var markers = Array();
var markers2= Array();
var infos = Array();
var latitude = document.getElementById('latitude').value;
var longitude = document.getElementById('longitude').value;
var MARKER_PATH = 'https://maps.gstatic.com/intl/en_us/mapfiles/marker';

function initialize() {
    // prepare Geocoder
    geocoder = new google.maps.Geocoder();

    // set initial position (예전에 지정된 위치)
    var myLatlng = new google.maps.LatLng(latitude, longitude);

    var myOptions = { // default map options
        zoom: 18,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var image = '${pageContext.request.contextPath}/resources/img/flag_marker.png';
    map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
    
    google.maps.event.addListener(map, 'click', function (mouseEvent) {
    	getAddress(mouseEvent.latLng);
    });
    
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
    	searchBox.setBounds(map.getBounds());
    });
    searchBox.addListener('places_changed', function() {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
			return;
		}

        // For each place, get the icon, name and location.
        var bounds = new google.maps.LatLngBounds();
        places.forEach(function(place) {
			if (place.geometry.viewport) {
				// Only geocodes have viewport.
				bounds.union(place.geometry.viewport);
			} else {
				bounds.extend(place.geometry.location);
			}
        });
        map.fitBounds(bounds);
        map.setZoom(16);
	});
}

function getAddress(latlng) {
	var geocoder = new google.maps.Geocoder();
	var image = '${pageContext.request.contextPath}/resources/img/flag_marker.png';
	geocoder.geocode({latLng: latlng}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0].geometry) {
				var address = results[0].formatted_address;
				
				// Clear out the old markers.
				markers.forEach(function(marker) {
					marker.setMap(null);
				});
				
				markers = [];
				
				var marker = new google.maps.Marker({
					position: latlng,
					map: map,
					icon:image
				});
				markers.push(marker);
	           
				var info =  new google.maps.InfoWindow({
					content:address
				});
	 
				new google.maps.InfoWindow({content:address}).open(map,marker);
				document.getElementById('lat').value = results[0].geometry.location.lat();
				document.getElementById('lng').value = results[0].geometry.location.lng();
				document.getElementById('meeting_address').value = results[0].formatted_address;

				google.maps.event.addListener(marker, 'click', function (mouseEvent) {     
					info.open(map,marker);
				});
			}
		} else if (status == google.maps.GeocoderStatus.ERROR) {
			swal("통신중 에러발생！");
		} else if (status == google.maps.GeocoderStatus.INVALID_REQUEST) {
			swal("요청에 문제발생！");
		} else if (status == google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
			swal("단시간에 쿼리 과다송신！");
		} else if (status == google.maps.GeocoderStatus.REQUEST_DENIED) {
			swal("이 페이지에는 지오코더 이용 불가!");
		} else if (status == google.maps.GeocoderStatus.UNKNOWN_ERROR) {
	    	swal("서버에 문제가 발생한거 같아요. 다시 한번 해보세요.");
	    } else if (status == google.maps.GeocoderStatus.ZERO_RESULTS) {
	    	swal("존재하지 않습니다.");
	    } else {
	    	swal("??");
		}
	});
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
}////////

// find address function
function findAddress() {
	clearOverlays();
    var address = document.getElementById("gmap_where").value;

    // script uses our 'geocoder' in order to find location by address name
    geocoder.geocode( { 'address': address}, function(results, status) {
		clearOverlays();
        
		if (status == google.maps.GeocoderStatus.OK) { // and, if everything is ok
            // we will center map
            var addrLocation = results[0].geometry.location;
            map.setCenter(addrLocation);

            // store current coordinates into hidden variables
            document.getElementById('lat').value = results[0].geometry.location.lat();
            document.getElementById('lng').value = results[0].geometry.location.lng();
            findPlace();
        } else {
            swal('Geocode was not successful for the following reason: ' + status);
        }
    });
}

function findPlace(){
	var lat = document.getElementById('lat').value;
    var lng = document.getElementById('lng').value;
    var cur_location = new google.maps.LatLng(lat, lng);
    var request = {
		radius: 1,
		location: cur_location,
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
        location: cur_location,
        radius: radius,
        types: [type]
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
        swal('Sorry, nothing is found');
    }
}

//creare single marker function
function createMarker(obj) {
	var image;
	var type = document.getElementById('gmap_type').value;
	
	if(type == 'art_gallery') {
		image = '${pageContext.request.contextPath}/resources/img/art_gallery_marker.png';
	} else if(type == 'atm') {
		image = '${pageContext.request.contextPath}/resources/img/atm_marker.png';
	} else if(type == 'bank') {
		image = '${pageContext.request.contextPath}/resources/img/bank_marker.png';
	} else if(type == 'bar') {
		   image = '${pageContext.request.contextPath}/resources/img/bar_marker.png';
	} else if(type == 'cafe') {
		image = '${pageContext.request.contextPath}/resources/img/cafe_marker.png';
	} else if(type == 'food') {
		image = '${pageContext.request.contextPath}/resources/img/food_marker.png';
	} else if(type == 'store') {
		image = '${pageContext.request.contextPath}/resources/img/store_marker.png';
	} else if(type == 'subway_station') {
		image = '${pageContext.request.contextPath}/resources/img/subway_station_marker.png';
	} else {
		image = '${pageContext.request.contextPath}/resources/img/flag_marker.png';
	}
	
	// prepare new Marker object
	var mark = new google.maps.Marker({
		position : obj.geometry.location,
		map : map,
		title : obj.name,
		icon: image
	});
	markers.push(mark);

	// prepare info window
	var infowindow = new google.maps.InfoWindow({
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
			<h1 class="title">가이드가 여행자를 구하기 위해 글을 올리는 곳</h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form action="" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_num" value="${sessionScope.user_num}"> 
				<input type="hidden" name="board_num" value="${boarddto.BOARD_NUM}">
				<table class="table center">
					<tr>
						<td>
							<h6>제목:</h6>
						</td>
						<td colspan="5">
							<input class="form-control" type="text" name="board_title" value="${boarddto.BOARD_TITLE}">
						</td>
					</tr>
					<tr>
						<td>인원수</td>
						<td>
							<input class="form-control" type="text" name="board_capacity" value="${boarddto.BOARD_CAPACITY}">
						</td>
						
						<td>날짜</td>
						<td>
							<input class="form-control" type="text" name="board_date" id="datepicker" value="${boarddto.BOARD_DATE}">
						</td>
						
						<td>지불할 가격</td>
						<td>
							<select id="selectoption">
								<option value="KRW">KRW</option>
								<option value="JPY">JPY</option>
								<option value="USD">USD</option>
							</select>
						</td>
						<td>
							<input class="form-control" id="before" type="text" name="#" value="${boarddto.PRICE }" readonly>
						</td>
						<td>
							<button type="button" id="convert" class="btn btn-success">변환</button>
						</td>
						<td>
							<input class="form-control" id="after" type="text"name="price" value="${boarddto.PRICE }" readonly>
						</td>
					</tr>
					<tr>
						<td>설명</td>
						<td colspan="5">
							<textarea name="board_content" id="ckeditor">${boarddto.BOARD_CONTENT}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace('ckeditor', {
									width : '90%',
									height : '400px'
								});
							</script>
						</td>
					</tr>
					<tr>
						<td>사진</td>
						<td>
							<input type="file" id="pic1" name="pic"> 
							<input type="file" id="pic2" name="pic"> 
							<input type="file" id="pic3" name="pic"> 
							<input type="file" id="pic4" name="pic"> <input type="file" id="pic5" name="pic">
						</td>
						<td align="right">
							<button type="button" id="addBtn" class="btn btn-success">추가</button>
						</td>
						<td>
							<button type="button" id="minusBtn" class="btn btn-danger">빼기</button>
						</td>
					</tr>
					<tr>
						<td>Meeting Point</td>
						<td colspan="5">
							<div id="container" class="row">
								<input id="pac-input" class="controls" type="text" placeholder="Search Box">
								<div id="gmap_canvas" style="height: 500px; width: auto"></div>
								<div class="actions">
									<div class="button">
										<label for="gmap_type">Type:</label> 
										<select id="gmap_type">
											<option value="--">--</option>
											<option value="art_gallery">art_gallery</option>
											<option value="atm">atm</option>
											<option value="bank">bank</option>
											<option value="bar">bar</options>
											<option value="cafe">cafe</options>
											<option value="food">food</options>
											<option value="store">store</options>
											<option value="subway_station">subway_station</option>
										</select>
									</div>
									<div class="button">
										<label for="gmap_radius">Radius:</label> 
										<select id="gmap_radius">
											<option value="500">500</option>
											<option value="1000">1000</option>
											<option value="1500">1500</option>
											<option value="5000">5000</option>
										</select>
									</div>
									<input type="hidden" id="lat" name="board_latitude" /> 
									<input type="hidden" id="lng" name="board_longitude" /> 
									<input type="hidden" id="meeting_place" name="meeting_place" /> 
									<input type="hidden" id="meeting_address" name="meeting_address" />
									<div id="button1" class="btn btn-success" onclick="findPlaces(); return false;">Search for objects</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6" align="center">
							<input type="submit" class="btn btn-success" value="등록"> 
							<input type="reset" class="btn btn-danger" value="취소">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</article>
	<!-- .content -->
</section>
<!-- #main -->