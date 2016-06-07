<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- my account - 내가 신청한 내역 -->

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
				<tr class="first last">
				  <th>
				  	정말로 탈퇴할거니?<br><br>
				  	<button type="button" class="btn btn-danger">Yes</button>   <button type="button" class="btn btn-success">No</button>
				  </th>
				</tr>
			  </thead>
			</table>
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
			  <li>
				<a href="#"><i class="fa fa-mail-forward item-icon"></i>받은 요청</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-mail-reply item-icon"></i>보낸 요청</a>
			  </li>
			  <li>
				<a href="#"><i class="fa fa-bell-o item-icon"></i>Etc</a>
			  </li>
			  <li class="active">
				<a href="#"><i class="fa fa-times item-icon"></i>Withdraw from Serendipity</a>
			  </li>
			</ul>
		  </nav>
		</aside><!-- .menu-->
	  </div>
    </div>
  </div>
</section><!-- #main -->