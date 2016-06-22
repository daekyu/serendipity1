<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<script type="text/javascript">
	function doPop(){
		var value=<%= session.getAttribute("user_num")%>;
		 window.open('${pageContext.request.contextPath}/message/message.htm?user_num=' + value, '', 'width=500, height=400, top=100, left=450, resizable=no, location=no, menubar=no, scrollbars=yes, status=no, directories=no');
	}
	
	function doPop2(){
		var value=<%= session.getAttribute("user_num")%>;
		 window.open('${pageContext.request.contextPath}/chatting/chatting.htm', '', 'width=435, height=300, top=100, left=450, resizable=no, location=no, menubar=no, scrollbars=yes, status=no, directories=no');
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
			  <c:choose>
			  	<c:when test="${sessionScope.locale == 'ko' || empty sessionScope.locale}">
			  		<span class="hidden-xs">언어</span><span class="visible-xs">Lang</span><!-- -->: 한국어
			  	</c:when>
			  	
			  	<c:when test="${sessionScope.locale == 'en'}">
			  		<span class="hidden-xs">Language</span><span class="visible-xs">Lang</span><!-- -->: English
			  	</c:when>
			  	
			  	<c:when test="${sessionScope.locale == 'ja'}">
			  		<span class="hidden-xs">言語</span><span class="visible-xs">Lang</span><!-- -->: 日本語
			  	</c:when>
			  </c:choose>
			  
			  <span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="${pageContext.request.contextPath}/locale/changeLocale.htm?locale=ko"><img src="./resources/img/kor-flag.png">한국어<span class="locale"></span></a></li>
				<li><a href="${pageContext.request.contextPath}/locale/changeLocale.htm?locale=en"><img src="./resources/img/eng-flag.png">English<span class="locale1"></span></a></li>
				<li><a href="${pageContext.request.contextPath}/locale/changeLocale.htm?locale=ja"><img src="./resources/img/jap-flag.png">日本語<span class="locale2"></span></a></li>
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
				<li><a href="javascript:doPop()"><spring:message code="index.top-box"/></a></li>
				<li><a href="javascript:doPop2()"><spring:message code="index.top-box1"/></a></li>
			   
				
				<li><a href="#"><spring:message code="index.top-box2"/><span class="count">2</span></a></li>
				
				<%-- <li><a href="${pageContext.request.contextPath}/member/join_login.htm">Log in / Join us <i class="fa fa-lock after"></i></a></li>
				<li><a href="#">Logout<i class="fa fa-lock after"></i></a></li> --%>
				
				<c:choose>
					<c:when test="${empty sessionScope.id}">
						<li><a href="${pageContext.request.contextPath}/member/join_login.htm"><spring:message code="index.top-box3"/><i class="fa fa-lock after"></i></a></li>
					</c:when>
					
					<c:otherwise>
						<li><a href="${pageContext.request.contextPath}/member/logout.htm"><spring:message code="index.top-box4"/><i class="fa fa-lock after"></i></a></li>
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