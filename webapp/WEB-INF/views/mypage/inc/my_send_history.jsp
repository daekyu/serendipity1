<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<p class="white">
	<fmt:formatDate value="${toDay}" pattern="yy/MM/dd" />
</p>
<fmt:parseNumber value="${toDay.time/(1000*60*60*24)}"
	integerOnly="true" var="nowDays" scope="request" />
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.delete').click(function() {
			if (confirm("해당 요청을 취소 하시겠습니까?") == true) {
				location.href = "${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.PARTI_NUM}&check=1";
			} else {
				return false;
			}
		});
	});
</script>

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page ">
	<header class="page-header">
		<div class="container">
			<h1 class="title">보낸 요청</h1>
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
									<th>분류</th>
									<th>신청한 날짜</th>
									<th><span class="nobr">글 제목</span></th>
									<th>신청받은 사람 아이디</th>
									<th>인원</th>
									<th>상태</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty participantdto}">
										<tr>
											<td colspan="7">보낸 요청이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" items="${participantdto}" varStatus="j">
											<fmt:parseDate var="bd" value="${i.BOARD_DATE}" pattern="MM/dd/yyyy" />
											<fmt:parseNumber value="${bd.time/(1000*60*60*24)}" integerOnly="true" var="boardDays" scope="request" />
											<tr>
												<td>
													<c:choose>
														<c:when test="${i.CATEGORY_NUM eq 1}">
															가이드 구함
														</c:when>
														<c:otherwise>
															여행자 구함
														</c:otherwise>
													</c:choose>
												</td>
												<td>${i.PARTI_DATE}</td>
												<td>${i.BOARD_TITLE}</td>
												<td>${i.ID}</td>
												<c:choose>
													<c:when test="${!empty i.PARTI_CAPACITY}">
														<td>${i.PARTI_CAPACITY}</td>
													</c:when>
													<c:otherwise>
														<td>-</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${i.STATE eq 'wait'}">
														<td>승낙 대기중</td>
														<td>
															<c:choose>
																<c:when test="${nowDays <= boardDays}">
																	<a href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.PARTI_NUM}&check=1" class="btn btn-danger delete">취소</a>
																</c:when>
																<c:otherwise>
																	마감
																</c:otherwise>
															</c:choose>
														</td>
													</c:when>
													<c:when test="${i.STATE eq 'refuse'}">
														<td>신청 거절</td>
														<td>처리완료</td>
													</c:when>
													<c:when test="${i.STATE eq 'cansel'}">
														<td>신청 취소</td>
														<td>처리완료</td>
													</c:when>
													<c:otherwise>
														<td>승낙!</td>
														<td>처리완료</td>
													</c:otherwise>
												</c:choose>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="pagination-box">
						<ul class="pagination">
							<c:choose>
								<c:when test="${page<=1}">
									<li class="disabled">
										<span><i class="fa fa-angle-left"></i></span>
									</li>
								</c:when>
								<c:otherwise>
									<li class="active">
										<a href="${pageContext.request.contextPath}/mypage/my_page_send_history.htm?pg=${page-1}&user_num=${sessionScope.user_num}"><i class="fa fa-angle-left"></i></a>
									</li>
								</c:otherwise>
							</c:choose>

							<c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
								<c:choose>
									<c:when test="${a==page}">
										<li class="active"><span>${a}</span></li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="${pageContext.request.contextPath}/mypage/my_page_send_history.htm?pg=${a}&user_num=${sessionScope.user_num}">${a}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:choose>
								<c:when test="${page>=maxpage}">
									<li class="disabled">
										<span><i class="fa fa-angle-right"></i></span>
									</li>
								</c:when>
								<c:otherwise>
									<li class="active">
										<a href="${pageContext.request.contextPath}/mypage/my_page_send_history.htm?pg=${page+1}&user_num=${sessionScope.user_num}">
											<i class="fa fa-angle-right"></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
						<i class="pagination-text">Displaying 1 to 10 (of 100 posts)</i>
					</div>
				</div>
			</article>
			<jsp:include page="my_page_sidebar.jsp"></jsp:include>
		</div>
	</div>
</section>
<!-- #main -->