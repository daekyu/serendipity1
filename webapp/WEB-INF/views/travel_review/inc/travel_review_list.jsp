<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	function getContextPath() {
	   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	
	function isLike(index) {
		$.ajax({
			type : "post",
			url : "is_like.htm",
			data : {
				"user_num" : '${sessionScope.user_num}',
				"review_num" : $('#review_num_'+index).val()
			},
			
			success : function(data) {
				if(data>0) {
					$('#btn_like_'+index).hide();
					$('#btn_like2_'+index).show();
				} else {
					$('#btn_like2_'+index).hide();
					$('#btn_like_'+index).show();
				}
			}
		});
	}
	
	function like(index) {
		$.ajax({
			type : "post",
			url : "review_like.htm",
			data : {"user_num" : '${sessionScope.user_num}',
					"review_num" : $('#review_num_'+index).val()		
			},
			success : function(data) {
				$('#likeCount_'+index).text(data);
				$('#btn_like_'+index).hide();
				$('#btn_like2_'+index).show();
				
				isLike();
			}
		});
	}
	
	function unlike(index) {
		$.ajax({
			type : "post",
			url : "delete_review_like.htm",
			data : {"user_num" : '${sessionScope.user_num}',
					"review_num" : $('#review_num_'+index).val()		
			},
			success : function(data) {
				$('#likeCount_'+index).text(data);
				$('#btn_like2_'+index).hide();
				$('#btn_like_'+index).show();
				isLike();
			}
		});
	}
	
	$(function() {
		for(var i=0; i<'${review_list.size()}'; i++) {
			$('#btn_like_' + i).hide();
			$('#btn_like2_' + i).hide();
			isLike(i);
		}
		
		
		
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
					<img class="replace-2x" src=".././resources/img/background_img/KLIVEK-PopHologramHall.jpg"
						width="870" height="370" alt="">
					<div class="description">소중했던 여행경험을 함께 공유하세요.
					</div>
				</div>

				<div class="toolbar clearfix">
					<!-- <div class="grid-list">
						<a href="shop-catalog-grid.html" class="grid"> <span
							class="glyphicon glyphicon-th-large"></span>
						</a> <span class="grid"> <span
							class="glyphicon glyphicon-th-list"></span>
						</span>
					</div> -->
					
					<div class="sort-catalog">
						<div class="btn-group sort-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#"><spring:message code="board.review1"/>${local_name}<span></span></a>
							<ul class="dropdown-menu">
							<li><a href="review_list.htm?order=review_num"><spring:message code="board.review2"/></a></li>
							<c:forEach var="i" items="${local_list}">
								<c:choose>
									<c:when test="${i.local_code == '-' }"></c:when>
									
									<c:otherwise>
										<li><a href="filteringReviewList.htm?local_code=${i.local_code}">${i.local_name}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							</ul>
						</div>
						<!-- .show -->
					</div>
					<!-- .sort-catalog -->
					<c:set value="like_count" var="likeCount"/>
					<c:set value="reply_count" var="replyCount"/>
					<c:set value="review_num" var="reviewNum"/>

					<div class="sort-catalog">
						<div class="btn-group sort-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#"><spring:message code="board.review3"/> <span>${orderName}</span>
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="review_list.htm?order=review_num"><spring:message code="board.review4"/></a></li>
								<li><a href="review_list.htm?order=like_count"><spring:message code="board.review5"/></a></li>
								<li><a href="review_list.htm?order=reply_count"><spring:message code="board.review6"/></a></li>
							</ul>
						</div>
						<!-- .sort-by -->
					</div>
					<!-- .sort-catalog -->

					</div>
					<!-- .price-regulator -->
				</div>

				<div class="clearfix"></div>

				<div class="products list row">
				<c:choose>
					<c:when test="${sessionScope.user_num == null}">
						<p><spring:message code="board.review7"/></p>
					</c:when>
					<c:otherwise>
					<c:forEach var="i" items="${review_list}" varStatus="j">
						<div class="product">
							<div class="col-sm-4 col-md-4">
								<a href="review_detail.htm?review_num=${i.REVIEW_NUM}" class="product-image">
									<c:choose>
										<c:when test="${i.REVIEW_PICTURE1 eq '사진없음'}">
											<img class="replace-2x review-list" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
										</c:when>
										<c:otherwise>
											<img class="replace-2x slid-img img-list" src="${pageContext.request.contextPath}/resources/img/review_upload/${i.REVIEW_PICTURE1}" width="550" height="550" alt="">
										</c:otherwise>
									</c:choose>
								</a>
							</div>
							<div class="col-sm-8 col-md-8">
								<h3 class="price">
									<a href="review_detail.htm?review_num=${i.REVIEW_NUM}">${i.REVIEW_TITLE}</a>
								</h3>
								<div class="excerpt">
									<span><spring:message code="board.review8"/> ${i.ID}</span><br> 
									<span><spring:message code="board.review9"/>${i.LOCAL_NAME}</span><br> 
									<span><spring:message code="board.review10"/> ${i.REVIEW_DATE}</span><br>
									<span><spring:message code="board.review11"/> ${i.REPLY_COUNT}</span>
								</div>
								<div class="excerpt">
									
								</div>
								<div class="price-box">
									 <spring:message code="board.review13"/>&nbsp;&nbsp;<span class="excerpt" id="likeCount_${j.index}">${i.LIKE_COUNT}</span>
								</div>
								<div class="actions">
								
									<!-- 좋아요버튼 -->
									<input type="hidden" id="review_num_${j.index}" value="${i.REVIEW_NUM}">
									<div class="icon circle bg icon-40" onclick="like(${j.index})" data-s="48" data-op="0" data-c="#c10841" data-hc="0" id="btn_like_${j.index}"><i class="fa fa-heart-o"></i></div><div class="icon circle bg icon-40" onclick="unlike(${j.index})" data-s="48" data-op="0" data-c="#c10841" data-hc="0" id="btn_like2_${j.index}"><i class="fa fa-heart"></i></div>
									<!-- 좋아요버튼 끝 -->
									
								</div>
								<!-- .actions -->
							</div>
						</div>
						<!-- .product -->
					</c:forEach>
					</c:otherwise>
				</c:choose>
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
										href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${page-1}&order=${basicorder}">
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
											href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${a}&order=${basicorder}">
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
										href="${pageContext.request.contextPath}/travel_review/review_list.htm?pg=${page+1}&order=${basicorder}">
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
								class="btn btn-default"><spring:message code="board.review12"/></a>
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
