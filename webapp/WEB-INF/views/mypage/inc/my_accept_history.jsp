<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
				<tr>
					<td>1</td>
					<td>2016.06.01</td>
					<td>어디어디갈거임</td>
					<td>leesr1203</td>
					<td>요청 대기중</td>
					<td><button type="button" class="btn btn-success">수락</button> <button type="button" class="btn btn-danger">거절</button></td>
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
	  
	  <div id="sidebar" class="sidebar col-sm-3 col-md-3">
		<aside class="widget menu">
		  <header>
			<h3 class="title">My Account</h3>
		  </header>
		  <nav>
			<ul>
			  <li>
				<a href="#"><i class="fa fa-user item-icon"></i>My Profile</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-gears item-icon"></i>Update Profile</a>
			  </li>
			  <li class="active">
				<a href="#"><i class="fa fa-mail-forward item-icon"></i>받은 요청</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-mail-reply item-icon"></i>보낸 요청</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-bell-o item-icon"></i>Etc</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-times item-icon"></i>Withdraw from Serendipity</a>
			  </li>
			</ul>
		  </nav>
		</aside><!-- .menu-->
	  </div>
    </div>
  </div>
</section><!-- #main -->