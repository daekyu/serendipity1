<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header class="header header-two">
  <div class="header-wrapper">
	<div class="container">
	  <div class="row">
		<div class="col-xs-6 col-md-2 col-lg-3 logo-box">
		  <div class="logo">
				<a href="${pageContext.request.contextPath}/index.htm">
					<c:if test="">
						<img src=".././resources/img/logo.svg" class="logo-img" alt="">
					</c:if>
					
					<c:choose>
						<c:when test="${index == 'index'}">
							<img src="./resources/img/logo.svg" class="logo-img" alt="">
						</c:when>
						
						<c:otherwise>
							<img src=".././resources/img/logo.svg" class="logo-img" alt="">
						</c:otherwise>
					</c:choose>
					
				</a>
		  </div>
		</div><!-- .logo-box -->
		
		<div class="col-xs-6 col-md-10 col-lg-9 right-box">
		  <div class="right-box-wrapper">
			
			
			<div class="primary">
			  <div class="navbar navbar-default" role="navigation">
				<button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target=".primary .navbar-collapse">
				  <span class="text">Menu</span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				  <span class="icon-bar"></span>
				</button>
	  
				<nav class="collapse collapsing navbar-collapse">
				  <ul class="nav navbar-nav navbar-center">
				  
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/index.htm">Home<span class="item-new">New</span></a>
					</li>
					
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/travel_info/travel_info.htm">여행정보<span class="item-new">New</span></a>
					</li>
					
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/board/traveler_list.htm">가이드구함</a>
					</li>
					
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/board/guide_list.htm">여행자구함<span class="item-new">New</span></a>
					</li>
					
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/travel_review/review_list.htm">여행후기</a>
					</li>
					
					<li class="item-danger item-bg text-danger">
					  <a href="${pageContext.request.contextPath}/mypage/my_page.htm">마이페이지</a>
					</li>
				  </ul>
				</nav>
			  </div>
			</div><!-- .primary -->
		  </div>
		</div>
		
		<div class="phone-active col-sm-9 col-md-9">
		  <a href="#" class="close"><span>close</span>×</a>
		  <span class="title">Call Us</span> <strong>+1 (777) 123 45 67</strong>
		</div>
		<div class="search-active col-sm-9 col-md-9">
		  <a href="#" class="close"><span>close</span>×</a>
		  <form name="search-form" class="search-form">
			<input class="search-string form-control" type="search" placeholder="Search here" name="search-string">
			<button class="search-submit">
			  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				<path fill="#231F20" d="M12.001,10l-0.5,0.5l-0.79-0.79c0.806-1.021,1.29-2.308,1.29-3.71c0-3.313-2.687-6-6-6C2.687,0,0,2.687,0,6
				s2.687,6,6,6c1.402,0,2.688-0.484,3.71-1.29l0.79,0.79l-0.5,0.5l4,4l2-2L12.001,10z M6,10c-2.206,0-4-1.794-4-4s1.794-4,4-4
				s4,1.794,4,4S8.206,10,6,10z"></path>
				<image src="img/png-icons/search-icon.png" alt="" width="16" height="16" style="vertical-align: top;">
			  </svg>
			</button>
		  </form>
		</div>
	  </div><!--.row -->
	</div>
  </div><!-- .header-wrapper -->
</header><!-- .header -->