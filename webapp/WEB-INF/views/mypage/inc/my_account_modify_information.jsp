<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회원정보 수정하는 페이지 -->

<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">Edit Account Information</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account margin-top">
		  <form class="form-validator">
			<div class="row">
			  <div class="col-sm-6 col-md-6">
				<div class="title-box">
				  <h2 class="title">Account Information</h2>
				</div>
				
				<ul class="list-unstyled">
				  <li>
					<div class="form-group">
					  <label>First Name <span class="required">*</span></label>
					  <input class="form-control" type="text" name="First Name" placeholder="Mr." required>
					</div>
					
					<div class="form-group">
					  <label>Last Name <span class="required">*</span></label>
					  <input class="form-control" type="text" name="Last Name" placeholder="Alen" required>
					</div>
				  </li>
				  <li>
					<div class="form-group">
					  <label>Email Address <span class="required">*</span></label>
					  <input class="form-control" type="email" name="email" placeholder="mr-alen@example.com" required>
					</div>
				  </li>
				</ul>
			  </div>
			
			  <div class="col-sm-6 col-md-6">
				<div class="title-box">
				  <h2 class="title">Change Password</h2>
				</div>
				
				<ul class="list-unstyled">
				  <li>
					<div class="form-group">
					  <label>Current Password <span class="required">*</span></label>
					  <input type="password" name="Current Password" class="form-control" required>
					</div>
					<div class="form-group">
					  <label>New Password <span class="required">*</span></label>
					  <input type="password" name="New Password" class="form-control" required>
					</div>
				  </li>
				  <li>
					<div class="form-group">
					  <label>Confirm New Password <span class="required">*</span></label>
					  <input type="password" name="Confirm New Password" class="form-control" required>
					</div>
				  </li>
				</ul>
			  </div>
			</div>
		  
			<div class="buttons-box clearfix">
			  <button class="btn btn-default">Save</button>
			  <span class="required"><b>*</b> Required Field</span>
			</div>
		  </form>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->