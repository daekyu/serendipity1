<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- my account - 내가 신청한 내역 -->
<script type="text/javascript">
		$(function(){
			$('#delete').click(function(){
				if(confirm("해당 요청을 취소 하시겠습니까?") == true){
				location.href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&board_num=${i.board_num}";
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
				  <th>#</th>
				  <th>신청한 날짜</th>
				  <th><span class="nobr">글 제목</span></th>
				  <th>신청받은 사람 아이디</th>
				  <th>상태</th>
				  <th>Actions</th>
				</tr>
			  </thead>
			  <tbody>
			  <c:choose var="i">
			  <c:when test="${empty participantdto}">
			  
			  </c:when>
			  <c:forEach var="i" items="${participantdto}">
				<tr>
					<td>${i.parti_num}</td>
					<td>${i.parti_date}</td>
					<td>${i.board_num} - 글 제목 - 조인</td>
					<td>내가 누구에게 신청했는지 - 조인</td>
					<td>
						<c:choose>
							<c:when test="${i.state eq 'wait'}">
								승낙 대기중
							</c:when>
							<c:otherwise>
								승낙!
							</c:otherwise>
						</c:choose>
					</td>
					<td><a href="${pageContext.request.contextPath}/mypage/delete_send_history.htm?user_num=${sessionScope.user_num}&parti_num=${i.parti_num}" class="btn btn-danger" id="delete">취소</a></td>
				</tr>
				</c:forEach>
				
				</c:choose>
			  </tbody>
			</table>
		  </div>
		  <div class="pagination-box">
			<ul class="pagination">
			  <li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
			  <li class="active"><span>1</span></li>
			  <li><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li class="disabled"><a href="#">...</a></li>
			  <li><a href="#">9</a></li>
			  <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
			</ul>
			<i class="pagination-text">Displaying 1 to 10 (of 100 posts)</i>
		  </div>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->