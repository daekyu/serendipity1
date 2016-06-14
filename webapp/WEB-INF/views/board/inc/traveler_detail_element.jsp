<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#delete').click(function(){
				if(confirm("글을 삭제 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/board/board_delete.htm?board_num=${dto.board_Num}&check=1";
				}else{
				    return false;
				}
			});
		});
		
		var map;
		var geocoder;
		
		function initialize() {
		    // prepare Geocoder
		    geocoder = new google.maps.Geocoder();

		    // set initial position (삼성역)
		    var myLatlng = new google.maps.LatLng(37.4909201, 127.00675260000003);
		    /* +${dto.board_Latlng} */
		    
		    var myOptions = { // default map options
		        zoom: 14,
		        center: myLatlng,
		        mapTypeId: google.maps.MapTypeId.ROADMAP
		    };
		    
		    var mark = new google.maps.Marker({
		        position: myLatlng,
		        map: map
		    });
		    
		    map = new google.maps.Map(document.getElementById('gmap_detail'), myOptions);
		}
		
		function createMarker(obj) {

		    // prepare info window
		    var infowindow = new google.maps.InfoWindow({
		        content: '<img src="' + obj.icon + '" /><font style="color:#000;">' + obj.name + 
		        '<br />Rating: ' + obj.rating + '<br />Vicinity: ' + obj.vicinity+
		        '<br />LatLng: ' + obj.geometry.location+'</font>'
		    });

		    // add event handler to current marker
		    google.maps.event.addListener(mark, 'click', function(){
		        clearInfos();
		        infowindow.open(map,mark);
		    });
		}		
		
		google.maps.event.addDomListener(window, 'load', initialize);
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
				<img class="replace-2x" alt="" src="../content/1212.JPG" data-zoom-image="../content/1212.JPG" width="500" height="500">
			  </div><!-- .general-img -->
			  
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
				  <a href="#" data-image="content/img/single-1.jpg" data-zoom-image="content/img/single-1.jpg">
					<img class="replace-2x" alt="" src="content/img/single-1.jpg" width="700" height="700">
				  </a>
				  <a class="active" href="#" data-image="content/img/single-2.jpg" data-zoom-image="content/img/single-2.jpg">
					<img class="replace-2x" alt="" src="content/img/single-2.jpg">
				  </a>
				  <a href="#" data-image="content/img/single-3.jpg" data-zoom-image="content/img/single-3.jpg">
					<img class="replace-2x" alt="" src="content/img/single-3.jpg" width="700" height="700">
				  </a>
				  <a href="#" data-image="content/img/single-1.jpg" data-zoom-image="content/img/single-1.jpg">
					<img class="replace-2x" alt="" src="content/img/single-1.jpg" width="700" height="700">
				  </a>
				  <a href="#" data-image="content/img/single-2.jpg" data-zoom-image="content/img/single-2.jpg">
					<img class="replace-2x" alt="" src="content/img/single-2.jpg" width="700" height="700">
				  </a>
				  <a href="#" data-image="content/img/single-3.jpg" data-zoom-image="content/img/single-3.jpg">
					<img class="replace-2x" alt="" src="content/img/single-3.jpg" width="700" height="700">
				  </a>
				</div><!-- #thumblist -->
			  </div><!-- .thumblist -->
			</div>
		  </div>
		  
		  <div class="col-sm-7 col-md-7">
			<div class="reviews-box table-responsive">
			  <a href="#reviews" class="add-review">${dto.board_Title}</a>
			</div>
			<table class="table table-striped table-bordered text-center my-orders-table">
				<thead>
					<tr class="first last">
						<th>aaaa</th>
						<th>bbbb</th>
						<th>cccc</th>
						<th>dddd</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>aaaa</td>
						<td>bbbb</td>
						<td>cccc</td>
						<td>dddd</td>
					</tr>
				</tbody>
			</table>
			<div class="description">
			  
			</div>
			
			<div class="price-box">
			  <span class="price">${dto.price} / a day</span>
			</div>
			
			<c:choose>
				<c:when test="${sessionScope.user_num == dto.user_Num}">
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/board/traveler_modify.htm?board_num=${dto.board_Num}"><i class="livicon shadowed" data-s="24" data-n="pen" data-c="white" data-hc="0"></i> Modify</a>
					<a class="btn btn-danger btn-sm" id="delete"><i class="livicon shadowed" data-s="24" data-n="trash" data-c="white" data-hc="0"></i> Delete</a>
				</c:when>
				
				<c:otherwise>
					<a class="btn add-cart btn-default btn-lg" href="">신청하기</a>
				</c:otherwise>
			</c:choose>
		  </div>
		</div>
		
		
        <ul class="nav nav-tabs">
         <li><a href="#description">Description</a></li>
         <li><a href="#reviews">Meeting Point</a></li>
        </ul><!-- .nav-tabs -->   
        <div class="tab-content">
         <div class="tab-pane active" id="description">
            ${dto.board_Content}<br><br><br><br>
           		 추가사항
           		 강 : 스마트에디터를 써보자 이곳에~~~~~~~~~~~~~~~ 
         </div>
         <div class="tab-pane" id="reviews">
           <div class="timeline-content border border-danger" data-appear-animation="fadeInRight">
         <div class="entry-content">
           <div class="map-box not-margin">
            <div id="gmap_detail" style="height:500px"></div>
           </div>
         </div>
        </div>
         </div><!-- #reviews -->
        </div><!-- .tab-content -->
      
        
      <div class="clearfix"></div>
      </article><!-- .content -->
    </div>
  </div>
</div><!-- #main -->