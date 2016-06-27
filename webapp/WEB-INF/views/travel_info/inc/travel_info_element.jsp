<%-- 
   @Project : Serendipity
   @File name : travel_info_element.jsp
   @Author : 강대규
   @Date : 16.06.08
   @Desc : 구글맵에 좌표 불러오기
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
</script> 
<link rel="stylesheet" type="text/css" href=".././resources/js/sweetalert.css">  

<script src="http://maps.google.com/maps/api/js?sensor=false&language=${sessionScope.locale}" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>


<div class="breadcrumb-box">
</div>

<div class="clearfix"></div>

<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title"><spring:message code="travel.info"/></h1>
    </div>   
  </header>
  
  <div class="container">
    <article class="content">
     <div class="content portfolio portfolio4 col-sm-12 col-md-12">
     <div class="map-box bottom-padding">
         <div id="map_info" style="height: 700px;"></div>
    <script type="text/javascript">
    
    var locations = [];
    
    $(function() {
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
                      loc.push(item.local_img1);
                      loc.push(item.local_img2);
                      loc.push(item.local_img3);
                      loc.push(item.local_img4);
                      locations[index] = loc;
                  });
                  
                  var map = new google.maps.Map(document.getElementById('map_info'), {
                        zoom: 7,
                        scrollwheel : false,
                        center: new google.maps.LatLng(36, 127.1),
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                      });
              
                      var infowindow = new google.maps.InfoWindow({
                         content: document.getElementById('myModal')
                      });
                      var marker, i;
                      var image = '${pageContext.request.contextPath}/resources/img/flag_marker.png';
                      
                      
                      for (i = 0; i < locations.length; i++) { 
                         var markerLetter = String.fromCharCode(locations[i][0]);
                          
                          marker = new google.maps.Marker({
                          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                          map: map,
                          label: "",
                          animation: google.maps.Animation.DROP,
                          title: locations[i][0],
                          icon: image
                        });
                                                   
                        google.maps.event.addListener(marker, 'click', (function(marker, i) {
                          return function() {
                             $('.gmnoprint').attr("data-toggle","modal");
                              $('.gmnoprint').attr("data-target","#myModal");

                            $.ajax({
                                type : "post",
                                url : "getLocalInfo.htm",
                                data : {"local_code" : locations[i][3]},
                                success : function(data) {
                                    $('#local_name').text(locations[i][0]);
                                    $('#local_code').text(data.local_code);
                                    $('#bus_fee').text(data.bus_fee);
                                    $('#taxi_fee').text(data.taxi_fee);
                                    $('#famous_food').text(data.famous_food);
                                    $('#attraction').text(data.attraction);
                                    $('#airport').text(data.airport);
                                    $('#local_img1').attr("href", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][4]);
                                    $('.local_img1').attr("src", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][4]);
                                    $('#local_img2').attr("href", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][5]);
                                    $('.local_img2').attr("src", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][5]);
                                    $('#local_img3').attr("href", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][6]);
                                    $('.local_img3').attr("src", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][6]);
                                    $('#local_img4').attr("href", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][7]);
                                    $('.local_img4').attr("src", "${pageContext.request.contextPath}/resources/img/background_img/" + locations[i][7]);
                                                               
                                }
                            });
                            
                            $.ajax({
                                type : "post",
                                url : "getLocalReviewList.htm",
                                data : {"local_code" : locations[i][3]},
                                success : function(data) {
                                   var list = "";
                                    $.each(data, function(index, item) {
                                    	console.log("item : "+item.review_content);
                                        $('#review_title'+index).text(item.review_title);
                                         $('#review_content'+index).text(item.review_content);
                                         $('#review_content'+index).attr('href','${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num='+item.review_num);
                                         $('#review_imglink'+index).attr('href','${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num='+item.review_num);
                                         $('#review_titlelink'+index).attr('href','${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num='+item.review_num);
                                         $('#review_img'+index).attr('src','${pageContext.request.contextPath}/resources/img/review_upload/'+item.review_picture1);
                                    });
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
     </div>
     </div>
   </article><!-- .content -->
  </div>
</section><!-- #main -->

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
                  <li class="active"><a href="#localInfo">지역정보</a></li>
                  <li><a href="#localImg">관련사진</a></li>
                  <li><a href="#review">여행후기</a></li>
               </ul>
               <!-- .nav-tabs -->
               <div class="tab-content">
                  <div class="tab-pane active" id="localInfo">
                  <table class="table table-bordered">
           <thead>
              <tr>
                 <th colspan="6" class=""><span id="local_name"></span><spring:message code="travel.inca2.5"/></th>
              </tr>
           </thead>
           
           <tbody>
              <!--1번 -->
              <tr>
                 <td rowspan="2">
                 <div data-appear-animation="bounceInLeft">
                    <div class="icon">
                     <div class="livicon" data-n="phone" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca3"/></td>
                 <td rowspan="2">
                 <div data-appear-animation="bounceInUp">
                    <div class="icon">
                     <div class="livicon" data-n="truck" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca4"/></td>
              
              </tr>
              <tr>
                   <td><span id="local_code"></span></td>
                  <td><span id="bus_fee"></span></td>
              </tr>

              <!--2번 -->
              <tr>
              
                 <td rowspan="2">
                 <div data-appear-animation="bounceInRight">
                    <div class="icon">
                     <div class="livicon" data-n="car" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca5"/></td> 
              
              
              <td rowspan="2">
                 <div data-appear-animation="bounceInRight">
                    <div class="icon">
                     <div class="livicon" data-n="pacman" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca6"/></td> 
              </tr>
              
              <tr>
                 <td><span id="taxi_fee"></span></td>
                 <td><span id="famous_food"></span></td>
              </tr>

              <!--3번 -->
              <tr>
                 <td rowspan="2">
                 <div data-appear-animation="bounceInLeft">
                    <div class="icon">
                     <div class="livicon" data-n="camera" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca7"/></td>
                 <td rowspan="2">
                 <div data-appear-animation="bounceInDown">
                    <div class="icon">
                     <div class="livicon" data-n="plane-up" data-s="42" data-c="000" data-hc="0"></div>
                    </div>
                 </div>
                 </td>
                 <td><spring:message code="travel.inca8"/></td>
                 
              </tr>
              <tr>
                 <td><span id="attraction"></span></td>
                 <td><span id="airport"></span></td>
                 
              </tr>
           </tbody>
        </table>
            </div>
			<!-- 사진추가부분 2-->
              <div class="tab-pane" align="center" id="localImg">
              	<div data-appear-animation="bounceInUp">
               	<div class="row">
      <div class="content gallery col-sm-12 col-md-12">
      <div class="row">
        <!-- 여행정도 사진1 -->
        <div class="images-box col-sm-3 col-md-3">
         <a class="gallery-images" rel="fancybox" id="local_img1">
           <img class="replace-2x img-list2 local_img1" alt="" width="120" height="100">
           <span class="bg-images"><i class="fa fa-search"></i></span>
         </a>
        </div><!-- .images-box -->
        <!-- 여행정도 사진2 -->
        <div class="images-box col-sm-3 col-md-3">
         <a class="gallery-images" rel="fancybox" id="local_img2">
           <img class="replace-2x img-list2 local_img2" alt="" width="120" height="100">
           <span class="bg-images"><i class="fa fa-search"></i></span>
         </a>
        </div>
        <!-- 여행정도 사진3 -->
        <div class="images-box col-sm-3 col-md-3">
         <a class="gallery-images" rel="fancybox" id="local_img3">
           <img class="replace-2x img-list2 local_img3" alt="" width="120" height="100">
           <span class="bg-images"><i class="fa fa-search"></i></span>
         </a>
        </div>
        <!-- 여행정도 사진4 -->
        <div class="images-box col-sm-3 col-md-3">
         <a class="gallery-images" rel="fancybox" id="local_img4">
           <img class="replace-2x img-list2 local_img4" alt=""width="120" height="100">
           <span class="bg-images"><i class="fa fa-search"></i></span>
         </a>
        </div>
        
        
        
      </div>
      </div><!-- .content -->
    </div>
           </div>
          </div>

                  <div class="tab-pane"id="review">
                  <div class="title-box">
         <a href="${pageContext.request.contextPath}/travel_review/review_list.htm" class="btn">More <span class="glyphicon glyphicon-arrow-right"></span></a>
        </div>
        <ul class="latest-posts" id="review_list">
            <c:forEach var="i" begin="0" end="2" step="1">
            <li>
                 <a href="#" id="review_imglink${i}"><img class="image img-circle replace-2x" id="review_img${i}" src="content/img/product-1-84.jpg" alt="" title="" width="84" height="84" data-appear-animation="rotateIn"></a>
                 <div class="meta">
                  <a href="#" id="review_titlelink${i}"><span class="daekyu" id="review_title${i}"></span></a>
                 </div>
                 <div class="description">
                  <a href="#" id="review_content${i}">
                  </a>
                 </div>
            </li>
            </c:forEach>
        </ul>
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