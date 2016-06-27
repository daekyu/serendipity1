<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%--
@Project : 1조프로젝트
@File name : catalog_grid_view_4columns-traveler.jsp
@Author : 김민규
@Data : 2016.06.08
@Desc : 여행자가 올린 글 목록을 보여주는 페이지
--%>
<section id="main">
	<header class="page-header">
		<div class="container">
			<h1 class="title"><spring:message code="board.guide"/></h1>
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
								data-toggle="dropdown" href="#">Sort by: <span>
								<c:choose>
								<c:when test="${basicsort eq 'board_num'}">
									Date
								</c:when>
								<c:otherwise>
									other
								</c:otherwise>
								</c:choose></span>
								<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/board/traveler_list.htm?sort=board_num&show=${basicshow}">Date</a></li>
								<!-- <li><a href="#">Price</a></li> -->
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
								data-toggle="dropdown" href="#">Show: <span>${basicshow}</span> <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/board/traveler_list.htm?show=4&sort=${basicsort}">4</a></li>
								<li><a href="${pageContext.request.contextPath}/board/traveler_list.htm?show=8&sort=${basicsort}">8</a></li>
								<li><a href="${pageContext.request.contextPath}/board/traveler_list.htm?show=12&sort=${basicsort}">12</a></li>
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
					<c:forEach var="i" items="${board_list}">
						<div class="col-sm-2 col-md-2 product rotation">
							<div class="default">
								<span class="sale top"></span> <a href="traveler_detail.htm?board_num=${i.BOARD_NUM}&user_num=${i.USER_NUM}"
									class="product-image"> <img class="replace-2x"
									src="${pageContext.request.contextPath}/resources/img/board_picture/${i.BOARD_PICTURE1}" alt="" title="" width="270"
									height="270">
								</a>
								<div class="product-description">
									<div class="vertical">
										<h3 class="product-name">
											<a href="traveler_detail.htm?board_num=${i.BOARD_NUM}&user_num=${i.USER_NUM}">${i.BOARD_TITLE}</a>
										</h3>
										<div class="price">여행자 아이디 : ${i.ID}</div>
									</div>
								</div>
							</div>

							<div class="product-hover">
								<h3 class="product-name">
									<a href="traveler_detail.htm?board_num=${i.BOARD_NUM}&user_num=${i.USER_NUM}">제목 : ${i.BOARD_TITLE}</a>
								</h3>
								<div class="price">여행자 아이디 : ${i.ID}</div>
								<a href="traveler_detail.htm?board_num=${i.board_num}&user_num=${i.USER_NUM}" class="product-image"> <img
									class="replace-2x" src="${pageContext.request.contextPath}/resources/img/profile_picture/${i.PROFILE_PICTURE}" alt=""
									title="" width="70" height="70">
								</a>
								<ul>
									<li>지역: ${i.LOCAL_NAME}</li>
									<li>가격상한: ${i.PRICE}</li>
									<li>여행 일시 : ${i.BOARD_DATE}</li>
								</ul>
								
								<br>
										<div class="contact" align="center">
											<a href="traveler_detail.htm?board_num=${i.BOARD_NUM}&user_num=${i.USER_NUM}"class="btn btn-warning btn-lg btn-block"><spring:message code="index.inc.carousel-box-newguide10"/></a>
										</div>
							</div>
							<!-- .product-hover -->
						</div>
						<!-- .product -->
					</c:forEach>
					<div class="pagination-box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${page-1}&show=${basicshow}&sort=${basicsort}">
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
											href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${a}&show=${basicshow}&sort=${basicsort}">
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
										href="${pageContext.request.contextPath}/board/traveler_list.htm?pg=${page+1}&show=${basicshow}&sort=${basicsort}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						
						<c:if test="${!empty sessionScope.user_num}">
						 	<a href="${pageContext.request.contextPath}/board/traveler_writeform.htm?user_num=${sessionScope.user_num}"
								class="btn btn-default"><spring:message code="board.guide2"/><span
								class="glyphicon glyphicon-arrow-right"></span></a>
						</c:if>
					</div>
					<!-- .pagination-box -->
				</div>
				<!-- .content -->
			</div>
		</div>
		<!-- .container -->
		</div>
</section>
<!-- #main -->