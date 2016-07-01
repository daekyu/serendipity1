<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<header class="header header-two">
	<div class="header-wrapper">
		<div class="container">
			<div class="row">
				<div class="col-xs-6 col-md-2 col-lg-3 logo-box">
					<div class="logo">
						<a href="${pageContext.request.contextPath}/index.htm"> <c:choose>
								<c:when test="${index == 'index'}">
									<img src="./resources/img/main_logo.png" class="logo-img" alt="">
								</c:when>
								<c:otherwise>
									<img src=".././resources/img/main_logo.png" class="logo-img" alt="">
								</c:otherwise>
							</c:choose>
						</a>
					</div>
				</div>
				<!-- .logo-box -->

				<div class="col-xs-6 col-md-10 col-lg-9 right-box">
					<div class="right-box-wrapper">
						<div class="primary">
							<div class="navbar navbar-default" role="navigation">
								<button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target=".primary .navbar-collapse">
									<span class="text">Menu</span> <span class="icon-bar"></span> 
									<span class="icon-bar"></span> <span class="icon-bar"></span>
								</button>
								<nav class="collapse collapsing navbar-collapse">
									<ul class="nav navbar-nav navbar-center">
										<li class="item-danger item-bg text-danger">
											<a href="${pageContext.request.contextPath}/index.htm"><spring:message code="index.header0.5" /></a>
										</li>

										<li class="item-danger item-bg text-danger">
											<a href="${pageContext.request.contextPath}/travel_info/travel_info.htm"><spring:message code="index.header" /></a>
										</li>

										<li class="item-danger item-bg text-danger">
											<a href="${pageContext.request.contextPath}/board/traveler_list.htm"><spring:message code="index.header1" /></a>
										</li>

										<li class="item-danger item-bg text-danger">
											<a href="${pageContext.request.contextPath}/board/guide_list.htm"><spring:message code="index.header2" /></a>
										</li>

										<li class="item-danger item-bg text-danger">
											<a href="${pageContext.request.contextPath}/travel_review/review_list.htm"><spring:message code="index.header3" /></a>
										</li>

										<c:if test="${!empty sessionScope.user_num}">
											<li class="item-danger item-bg text-danger">
												<a href="${pageContext.request.contextPath}/mypage/my_page.htm?user_num=${sessionScope.user_num}"><spring:message code="index.header4" /></a>
											</li>
										</c:if>

										<c:if test="${sessionScope.id == 'admin' }">
											<li class="item-danger item-bg text-danger">
												<a href="${pageContext.request.contextPath}/admin/member_list.htm"><spring:message code="index.header5" /></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
						<!-- .primary -->
					</div>
				</div>
			</div>
			<!--.row -->
		</div>
	</div>
	<!-- .header-wrapper -->
</header>
<!-- .header -->