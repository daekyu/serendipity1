<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript"> 
	$(function(){
		$.ajax({
			type : "post",
			url : "review_list.htm",
			data : {
				"sort" : <%= request.getParameter("sort")%>
				"local_code" : <%= request.getParameter("local_code")%>
			},
			success : function(data){
				console.log("성공");
			}
		});
	});
</script>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title"><spring:message code="board.review"/></h1>
		</div>
	</header>

	<div class="container">
		<div class="row">
			<div id="catalog" class="content col-sm-12 col-md-12">
				<div class="category-img">
					<img class="replace-2x" src="content/img/category-img.jpg"
						width="870" height="370" alt="">
					<div class="description">Automation &amp; Integration
						technology to fit any lifestyle</div>
				</div>

				<div class="toolbar clearfix">
					<div class="grid-list">
						<a href="shop-catalog-grid.html" class="grid"> <span
							class="glyphicon glyphicon-th-large"></span>
						</a> <span class="grid"> <span
							class="glyphicon glyphicon-th-list"></span>
						</span>
					</div>
					
					<div class="sort-catalog">
						<div class="btn-group show-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#">지역: <span>12</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
							<li><a href="">전체</a></li>
							<c:forEach var="i" items="${local_list}">
								<li><a href="review_list.htm?sort=${sort}&local_code=${i.local_code}">${i.local_name}</a></li>
							</c:forEach>
							</ul>
						</div>
						<!-- .show -->
					</div>
					<!-- .sort-catalog -->

					<!-- 정렬기준을 바꾸는곳. 정해지면 바꾸자. -->
					<div class="sort-catalog">
						<div class="btn-group sort-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#">Sort by: <span>Rating</span>
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="review_list.htm?sort=review_num&local_code=${local_code}">최신순</a></li>
								<li><a href="review_list.htm?sort=like_count&local_code=${local_code}">좋아요순</a></li>
								<li><a href="review_list.htm?sort=reply_count&local_code=${local_code}">댓글순</a></li>
							</ul>
						</div>
						<!-- .sort-by -->
					</div>
					<!-- .sort-catalog -->

					

					<!-- <div class="sort-catalog">
						<div class="btn-group show-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#">정렬: <span>12</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">최신순</a></li>
								<li><a href="#">좋아요순</a></li>
								<li><a href="#">댓글순</a></li>
							</ul>
						</div> -->
					</div>
					<!-- .price-regulator -->
				</div>
				<!-- 정렬기준 끝 -->

				<div class="clearfix"></div>

				<div class="products list row">
				<c:choose>
					<c:when test="${sessionScope.user_num == null}">
						<p>로그인 후 사용하세요</p>
					</c:when>
					<c:otherwise>
					<c:forEach var="i" items="${reviewList}">
						<div class="product">
							<div class="col-sm-4 col-md-4">
								<a href="review_detail.htm?review_num=${i.REVIEW_NUM}" class="product-image"> <!-- <span class="sale"></span> -->
									<c:choose>
										<c:when test="${i.REVIEW_PICTURE1 eq '사진없음'}">
											<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
										</c:when>
										<c:otherwise>
											<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${i.REVIEW_PICTURE1}" width="620" height="550" alt="">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="col-sm-8 col-md-8">
								<h3 class="price">
									<a href="review_detail.htm?review_num=${i.REVIEW_NUM}">${i.REVIEW_TITLE}</a>
								</h3>
								<div class="excerpt">
									<span>ID : ${i.ID}</span><br> <span>지역:
										${i.LOCAL_NAME}</span><br> <span>작성일 : ${i.REVIEW_DATE}</span>
								</div>
								<div class="excerpt">
									<a href="review_detail.htm?review_num=${i.REVIEW_NUM}">${i.REVIEW_CONTENT}</a>
								</div>
								<div class="price-box">
									<span class="excerpt">${i.LIKE_COUNT} Like(s)</span>
								</div>
								<div class="actions">
									<!-- 좋아요버튼 -->
									<a href="#" class="add-wishlist"> <svg x="0" y="0"
											width="16px" height="16px" viewBox="0 0 16 16"
											enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e"
												d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
									</a>
									<!-- 좋아요버튼 끝 -->
								</div>
								<!-- .actions -->
							</div>
						</div>
						<!-- .product -->
					</c:forEach>
					</c:otherwise>
				</c:choose>
					<!-- <div class="product">
			<div class="col-sm-4 col-md-4">
			  <a href="shop-product-view.html" class="product-image">
				<span class="sale"></span>
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			</div>
			<div class="col-sm-8 col-md-8">
			  <h3 class="price">
				<a href="#">ABCD</a>
			  </h3>
			  <div class="excerpt">
				<span>이름: 조인성</span><br>
				<span>장소: 발리</span><br>
			  	<span>작성일 : 16.06.01</span>
			  </div>
			  <div class="excerpt">
				<a href="#">간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 </a>
			  </div>
			  <div class="price-box">
				<a href="#" class="add-review"><span class="excerpt">5 Like(s)</span></a>
			  </div>	
			  <div class="actions">
			  	좋아요버튼
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				좋아요버튼 끝
			  </div>.actions
			</div>
		  </div>.product
		  
		  <div class="product">
			<div class="col-sm-4 col-md-4">
			  <a href="shop-product-view.html" class="product-image">
				<span class="sale"></span>
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			</div>
			<div class="col-sm-8 col-md-8">
			  <h3 class="price">
				<a href="#">ABCD</a>
			  </h3>
			  <div class="excerpt">
				<span>이름: 조인성</span><br>
				<span>장소: 발리</span><br>
			  	<span>작성일 : 16.06.01</span>
			  </div>
			  <div class="excerpt">
				<a href="#">간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 </a>
			  </div>
			  <div class="price-box">
				<a href="#" class="add-review"><span class="excerpt">5 Like(s)</span></a>
			  </div>	
			  <div class="actions">
			  	좋아요버튼
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				좋아요버튼 끝
			  </div>.actions
			</div>
		  </div>.product -->



					<div class="pagination-box">
						<div align="center">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i
											class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${page-1}">
											<i class="fa fa-angle-left"></i>
									</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:choose>
									<c:when test="${a==page}">
										<li class="active"><span>${a}</span></li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${a}">
												${a}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page>=maxpage}">
									<li class="disabled"><span><i
											class="fa fa-angle-right"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						</div>
					</div>
					<!-- .pagination-box -->
					<div align="right">
					<c:choose>
						<c:when test="${sessionScope.user_num != null}">
							<a href="${pageContext.request.contextPath}/travel_review/review_writeform.htm?user_num=${sessionScope.user_num}"
								class="btn btn-default">후기작성</a>
						</c:when>
					</c:choose>
					</div>
				</div>
				<!-- .content -->
			</div>
		</div>
		<!-- .container -->
</section>
<!-- #main -->
