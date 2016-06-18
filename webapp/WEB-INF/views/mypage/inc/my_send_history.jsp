<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- my account - 내가 신청한 내역 -->

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
				  <th>Date(신청한 날짜)-없는 컬럼인데? - 컬럼추가하셈</th>
				  <th><span class="nobr">글 제목</span></th>
				  <th>신청받은 사람 아이디</th>
				  <th>상태</th>
				  <th>Actions</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
					<td>1</td>
					<td>신청한 날짜 - 테이블에 없는 컬럼 - 컬럼추가하셈</td>
					<td>${dto.board_num} - 글 제목 - 조인</td>
					<td>내가 누구에게 신청했는지 - 조인</td>
					<td>
						<c:choose>
							<c:when test="${dto.state eq 'wait'}">
								승낙 대기중
							</c:when>
							<c:otherwise>
								승낙!
							</c:otherwise>
						</c:choose>
					</td>
					<td><a href="" class="btn btn-danger">취소</button></td>
				</tr>
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