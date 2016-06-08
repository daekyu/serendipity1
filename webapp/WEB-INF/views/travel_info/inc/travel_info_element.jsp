<%-- 
	@Project : Serendipity
	@File name : travel_info_element.jsp
	@Author : 강대규
	@Date : 16.06.08
	@Desc : 구글맵에 좌표 불러오기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
   
<div class="breadcrumb-box">
</div>

<div class="clearfix"></div>

<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title">여행정보</h1>
    </div>	
  </header>
  
  <div class="container">
    <article class="content">
	  <div class="content portfolio portfolio4 col-sm-12 col-md-12">
	  <div class="map-box bottom-padding">
		<!-- <div
		  class="map-canvas"
		  data-zoom="7"
		  data-lat="35.748441"
		  data-lng="127.985664"
		  data-title="Bryant Park"
		  data-content="New York, NY"
		   style="height:700px;"></div> -->
		   <div id="map" style="height: 700px;"></div>
  <script type="text/javascript">
  
  var locations = [];
  
  $(function() {
    /* var locations = [
                     
      ['삼익사이버 아파트', 37.0211403, 127.0971617],
      ['국립축산과학원 축산자원개발부', 36.93309333, 127.10487485]
    ]; */
    
    
	
    $.ajax({
    	type : "post", 
    	url : "getLocalList.htm",
    	success : function(data) {
    			
    			$.each(data, function(index, item) {
    				var loc = [];
    				loc.push(item.local_name);
    				loc.push(item.local_latitude); 
    				loc.push(item.local_longitude);
    				loc.push(item.local_code);
    				//console.log(loc + "/" + index);
    				
    				locations[index] = loc;
    			});
    			
    			var map = new google.maps.Map(document.getElementById('map'), {
    			      zoom: 7,
    			      center: new google.maps.LatLng(36, 127.1),
    			      mapTypeId: google.maps.MapTypeId.ROADMAP
    			    });
    			    var infowindow = new google.maps.InfoWindow();
    			    var marker, i;
    			    for (i = 0; i < locations.length; i++) {  
    			      marker = new google.maps.Marker({
    			        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    			        map: map
    			      });
    			      google.maps.event.addListener(marker, 'click', (function(marker, i) {
    			        return function() {
    			          infowindow.setContent(locations[i][0]);
    			          infowindow.open(map, marker);
    			          console.log(locations[i][3]);
    			          
    			          $.ajax({
    			        	  type : "post",
    			        	  url : "getLocalInfo.htm",
    			        	  data : {"local_code" : locations[i][3]},
    			        	  success : function(data) {
    			        		  console.log(data);
    			        		  $('#local_name').text(locations[i][0]);
    			        		  $('#local_code').text(data.local_code);
    			        		  $('#bus_fee').text(data.bus_fee);
    			        		  $('#taxi_fee').text(data.taxi_fee);
    			        		  $('#famous_food').text(data.famous_food);
    			        		  $('#attraction').text(data.attraction);
    			        		  $('#airport').text(data.airport);
    			        		  
    			        	  }
    			          });
    			          
    			        }
    			      })(marker, i));
    			    }
    	}
    });
    

  });
  </script> 
		   
	  </div>
	  <div class="title-box"><h3 class="title slim">관련 글</h3></div>
	  <div class="product-tab">
		  <ul class="nav nav-tabs">
			<li class="active"><a href="#description">여행정보</a></li>
			<li><a href="#reviews">여행후기</a></li>
		  </ul><!-- .nav-tabs -->	
		  <div class="tab-content">
		  
		  
		  
			<div class="tab-pane active" id="description">
	  
		<table class="table table-bordered">
		  	<thead>
		  		<tr>
		  			<th colspan="6" class=""><span id="local_name"></span>지역의 정보를 확인하세여</th>
		  		</tr>
		  	</thead>
		  	
		  	<tbody>
		  		<tr>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInLeft">
		  				<div class="icon">
							<div class="livicon" data-n="phone" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>지역번호</td>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInUp">
		  				<div class="icon">
							<div class="livicon" data-n="money" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>버스요금</td>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInRight">
		  				<div class="icon">
							<div class="livicon" data-n="car" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>택시요금</td>
		  		</tr>
		  		<tr>
		  			<td><span id="local_code"></span></td>
		  			<td><span id="bus_fee"></span></td>
		  			<td><span id="taxi_fee"></span></td>
		  		</tr>
		  		<tr>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInLeft">
		  				<div class="icon">
							<div class="livicon" data-n="pacman" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>유명한 먹거리</td>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInDown">
		  				<div class="icon">
							<div class="livicon" data-n="home" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>유명 장소</td>
		  			<td rowspan="2">
		  			<div data-appear-animation="bounceInRight">
		  				<div class="icon">
							<div class="livicon" data-n="plane-up" data-s="42" data-c="000" data-hc="0"></div>
			  			</div>
			  		</div>
			  		</td>
		  			<td>가까운 공항</td>
		  		</tr>
		  		<tr>
		  			<td><span id="famous_food"></span></td>
		  			<td><span id="attraction"></span></td>
		  			<td><span id="airport"></span></td>
		  		</tr>
		  	</tbody>
		  </table>
		<div class="clearfix"></div>
			</div>
			
			<div class="tab-pane" id="reviews">
			  
		  <div class="title-box">
			<a href="#" class="btn">More <span class="glyphicon glyphicon-arrow-right"></span></a>
		  </div>
		  <ul class="latest-posts">
			<li>
			  <a href="#"><img class="image img-circle replace-2x" src="content/img/product-1-84.jpg" alt="" title="" width="84" height="84" data-appear-animation="rotateIn"></a>
			  <div class="meta">
				<a href="#"><span class="daekyu">인기 여행기 글 제목 abcdefg...1</span></a>
			  </div>
			  <div class="description">
				<a href="#">
				  인기 여행기 글 내용 일부......1
				</a>
			  </div>
			</li>
			
			<li>
			  <a href="#"><img class="image img-circle replace-2x" src="content/img/product-1-84.jpg" alt="" title="" width="84" height="84" data-appear-animation="rotateIn"></a>
			  <div class="meta">
				<a href="#"><span class="daekyu">인기 여행기 글 제목 abcdefg...2</span></a>
			  </div>
			  <div class="description">
				<a href="#">
				  인기 여행기 글 내용 일부......2
				</a>
			  </div>
			</li>
			
			<li>
			  <a href="#"><img class="image img-circle replace-2x" src="content/img/product-1-84.jpg" alt="" title="" width="84" height="84" data-appear-animation="rotateIn"></a>
			  <div class="meta">
				<a href="#"><span class="daekyu">인기 여행기 글 제목 abcdefg...3</span></a>
			  </div>
			  <div class="description">
				<a href="#">
				  인기 여행기 글 내용 일부......3
				</a>
			  </div>
			</li>
		  </ul>
		
		  </div><!-- .tab-content -->
		</div>
	  
	  
	  
	  </div>
	  </div>
	</article><!-- .content -->
  </div>
</section><!-- #main -->