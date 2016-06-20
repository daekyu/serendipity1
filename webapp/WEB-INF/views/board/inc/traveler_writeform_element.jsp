<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="resources/js/sweetalert.min.js"></script> <link rel="stylesheet" type="text/css" href="resources/js/sweetalert.css">	
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.min.js"></script> <link rel="stylesheet" type="text/css" href="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.css">		

<script type="text/javascript"
	src="https://www.google.com/jsapi?language=${sessionScope.locale}"></script>
<script type="text/javascript"
   src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=${sessionScope.locale}"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript"
	src="http://localhost:8090/serendipity/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="jquery.numberformatter.js"></script>
	
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"> --%>
<script type="text/javascript">
	window.CKEDITOR_BASEPATH = 'http://example.com/path/to/libs/ckeditor/';

	
	function formatNumber (num) {
	    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
	}
	
	
	
	$(function(){
		
	
		
		$('#pic2').hide();
		$('#pic3').hide();
		$('#pic4').hide();
		$('#pic5').hide(); 
		
		var index = 2;
		$('#addBtn')
				.click(
						function() {
							if (index <= 5) {
								/* $('#addPic')
										.append(
												'<input type="file" id="pic' + index + '" name="board_Picture' + index + '">'); */
								$('#pic'+index).show();
								index++;
							} else {
								alert('더 이상 추가할 수 없습니다');
							}
						});
		$('#minusBtn').click(function() {
			if (index > 2) {
				index--;
				$('#pic'+index).val("");
				$('#pic'+index).hide();
				/* $('#pic' + index).remove(); */
			} else {
				alert('더 이상 삭제할 수 없습니다.');
			}
		});
		
		$('#gmap_where').keydown(function (e) {
		    if(e.keyCode == 13)
		    {
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
					alert("값을 입력해주세요");
					$("#before").focus();
					return false;
				}else{
					/* $.ajax({
			        	  type : "post",
			        	  url : "traveler_writeform.htm",
			        	  data : {"before" : $('#before').val()},
			        	  success : function(data) {
			        		  if($('#selecoption').val()=='KRW'){
			        			  
			        		  }else if($('#selecoption').val()=='JPY'){
			        			  
			        		  }else($('#selecoption').val()=='USD'){
			        			  
			        		  }
			        		  
			        		  }
			        	  
				
			          }); */
			          
						var endpoint = 'live'
						var access_key = '56370edf846ec46335b07809733c304e';

						// get the most recent exchange rates via the "live" endpoint:
						$.ajax({
						    url: 'http://apilayer.net/api/' + endpoint + '?access_key=' + access_key,   
						    dataType: 'jsonp',
						    success: function(json) {
								console.log(json);
								
						        // exchange rata data is stored in json.quotes
						       /*  alert('한화 달러');
						        alert(json.quotes.JPYUSD);
						        alert(json.quotes.USDGBP);
						        alert(json.quotes.USDJPY);
						        alert(json.quotes.USDKRW);
						        // source currency is stored in json.source
						        alert(json.source);
						        
						        // timestamp can be accessed in json.timestamp
						        alert(json.timestamp); */
						        
						        //$('#after').val($('#before').val() * )
						        if($('#selectoption').val()=='KRW'){
						        	 $('#after').val(formatNumber($('#before').val()));
				        		  }else if($('#selectoption').val()=='JPY'){
				        			  swal({   title: "실시간 환율 정보",   
				        				  text:'  ¥1= ￦' +json.quotes.USDKRW/json.quotes.USDJPY,   
				        				  imageUrl: ".././resources/img/yen.png" ,confirmButtonColor: "#DD6B55"
				        					 
				        			  });
									 /* alert('실시간 환율 정보 JYP->KRW:'+json.quotes.USDKRW/json.quotes.USDJPY); */
									 $('#after').val(formatNumber(Math.floor($('#before').val()* json.quotes.USDKRW/json.quotes.USDJPY)));
								
				        		  }else if($('#selectoption').val()=='USD'){
				        			  swal({   title: "실시간 환율 정보",   text: '  $1= ￦'+json.quotes.USDKRW,   imageUrl: ".././resources/img/dollar.png",confirmButtonColor: "#DD6B55" });
				        			  $('#after').val(formatNumber(Math.floor($('#before').val() * json.quotes.USDKRW)));
				        		  }
						    }
						});
					
					
					
				
			          
				}
			});
			
			});
			

	
		$(function(){
 		$("#datepicker").datepicker({startDate:new Date()}).datetimepicker('update', new Date());
 			});
	
		
		// set endpoint and your access key
		
	
		
	
 


		
	var geocoder;
	var map;
	var markers = Array();
	var infos = Array();

	function initialize() {
		// prepare Geocoder
		geocoder = new google.maps.Geocoder();

		// set initial position (기본으로 삼성역)
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
			<h1 class="title"><spring:message code="board.traveler_writeform1"/></h1>
		</div>
	</header>

	<article class="content">
		<div class="container">
			<form action="" id="bofom" method="post" enctype="multipart/form-data">
				<input type="hidden" name="user_num" value="${sessionScope.user_num}">
				<table class="table center">
					<tr>
						<td><h6><spring:message code="board.traveler_writeform2"/></h6></td>
						<td colspan="5"><input class="form-control" type="text" id="title_text"
							name="board_title"></td>
					</tr>
					<tr>
						<td><h6><spring:message code="board.traveler_writeform3"/></h6></td>

						<td><input class="form-control" type="text" id="datepicker" name="board_date"></td>

						<td><h6><spring:message code="board.traveler_writeform4"/></h6></td>
						<td><select id="selectoption">
  							<option value="KRW">KRW</option>
  							<option value="JPY">JPY</option>
  							<option value="USD">USD</option>
  						
						</select></td>
						<td><input class="form-control" id="before" type="text" name="#"></td>
						<td><button type="button" id="convert" class="btn btn-success">변환</button></td>
						<td><input class="form-control" id="after" type="text" name="price"></td>
						

						<%-- <td><input class="form-control" type="text"></td>

						<td><spring:message code="board.traveler_writeform4"/></td>
						<td><input class="form-control" type="text" name="price"></td> --%>

					</tr>
					<tr>
						<td><h6><spring:message code="board.traveler_writeform5"/></h6></td>
						<td colspan="5">
							<!-- <textarea class="form-control" style="resize:none; height:400px;" wrap="soft" name="board_Content"></textarea> -->
							<!--  <textarea cols="80" id="contents" name="contents" rows="10"></textarea> -->
							<textarea name="board_content" id="ckeditor"></textarea> <script
								type="text/javascript">
								CKEDITOR.replace('ckeditor', {
									width : '90%',
									height : '400px'

								});
							</script>
						</td>
					</tr>

					<tr>
						<td><h6><spring:message code="board.traveler_writeform6"/></h6></td>
						<!-- <td id="addPic" colspan="4"> -->
						<td>
							<input type="file" id="pic1" name="pic">
							<input type="file" id="pic2" name="pic">
							<input type="file" id="pic3" name="pic">
							<input type="file" id="pic4" name="pic">
							<input type="file" id="pic5" name="pic">
						</td>
						<td align="center">
							<button type="button" id="addBtn" class="btn btn-success"><spring:message code="board.traveler_writeform9"/></button>
							<button type="button" id="minusBtn" class="btn btn-danger"><spring:message code="board.traveler_writeform10"/></button>
						</td>
					</tr>




					<tr>
						<td><h6>Meeting Point</h6></td>
						<td colspan="5">
							<div id="container" class="row">
								<div id="gmap_canvas" style="height: 400px;width:auto"></div>
								<div class="actions">
									<div class="button">
										<label for="gmap_where">Where:</label> 
										<input id="gmap_where"
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
							id="success" class="btn btn-success" value="<spring:message code="board.traveler_writeform11"/>"> <input
							type="reset" class="btn btn-danger" value="<spring:message code="board.traveler_writeform12"/>"></td>
					</tr>
				</table>
			</form>
		</div>
	</article>
	<!-- .content -->

					
<!-- .content -->

</section>
<!-- #main -->
