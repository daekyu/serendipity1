<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    
<div id="sidebar" class="sidebar col-sm-3 col-md-3">
		<aside class="widget menu">
		  <header>
			<h3 class="title"><spring:message code="board.mypage_ac"/></h3>
		  </header>
		  <nav>
			<ul>
			  <li>
				<a href="${pageContext.request.contextPath}/mypage/my_page.htm?user_num=${sessionScope.user_num}"><i class="fa fa-user item-icon"></i><spring:message code="board.mypage_ac1"/></a>
			  </li>
			  <li>
				<a href="${pageContext.request.contextPath}/mypage/my_page_modifyform.htm?id=${sessionScope.id}"><i class="fa fa-gears item-icon"></i><spring:message code="board.mypage_ac2"/></a>
			  </li>
			  <li>
				<a href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?user_num=${sessionScope.user_num}"><i class="fa fa-mail-reply item-icon"></i><spring:message code="board.mypage_ac3"/></a>
			  </li>
			  <li>
				<a href="${pageContext.request.contextPath}/mypage/my_page_send_history.htm?user_num=${sessionScope.user_num}"><i class="fa fa-mail-forward item-icon"></i><spring:message code="board.mypage_ac4"/></a>
			  </li>
			  <li>
				<a href="${pageContext.request.contextPath}/mypage/my_page_withdraw.htm"><i class="fa fa-times item-icon"></i><spring:message code="board.mypage_ac6"/></a>
			  </li>
			</ul>
		  </nav>
		</aside><!-- .menu-->
	  </div>