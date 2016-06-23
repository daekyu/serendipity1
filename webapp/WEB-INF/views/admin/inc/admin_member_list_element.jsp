<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 

	@Author : 강대규
	@File name : admin_member_list_element.jsp
	@Date : 16.06.10
	@Desc : 관리자가 회원 목록을 볼 수 있는 부분
 -->

<div class="breadcrumb-box breadcrumb-none"></div>


<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">회원 탈퇴</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account">
		  <div class="table-responsive">
			<table class="table table-striped table-bordered text-center my-orders-table">
			  <thead>
			  	<tr>
			  		<th>아이디</th>
			  		<th>이름</th>
			  		<th>나이</th>
			  		<th>국적</th>
			  		<th>이메일</th>
			  		<th>신고횟수</th>
			  		<th>탈퇴</th>
			  	</tr>
			  </thead>
			  
			  <tbody>
			  <c:forEach var="i" items="${member_list}">
			  	<tr>
			  		<td>${i.id}</td>
			  		<td>${i.name}</td>
			  		<td>${i.age}</td>
			  		<td>${i.country_code}</td>
			  		<td>${i.email}</td>
			  		<td>${i.report_count}</td>
			  		<td><a class="btn btn-danger" href="">탈퇴</a>
			  	</tr>
			  </c:forEach>
			  </tbody>
			</table>
		  </div>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="admin_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->