<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 로그인/회원가입부분 -->
<section id="main" class="login-register">
  <header class="page-header">
    <div class="container">
      <h1 class="title">Login or Create an Account</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <div class="content col-sm-12 col-md-12">
		<div class="row filter-elements hidden">
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<div class="info-box">
			  <h3 class="title">New costumers</h3>
			  <p class="descriptions">By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			  <button id="new-costumers" class="btn btn-default filter-buttons" data-filter=".register">Create an Account</button>
			</div>
		  </div>
		  
		  
		  <!-- 로그인하는 Form태그가 있는 부분 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<form class="form-box login-form form-validator">
			  <h3 class="title">Login customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			  <div class="form-group">
				<label>Email Address: <span class="required">*</span></label>
				<input class="form-control" name="email" type="email" required data-bv-emailaddress-message="The input is not a valid email address">
              </div>
			  
			  <div class="form-group">
				<label>Password: <span class="required">*</span></label>
                <input class="form-control" name="password" type="password" required>
              </div>
			  
			  <div class="buttons-box clearfix">
				<button class="btn btn-default">Login</button>
				<button class="btn btn-info"><i class="fa fa-twitter"></i> Login with Twitter</button>
				<a href="shop-forgot.html" class="forgot">Forgot Your Password?</a>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 로그인 form태그 끝 -->
		  
		  
		  <!-- 회원가입 Form태그 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<form class="form-box register-form form-validator">
			  <h3 class="title">Registered customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			  <div class="form-group">
				<label>이름: <span class="required">*</span></label>
                <input type="text" class="form-control" name="fullName" data-bv-trigger="keyup" required data-bv-notempty-message="The full name cannot be empty">
              </div>

			  <div class="form-group">
				<label>Username: <span class="required">*</span></label>
				<input type="text" class="form-control" name="username"
				  data-bv-trigger="blur"
				  data-bv-message="The username is not valid"
				  required data-bv-notempty-message="The username is required and cannot be empty"
				  pattern="[a-zA-Z0-9_\.]+" data-bv-regexp-message="The username can only consist of alphabetical, number, dot and underscore">
			  </div>
				
			  <div class="form-group">
				<label>Password: <span class="required">*</span></label>
                <input class="form-control" name="password" type="password" required>
              </div>
			  
			  <div class="form-group">
				<label>Email: <span class="required">*</span></label>
				<input class="form-control" name="email" type="email" required data-bv-emailaddress-message="The input is not a valid email address">
              </div>

			  <div class="buttons-box clearfix">
				<button class="btn btn-default">Create my account</button>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 회원가입 form태그 끝 -->

		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<div class="info-box">
			  <h3 class="title">My Account</h3>
			  <p class="descriptions">By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
			  <button id="login-account" class="btn btn-default filter-buttons active-form" data-filter=".login">Login an Account</button>
			</div>
		  </div>
		</div>
      </div>
    </div>
  </div><!-- .container -->
</section><!-- #main -->