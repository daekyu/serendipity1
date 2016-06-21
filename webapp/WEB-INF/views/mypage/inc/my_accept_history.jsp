<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- my account - 내가 신청한 내역 -->

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">받은 요청</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account">
		  <div class="table-responsive">
			<table class="table table-striped table-bordered text-center my-orders-table">
			  <thead>
				<tr class="first last">
				  <th>#</th>
				  <th>Date(요청받은 날짜)</th>
				  <th><span class="nobr">글 제목</span></th>
				  <th>신청한 사람 아이디</th>
				  <th>상태</th>
				  <th>Actions</th>
				</tr>
			  </thead>
			  <tbody>
			  <c:choose>
			  <c:when test="${empty participantdto}">
			  		<tr>
			  		<td colspan="6">받은 요청이 없습니다.</td>
			  		</tr>
			  </c:when>
			  <c:otherwise>
			  <c:forEach var="i" items="${participantdto}">
				<tr>
					<td>1</td>
					<td>${i.PARTI_DATE}</td>
					<td>${i.BOARD_TITLE}</td>
					<td>${i.ID}</td>
					<td>
						<c:choose>
							<c:when test="${i.STATE eq 'wait'}">
								승낙 대기중
							</c:when>
							<c:otherwise>
								승낙!
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/mypage/acceptRequest.htm?parti_num=${i.PARTI_NUM}" class="btn btn-success">수락</a>
						<a href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.PARTI_NUM}&check=2" class="btn btn-danger">거절</a>
					</td>
				</tr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
			  </tbody>
			</table>
		  </div>
		  <div class="pagination-box">
			<ul class="pagination">
			 <!--  <li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
			  <li class="active"><span>1</span></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li class="disabled"><a href="#">...</a></li>
			  <li><a href="#">9</a></li>
			  <li><a href="#"><i class="fa fa-angle-right"></i></a></li> -->
			  
			  <c:choose>
								<c:when test="${page<=1}">
									<li class="disabled"><span><i class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${page-1}">
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
											href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${a}">
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
										href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${page+1}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
						<br>임시 출력창
						<br>page: ${page}<br> 
						maxpage: ${maxpage}<br> startpage: ${startpage}<br>
						endpage: ${endpage}<br> listCount: ${listCount}<br>
			</ul>
			<i class="pagination-text">Displaying 1 to 10 (of 100 posts)</i>
		  </div>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->