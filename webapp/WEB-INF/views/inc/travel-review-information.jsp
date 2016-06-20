<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	  <div class="row">
		<div class="col-sm-12 col-md-6 promo-partners bottom-padding">
		  <div class="title-box">
		  	<a href="#" class="btn">More <span class="glyphicon glyphicon-arrow-right"></span></a>
			<h2 class="title">Travel Information</h2>
		  </div>
		  <div class="row manufactures manufactures-list">
			
			여행정보 대표로 3개만 나오게 하는부분. 서울 경기 부산 정도만 넣으면 어떨지?
			<div class="make-wrapper">
			  <a href="#" class="make">
				<img class="replace-2x" src="content/img/make-2.png" width="128" height="128" alt="">
			  </a>
			</div>
				
			<div class="make-wrapper">
			  <a href="#" class="make">
				<img class="replace-2x" src="content/img/make-3.png" width="128" height="128" alt="">
			  </a>
			</div>
				
			<div class="make-wrapper">
			  <a href="#" class="make">
				<img class="replace-2x" src="content/img/make-4.png" width="128" height="128" alt="">
			  </a>
			</div>
		  </div>
		  <p> 여행정보입니당~~~ </p>
		  <p> 자세한 정보는 위에 더보기를 눌러라~~~ </p>
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