<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
</script> 
<link rel="stylesheet" type="text/css" 
href=".././resources/js/sweetalert.css">       	
<script type="text/javascript"
	src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=${sessionScope.locale}"></script>
<script type="text/javascript"
	src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script>


<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"> --%>
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
	
	function formatNumber (num) {
	    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
	}
	
	$(function() {	
		 var reg_number = /^[0-9_+,-]+[가-힣]{1,2}$/;
         var reg_ca = /^[0-9]{1,2}$/;
         
         //게시판 유효성 검증 
         $('#success').click(function() {
               if($('#board_title').val() == '') {
                  swal('글제목을 입력해주세요')
                  $('#board_title').focus();
                  return false;
               } else if(!reg_ca.test($('#board_capacity').val()) == true) {
                   swal('인원수를 숫자로 입력해주세요');
                   $('#board_capacity').focus();
                   return false;
                } else if($('#datepicker').val() == '') {
                  swal('날짜를 입력해주세요');
                  $('#datepicker').focus();
                  return false;
               }  else if(!reg_number.test($('#before').val()) == true){
                 swal('지불할 가격을 숫자로 입력해 주세요');
                 $('#before').focus();
                  return false;
              } else if(!reg_number.test($('#after').val()) == true){
                  swal('변환 버튼을 눌러주세요');
                  $('#before').focus();
                   return false;
               } else if($('#pic1').val()==''){
                  swal("사진을 1개 이상 등록해 주세요");
                  $('#pic1').focus();
                  return false;
               } else if($('#meeting_place').val() == '') {
                     swal('meeting point를 지도에서 선택해주세요');
                     $('#gmap_where').focus();
                     return false;
                  }else{
                  swal('글작성 완료','','success');
               }
            }); 
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
				swal('더 이상 추가할 수 없습니다!');
			}
		});
		$('#minusBtn').click(function() {
			if (index > 2) {
				index--;
				$('#pic' + index).val("");
				$('#pic' + index).hide();
			} else {
				swal('더 이상 삭제할 수 없습니다!')
			}
		});
		$('#gmap_where').keydown(function(e) {
			if (e.keyCode == 13) {
				$('#button2').trigger('click');
				return false;
			}
		});
	});

	$('#ckeditor').keyup(function() {
		console.log($('#ckeditor').val());
	});
	$('#submit3').click(function() {
		// ckeditor 내용 추출
		var sendNoteData = CKEDITOR.instances.ckeditor.getData();
		console.log(CKEDITOR.instances.ckeditor.getData());
		// 히든 인풋에 추출한 내용 삽입.
		$('#board_Content').val(sendNoteData);
		// 강제 서브밋
		$('#bofom').submit();
	});

	$(function(){	
		$("#convert").click(function(){
				if ($('#before').val() == ''){
					swal("값을 입력해주세요!");
					$("#before").focus();
					return false;
				}else{
						var endpoint = 'live'
						var access_key = '56370edf846ec46335b07809733c304e';

						// get the most recent exchange rates via the "live" endpoint:
						$.ajax({
						    url: 'http://apilayer.net/api/' + endpoint + '?access_key=' + access_key,   
						    dataType: 'jsonp',
						    success: function(json) {
								console.log(json);
								 if($('#selectoption').val()=='KRW'){
						        	 $('#after').val(formatNumber($('#before').val())+'원');
						        	 $('#before').val(formatNumber($('#before').val())+'원');
				        		  }else if($('#selectoption').val()=='JPY'){
				        			  swal({   title: "실시간 환율 정보",   
				        				  text:'  ¥1= ￦' +json.quotes.USDKRW/json.quotes.USDJPY,   
				        				  imageUrl: ".././resources/img/yen.png" ,confirmButtonColor: "#DD6B55"
				        					 
				        			  });
									 $('#after').val(formatNumber(Math.floor($('#before').val()* json.quotes.USDKRW/json.quotes.USDJPY))+'원');
									 $('#before').val(formatNumber($('#before').val())+'엔');
				        		  }else if($('#selectoption').val()=='USD'){
				        			  swal({   title: "실시간 환율 정보",   text: '  $1= ￦'+json.quotes.USDKRW,   imageUrl: ".././resources/img/dollar.png",confirmButtonColor: "#DD6B55" });
				        			  $('#after').val(formatNumber(Math.floor($('#before').val() * json.quotes.USDKRW))+'원');
				        			  $('#before').val(formatNumber($('#before').val())+'달러');
				        		  }
						    }
						}); 
				}
			});
			});
	$(function() {
		$("#datepicker").datepicker({
			startDate :new Date((new Date()).valueOf() + 1000*3600*24)
		}).datetimepicker('update', new Date());
	});

	var geocoder;
	var map;
	var markers = Array();
	var infos = Array();

	function initialize() {
		// prepare Geocoder
		geocoder = new google.maps.Geocoder();
		// set initial position (삼성역)
		var myLatlng = new google.maps.LatLng(37.5088652, 127.0609603);
		var myOptions = { // default map options
			zoom : 17,
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
	function findAddress() {
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

								 var image = '${pageContext.request.contextPath}/resources/img/candy_marker.png';
								var lat = document.getElementById('lat').value;
								var lng = document.getElementById('lng').value;
								var latlng = lat + ', ' + lng;

								// and then - add new custom marker
								var addrMarker = new google.maps.Marker({
									position : addrLocation,
									map : map,
									title : results[0].formatted_address,
									icon: image
								});
								markers.push(addrMarker); 


								findPlace();
							} else {
								alert('Geocode was not successful for the following reason: '
										+ status);
							}
						});



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
	   var image;
	   var type = document.getElementById('gmap_type').value;
	   if(type == 'art_gallery'){
		   image = '${pageContext.request.contextPath}/resources/img/art_gallery_marker.png';
	   }else if(type == 'atm'){
		   image = '${pageContext.request.contextPath}/resources/img/atm_marker.png';
	   }else if(type == 'bank'){
		   image = '${pageContext.request.contextPath}/resources/img/bank_marker.png';
	   }else if(type == 'bar'){
		   image = '${pageContext.request.contextPath}/resources/img/bar_marker.png';
	   }else if(type == 'cafe'){
		   image = '${pageContext.request.contextPath}/resources/img/cafe_marker.png';
	   }else if(type == 'food'){
		   image = '${pageContext.request.contextPath}/resources/img/food_marker.png';
	   }else if(type == 'store'){
		   image = '${pageContext.request.contextPath}/resources/img/store_marker.png';
	   }else if(type == 'subway_station'){
		   image = '${pageContext.request.contextPath}/resources/img/subway_station_marker.png';
	   }else{
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
			document.getElementById('lat').value = obj.geometry.location.lat();
			document.getElementById('lng').value = obj.geometry.location.lng();
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
			<h1 class="title"><spring:message code="board.guide_writeform1"/></h1>
		</div>
	</header>
	<article class="content">
		<div class="container form-group">
			<form action="" id="bofom" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_num" value="${sessionScope.user_num}">
				<table class="table table-responsive center">
					<tr>
						<td><h5><spring:message code="board.guide_writeform2"/></h5></td>
						<td colspan="5"><input class="form-control" type="text"
							name="board_title" id="board_title"></td>
					</tr>
					<tr>
						<td><spring:message code="board.guide_writeform3"/></td>
						<td><input class="form-control" type="text"
							name="board_capacity" id="board_capacity"></td>
						<td><spring:message code="board.guide_writeform4"/></td>
						<td><input class="form-control" type="text" id="datepicker"
							name="board_date"></td>
						<td><spring:message code="board.guide_writeform5"/></td>
						<td><select id="selectoption">
  							<option value="KRW">KRW</option>
  							<option value="JPY">JPY</option>
  							<option value="USD">USD</option>
						</select></td>
						<td><input class="form-control" id="before" type="text" name="#" placeholder="등록 후 수정 불가"></td>
						<td><button type="button" id="convert" class="btn btn-success"><spring:message code="board.guide_writeform5.1"/></button></td>
						<td>
							<input class="form-control" id="after" type="text" name="price" placeholder="등록 후 수정 불가">
						</td>
					</tr>
					<tr>
						<td><spring:message code="board.guide_writeform6"/></td>
						<td colspan="5">
							<textarea name="board_content" id="ckeditor"></textarea> 
							<script type="text/javascript">
							CKEDITOR.replace('ckeditor', {//해당 이름으로 된 textarea에 에디터를 적용
										width : '100%',
										height : '400px',
										//filebrowserImageUploadUrl : '' //여기 경로로 파일을 전달하여 업로드 시킨다.
									});
									</script>
						</td>
					</tr>
					<tr>
						<td><spring:message code="board.guide_writeform9"/></td>
						<td>
							<input type="file" id="pic1" name="pic">
							<input type="file" id="pic2" name="pic">
							<input type="file" id="pic3" name="pic">
							<input type="file" id="pic4" name="pic">
							<input type="file" id="pic5" name="pic">
						</td>
						<td align="center">
							<button type="button" id="addBtn" class="btn btn-success"><spring:message code="board.guide_writeform10"/></button>
							<button type="button" id="minusBtn" class="btn btn-danger"><spring:message code="board.guide_writeform11"/></button>
						</td>
					</tr>
					<tr>
						<td>Meeting Point</td>
						<td colspan="5">
							<div id="container" class="row">
								<div class="row" id="gmap_canvas" style="height: 400px;"></div>
								<div class="actions form-group row">
									<div class="button">
										<label for="gmap_where">Where:</label> <input id="gmap_where"
											class="form-control" type="text" name="gmap_where">
									</div>
									<div id="button2" class="btn btn-success"
										onclick="findAddress(); return false;">Search for
										address</div>
									<div class="button">
										<label for="gmap_type">Type:</label> <select id="gmap_type">
											<option value="--">--</option> 
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
							id="success" class="btn btn-success" value="<spring:message code="board.guide_writeform12"/>"> <input type="reset"
							class="btn btn-danger" value="<spring:message code="board.guide_writeform13"/>"></td>
					</tr>
				</table>
			</form>
		</div>
	</article>
	<!-- .content -->
</section>
<!-- #main -->

