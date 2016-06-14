<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header보다 상단에 위치해 언어선택/로그인/회원가입 등을 할 수 있는 부분 -->

<div id="top-box">
  <div class="top-box-wrapper">
	<div class="container">
	  <div class="row">
		<div class="col-xs-9 col-sm-5">
		  
		  
		</div>
		
		<div class="col-xs-3 col-sm-7">
		  <div class="navbar navbar-inverse top-navbar top-navbar-right" role="navigation">
			<button type="button" class="navbar-toggle btn-navbar collapsed" data-toggle="collapse" data-target=".top-navbar .navbar-collapse">
			  <span class="icon-bar"></span>
			  <span class="icon-bar"></span>
			  <span class="icon-bar"></span>
			</button>
  
			<nav class="collapse collapsing navbar-collapse">
			  <ul class="nav navbar-nav navbar-right">
				
			   <li><a href="changeLocale.htm?locale=ko">한국어<span class="locale"></span></a></li>
				<li><a href="changeLocale.htm?locale=en">English<span class="locale1"></span></a></li>
				<li><a href="changeLocale.htm?locale=ja">日本語<span class="locale2"></span></a></li>
				
				<li><a href="#">My Account<span class="count">2</span></a></li>
				
				<%-- <li><a href="${pageContext.request.contextPath}/member/join_login.htm">Log in / Join us <i class="fa fa-lock after"></i></a></li>
				<li><a href="#">Logout<i class="fa fa-lock after"></i></a></li> --%>
				
				<c:choose>
					<c:when test="${empty sessionScope.id}">
						<li><a href="${pageContext.request.contextPath}/member/join_login.htm">Log in / Join us <i class="fa fa-lock after"></i></a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="#">Logout<i class="fa fa-lock after"></i></a></li>
					</c:otherwise>
				</c:choose>
			  </ul>
			</nav>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</div><!-- #top-box -->