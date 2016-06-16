<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%--
@Project : 1조프로젝트
@File name : catalog_grid_view_4columns-guide.jsp
@Author : 김민규
@Data : 2016.06.09
@Desc : 가이드가 올린 글 목록을 보여주는 페이지
--%>

<!-- 가이드 목록을 보여주는 페이지-->
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title"><spring:message code="board.traveler"/></h1>
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
						<span class="grid"> <span
							class="glyphicon glyphicon-th-large"></span>
						</span> <a href="shop-catalog-list.html" class="list"> <span
							class="glyphicon glyphicon-th-list"></span>
						</a>
					</div>

					<!-- 검색조건. 추후 수정해보자 -->
					<div class="sort-catalog">
						<div class="btn-group sort-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#">Sort by: <span>Rating</span>
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Price</a></li>
								<li><a href="#">Date</a></li>
							</ul>
						</div>
						<!-- .sort-by -->
						<button type="button" class="btn up-down btn-default"
							data-toggle="button">
							<span></span>
						</button>
					</div>
					<!-- .sort-catalog -->

					<div class="sort-catalog">
						<div class="btn-group show-by btn-select">
							<a class="btn dropdown-toggle btn-default" role="button"
								data-toggle="dropdown" href="#">Show: <span>12</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">6</a></li>
								<li><a href="#">7</a></li>
								<li><a href="#">8</a></li>
								<li><a href="#">9</a></li>
								<li><a href="#">10</a></li>
								<li><a href="#">11</a></li>
								<li><a href="#">12</a></li>
							</ul>
						</div>
						<!-- .show -->
						<span class="per-page">per page</span>
					</div>
					<!-- .sort-catalog -->

					<div class="price-regulator pull-right">
						<b>Price:</b>
						<div class="layout-slider">
							<input id="Slider2" type="slider" name="price"
								value="20000;120000" class="form-control">
						</div>
					</div>
					<!-- .price-regulator -->

				</div>
				<!-- 검색 조건 끝 .-->

				<div class="clearfix"></div>


				<div class="products grid row">
					<c:forEach var="i" items="${list}">

						<div class="col-sm-3 col-md-3 product rotation">
							<div class="default">
								<span class="sale top"></span> <a href="guide_detail.htm?board_num=${i.board_Num}"
									class="product-image"> <img class="replace-2x"
									src="content/img/product-1.jpg" alt="" title="" width="270"
									height="270">
								</a>
								<div class="product-description">
									<div class="vertical">
										<h3 class="product-name">
											<a href="guide_detail.htm?board_num=${i.board_Num}&user_num=${i.user_Num}">${i.board_Title}</a>
										</h3>
										<div class="price">가이드 번호 : ${i.user_Num}</div>
									</div>
								</div>
							</div>

							<div class="product-hover">
								<h3 class="product-name">
									<a href="guide_detail.htm?board_num=${i.board_Num}&user_num=${i.user_Num}">${i.board_Title}</a>
								</h3>
								<div class="price">가이드 번호 : ${i.user_Num}</div>
								<a href="guide_detail.htm?board_num=${i.board_Num}" class="product-image"> <img
									class="replace-2x" src="content/img/product-1.jpg" alt=""
									title="" width="70" height="70">
								</a>
								<ul>
									<li>지역: 붓싼</li>
									<li>가격상한: $10</li>
									<li>언어: 영어, 한국어</li>
									<li>관심사: 맛집, 술, 술</li>
								</ul>
								<br> <span class="">여행 계획: <a href="guide_detail.htm?board_num=${i.board_Num}&user_num=${i.user_Num}">이소라는
										예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
							</div>
							<!-- .product-hover -->
						</div>
						<!-- .product -->
					</c:forEach>
				</div>
				<!-- .products -->

				<!-- 페이징처리하는 부분 -->
				<div class="pagination-box" align="center">
					<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${page-1}">
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
											href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${a}">
												${a}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page>=maxpage}">
									<li class="disabled"><span><i class="fa fa-angle-right"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						<br>임시 출력창
						<br>page: ${page}<br> nowpage: ${nowpage}<br>
						maxpage: ${maxpage}<br> startpage: ${startpage}<br>
						endpage: ${endpage}<br> listCount: ${listCount}<br> 
<<<<<<< HEAD

						<%-- 	href="${pageContext.request.contextPath}/board/guide_writeform.htm?user_num=${sessionScope.user_num}"
							class="btn btn-default">글작성<span --%>

							<a href="${pageContext.request.contextPath}/board/guide_writeform.htm"
							class="btn btn-default"> <spring:message code="board.traveler1"/><span

							class="glyphicon glyphicon-arrow-right"></span></a>
=======
						<a href="${pageContext.request.contextPath}/board/guide_writeform.htm"
							class="btn btn-default"><spring:message code="board.traveler1"/>
							<span class="glyphicon glyphicon-arrow-right"></span></a>
>>>>>>> 04c69521691ca1c0126b8f4d4d4b4bf94dbff683

				</div>
				<!-- .pagination-box -->
				
			</div>
			<!-- .content -->

		</div>
	</div>
	<!-- .container -->
</section>
<!-- #main -->