<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- my account - 내가 신청한 내역 -->

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">그 외 알림</h1>
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
				  <th>Date(알림받은 날짜)</th>
				  <th><span class="nobr">구분</span></th>
				  <th>알린사람 아이디</th>
				  <th>Actions</th>
				</tr>
			  </thead>
			  <tbody>
				<tr>
					<td>2</td>
					<td>2016.06.01</td>
					<td>쪽지</td>
					<td>leesr1203</td>
					<td><button type="button" class="btn btn-success">확인</button></td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>2016.06.01</td>
					<td>댓글</td>
					<td>leesr1203</td>
					<td><button type="button" class="btn btn-success">확인</button></td>
				</tr>
			  </tbody>
			</table>
			
			<div class="alert alert-default fade in">
		<i class="fa fa-volume-up alert-icon"></i>
		<button type="button" class="close" data-dismiss="alert">×</button>
			leesr1203님이 글에 댓글남김
	  </div>
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
      </article>
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->