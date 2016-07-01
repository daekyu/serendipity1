<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- my account - 내가 신청한 내역 -->
<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
</script> 
<link rel="stylesheet" type="text/css" 
href=".././resources/js/sweetalert.css"> 
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<p class="white"><fmt:formatDate value="${toDay}" pattern="yy/MM/dd"/></p>
<fmt:parseNumber value="${toDay.time/(1000*60*60*24)}" integerOnly="true" var="nowDays" scope="request"/>
<script type="text/javascript">
			$(function(){
			if($('#check1').val() == 1){
				swal("<spring:message code="mypage.my_accept_history"/>");
			};
			
			$('.delete').click(function(){
				if(confirm("<spring:message code="mypage.my_accept_history1"/>") == true){
				location.href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.PARTI_NUM}&check=1";
				}else{
				    return false;
				}
			});
			
			$('.accept').click(function(){
				if(confirm("<spring:message code="mypage.my_accept_history2"/>") == true){
				location.href="${pageContext.request.contextPath}/mypage/acceptRequest.htm?parti_num=${i.PARTI_NUM}";
				}else{
				    return false;
				}
			});
		});
</script>

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title"><spring:message code="mypage.my_accept_history3"/></h1>
      <input type="hidden" id="check1" value="${check1}">
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
				  <th><spring:message code="mypage.my_accept_history4"/></th>
				  <th><spring:message code="mypage.my_accept_history5"/></th>
				  <th><span class="nobr"><spring:message code="mypage.my_accept_history6"/></span></th>
				  <th><spring:message code="mypage.my_accept_history7"/></th>
				  <th><spring:message code="mypage.my_accept_history8"/></th>
				  <th><spring:message code="mypage.my_accept_history9"/></th>
				  <th><spring:message code="mypage.my_accept_history10"/></th>
				</tr>
			  </thead>
			  <tbody>
			  <c:choose>
			  <c:when test="${empty participantdto}">
			  		<tr>
			  		<td colspan="7"><spring:message code="mypage.my_accept_history11"/></td>
			  		</tr>
			  </c:when>
			  <c:otherwise>
			  <c:forEach var="i" items="${participantdto}">
				<fmt:parseDate var="bd" value="${i.BOARD_DATE}" pattern="MM/dd/yyyy" />
				<fmt:parseNumber value="${bd.time/(1000*60*60*24)}" integerOnly="true" var="boardDays" scope="request"/>
				<tr>
					<td>
						<c:choose>
						<c:when test="${i.CATEGORY_NUM eq 1}">
							<spring:message code="mypage.my_accept_history12"/>
						</c:when>
						<c:otherwise>
							<spring:message code="mypage.my_accept_history13"/>
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
								<td>
									<spring:message code="mypage.my_accept_history14"/>
								</td>
								<td>
								<c:choose>
									<c:when test="${nowDays <= boardDays}">
										<a href="${pageContext.request.contextPath}/mypage/acceptRequest.htm?parti_num=${i.PARTI_NUM}&board_num=${i.BOARD_NUM}&ctn=${i.CATEGORY_NUM}&pc=${i.PARTI_CAPACITY}" class="btn btn-success accept"><spring:message code="mypage.my_accept_history15"/></a>
										<a href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.PARTI_NUM}&check=2" class="btn btn-danger delete"><spring:message code="mypage.my_accept_history16"/></a>
									</c:when>
								<c:otherwise>
									<spring:message code="mypage.my_accept_history17"/>
								</c:otherwise>
								</c:choose>
								</td>
							</c:when>
							<c:when test="${i.STATE eq 'refuse'}">
								<td>
									<spring:message code="mypage.my_accept_history18"/>
								</td>
								<td>
								<spring:message code="mypage.my_accept_history19"/>
								</td>
							</c:when>
							<c:when test="${i.STATE eq 'cansel'}">
								<td>
									<spring:message code="mypage.my_accept_history20"/>
								</td>
								<td>
									<spring:message code="mypage.my_accept_history21"/>
								</td>
							</c:when>
							<c:otherwise>
								<td>
									<spring:message code="mypage.my_accept_history22"/>
								</td>
								<td>
								<spring:message code="mypage.my_accept_history23"/>
								</td>
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
									<li class="disabled"><span><i
											class="fa fa-angle-left"></i></span></li>
								</c:when>
								<c:otherwise>
									<li class="active"><a
										href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${page-1}&user_num=${sessionScope.user_num}">
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
											href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${a}&user_num=${sessionScope.user_num}">
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
										href="${pageContext.request.contextPath}/mypage/my_page_accept_history.htm?pg=${page+1}&user_num=${sessionScope.user_num}">
											<i class="fa fa-angle-right"></i>
									</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
			</ul>
			<i class="pagination-text">Displaying 1 to 10 (of 100 posts)</i>
		  </div>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->