<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="sidebar" class="sidebar col-sm-3 col-md-3">
		<aside class="widget menu">
		  <header>
			<h3 class="title">My Account</h3>
		  </header>
		  <nav>
			<ul>
			  <li>
				<a href="${pageContext.request.contextPath}/admin/stats_list.htm"><i class="fa fa-bar-chart-o item-icon"></i>통계</a>
			  </li>
			  <li>
			  
				<a href="${pageContext.request.contextPath}/admin/member_list.htm"><i class="fa fa-users item-icon"></i>회원 목록</a>
			  </li>
			  <li>
				<a href="${pageContext.request.contextPath}/report/report_list.htm"><i class="fa fa-warning item-icon"></i>신고 내역</a>
			  </li>
			</ul>
		  </nav>
		</aside><!-- .menu-->
	  </div>