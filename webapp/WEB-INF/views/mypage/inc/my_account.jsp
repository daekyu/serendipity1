<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<div class="breadcrumb-box breadcrumb-none"></div>
<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title"><spring:message code="board.mypage"/></h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account">
		  <div class="bottom-padding">
		  	<div class="row">
			<div class="images-box col-xs-9 col-sm-6 col-md-4">
			  <div class="carousel-box load" data-carousel-pagination="true" data-carousel-nav="false" data-carousel-one="true" data-autoplay-disable="true">
				  <div class="carousel">
					<div class="image">
					<%-- <c:set var="i" value="${dto.profile_picture}" />
					<c:choose>
					    <c:when test="${empty i}">
					       <img class="replace-2x" src="content/img/team-big-1.jpg" alt="" title="" width="768" height="768">
					    </c:when>
					    <c:otherwise>
					       <img class="replace-2x" src="${i}" alt="" title="" width="768" height="768">
					    </c:otherwise>
					</c:choose> --%>
					  <img class="replace-2x img-profile" src="${pageContext.request.contextPath}/resources/img/profile_picture/${memberdto.profile_picture}" alt="프로필사진" title="프로필사진" width="768" height="768">
					  
					</div>
				  </div>
				<div class="clearfix"></div>
				<div class="pagination switches"></div>
			  </div>
			</div>
		  
			<div class="employee-description col-sm-8 col-md-8">
			  <h3 class="name">${memberdto.name}</h3>
			  <div class="role"></div>
			  <div>
				<p>${memberdto.profile_description}</p>
			  </div>
			  <div class="social">
<!-- 				<a class="icon rounded icon-facebook" href="#"><i class="fa fa-facebook"></i></a>
				<a class="icon rounded icon-twitter" href="#"><i class="fa fa-twitter"></i></a>
				<a class="icon rounded icon-google" href="#"><i class="fa fa-google"></i></a>
				<a class="icon rounded icon-linkedin" href="#"><i class="fa fa-linkedin"></i></a> -->
			  </div>
			</div>
			<div class="clearfix"></div>
		  </div>
			<br><br>
			<div class="table-responsive">
			<table class="table table-bordered">
			
				<tr>
					<th class="danger" colspan="2">Information</th>
				</tr>
				<tr>
					<th class="danger"><spring:message code="board.mypage_in1"/></th>
					<td>${memberdto.name}</td>
				</tr>
				
				<tr>
					<th class="danger"><spring:message code="board.mypage_in2"/></th>
					<td>${Slocal}</td>
				</tr>
				
				<tr>
					<th class="danger"><spring:message code="board.mypage_in3"/></th>
					<td>
						<c:forEach var="i" items="${Slang}">
							${i},  
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<th class="danger"><spring:message code="board.mypage_in4"/></th>
					<td>
						<c:forEach var="i" items="${Shobby}">
							${i},  
						</c:forEach>
					</td>
				</tr>
			</table>
			</div>
		  </div>
		
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->