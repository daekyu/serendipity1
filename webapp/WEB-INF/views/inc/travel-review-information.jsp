<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.6&appId=1189771741041986";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
</script>
<div class="container">
	  <div class="row">
	  <br>
		<div class="col-sm-12 col-md-6 promo-partners bottom-padding">
		  <div class="row manufactures manufactures-list">
			<div class="product-tab">
		  <ul class="nav nav-tabs">
			<li class="active">
				<a href="#our_facebook">
			  		<i class="livicon" data-n="facebook-alt" data-hc="0"></i>
				</a>
			</li>
			<li>
				<a href="#our_instagram">
			  		<i class="livicon" data-n="instagram"></i>
				</a>
			</li>
		  </ul><!-- .nav-tabs -->	
		  
		  <div class="tab-content">
			<div class="tab-pane active" id="our_facebook">
				<div class="fb-page" data-href="https://www.facebook.com/serendipity112th/" data-tabs="timeline" data-width="550px" data-height="350px" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/serendipity112th/" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/serendipity112th/">Serendipity by KOSTA Team 1</a></blockquote></div>

			</div>
			<div class="tab-pane" id="our_instagram">
				<img src="./resources/img/instagram.JPG">
				<!-- LightWidget WIDGET --><script src="//lightwidget.com/widgets/lightwidget.js"></script><iframe src="//lightwidget.com/widgets/d10f6547bade57488202e5fe79a00a33.html" id="lightwidget_d10f6547ba" name="lightwidget_d10f6547ba"  scrolling="no" allowtransparency="true" class="lightwidget-widget" style="width: 80%; border: 0; overflow: hidden;"></iframe>
			</div><!-- #reviews -->
		  </div><!-- .tab-content -->
		</div>
		  </div>
		</div><!-- .promo-partners -->
		
		<div class="col-sm-12 col-md-6">
		  <div class="title-box">
			<a href="${pageContext.request.contextPath}/travel_review/review_list.htm" class="btn">More <span class="glyphicon glyphicon-arrow-right"></span></a>
			<h2 class="title">인기 여행후기</h2>
		  </div>
		  <ul class="latest-posts">
		  	<c:choose>
		  		<c:when test="${Rlist_count eq 0}">
				 	글이 존재하지 않습니다.
				 </c:when>
				 <c:otherwise>
				 	<c:forEach var="i" items="${review_list}">
				 	<li>
			  			<a href="${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num=${i.review_num}"><img class="image img-circle replace-2x" src="${pageContext.request.contextPath}/resources/img/review_upload/${i.review_picture1}" alt="" title="" width="84" height="84" data-appear-animation="rotateIn"></a>
			  			<div class="meta">
							<a href="${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num=${i.review_num}"><span class="daekyu">${i.review_title}</span></a>
			  			</div>
			  			<div class="description">
							<a href="${pageContext.request.contextPath}/travel_review/review_detail.htm?review_num=${i.review_num}">
				  				${i.review_content}
							</a>
			  			</div>
					</li>
					</c:forEach>
				 </c:otherwise>
			</c:choose>
		  </ul>
		</div>
	  </div>
	</div>