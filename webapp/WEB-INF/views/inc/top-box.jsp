<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function doPop(){
		var value=<%= session.getAttribute("user_num")%>;
		 window.open('${pageContext.request.contextPath}/message/message.htm?user_num=' + value, '', 'width=500, height=400, top=100, left=450, resizable=no, location=no, menubar=no, scrollbars=yes, status=no, directories=no');
	}
</script>

<!-- Header보다 상단에 위치해 언어선택/로그인/회원가입 등을 할 수 있는 부분 -->

<div id="top-box">
  <div class="top-box-wrapper">
	<div class="container">
	  <div class="row">
		<div class="col-xs-9 col-sm-5">
		  <div class="btn-group language btn-select">
			<a class="btn dropdown-toggle btn-default" role="button" data-toggle="dropdown" href="#">
			  <span class="hidden-xs">Language</span><span class="visible-xs">Lang</span><!-- 
			  -->: English
			  <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
			  <li><a href="#"><img src="./resources/img/eng-flag.png" alt="">English</a></li>
			  <li><a href="#"><img src="./resources/img/fra-flag.png" alt="">France</a></li>
			  <li><a href="#"><img src="./resources/img/ger-flag.png" alt="">Germany</a></li>
			</ul>
		  </div>
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
				<li><a href="javascript:doPop()">Message</a>
				<li><a href="#">My Account<span class="count">2</span></a></li>
				
				<%-- <li><a href="${pageContext.request.contextPath}/member/join_login.htm">Log in / Join us <i class="fa fa-lock after"></i></a></li>
				<li><a href="#">Logout<i class="fa fa-lock after"></i></a></li> --%>
				
				<c:choose>
					<c:when test="${empty sessionScope.id}">
						<li><a href="${pageContext.request.contextPath}/member/join_login.htm">Log in / Join us <i class="fa fa-lock after"></i></a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/member/logout.htm">Logout<i class="fa fa-lock after"></i></a></li>
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