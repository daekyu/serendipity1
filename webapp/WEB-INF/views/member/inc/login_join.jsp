<%-- 
	@Project : Serendipity
	@File name : login_join.jsp
	@Author : 강대규
	@Date : 16.06.08
	@Desc : 로그인/회원가입을 하는 부분.
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">
	/*
	@Author : 강대규
	@Date : 16.06.08
	@Desc : 외국인일 경우 지역을 입력하는 칸을 보이지 않게 하고, 한국인일 경우에만 보이게 하는 JQuery 메소드
	*/
	$(function() {
		$('#local').hide();
		
		$('#country').change(function() {
			if($(this).val() == '82') {
				console.log($(this).val());
				$('#local').show();
			}else {
				console.log($(this).val());
				$('#local').hide();	
			}
		});
	});
</script>

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
			<form class="form-box login-form form-validator" action="login.htm" method="post">
			  <h3 class="title">Login customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			  <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
				<input class="form-control" name="id" type="text" required> <!--  required data-bv-emailaddress-message="The input is not a valid email address">-->
              </div>
			  
			  <div class="form-group">
				<label>Password: <span class="required">*</span></label>
                <input class="form-control" name="pw" type="password" required>
              </div>
			  
			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Login</button> -->
				<input type="submit" class="btn btn-default" value="Login">
				<button class="btn btn-info"><i class="fa fa-twitter"></i> Login with Twitter</button>
				<a href="shop-forgot.html" class="forgot">Forgot Your Password?</a>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 로그인 form태그 끝 -->
		  
		  
		  <!-- 회원가입 Form태그 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<form class="form-box register-form form-validator" action="joinMember.htm" method="post">
			  <h3 class="title">Registered customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			  <div class="form-group">
				<label>이름: <span class="required">*</span></label>
				<input type="text" class="form-control" name="name">
                <!-- <input type="text" class="form-control" name="name" data-bv-trigger="keyup" required data-bv-notempty-message="The name is required and cannot be empty"> -->
              </div>

			  <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
				<input type="text" class="form-control" name="id">
				<!-- <input type="text" class="form-control" name="id"
				  data-bv-trigger="blur"
				  data-bv-message="The username is not valid"
				  required data-bv-notempty-message="The ID is required and cannot be empty"
				  pattern="[a-zA-Z0-9]+" data-bv-regexp-message="The ID can only consist of alphabetical, number"> -->
			  </div>
				
			  <div class="form-group">
				<label>비밀번호: <span class="required">*</span></label>
                <input class="form-control" name="pw" id="pw" type="password"><!-- 속성에 required를 이용해보자 -->
              </div>
			  
			  <div class="form-group">
				<label>비밀번호 확인: <span class="required">*</span></label>
                <input class="form-control" id="confirm_pw" type="password">
              </div>
			  
			  <div class="form-group">
				<label>성별: <span class="required">*</span></label>
                <select class="form-group" name="gender">
                	<option value="-">--</option>
                	<option value="M">남자</option>
                	<option value="F">여자</option>
                </select>
              </div>
              
              <div class="form-group">
				<label>나이: <span class="required">*</span></label>
                <input class="form-control" id="age" type="text">
              </div>
              
              <div class="form-group">
				<label>국적: <span class="required">*</span></label>
                <select class="form-group" name="country_code" id="country">
                	<option>--</option>
                	<c:forEach var="i" items="${country_list}">
                		<option value="${i.country_code}">${i.country_name}</option>
                	</c:forEach>
                </select>
              </div>
              
              <!-- 한국 어느지역 사람인지 나타내주는 코드. 외국인일경우 숨기고, 한국인이면 보여주게하자. 그리고 한국인이 입력안하면 넘어가지 못하게 하자 -->
              <div class="form-group" id="local">
				<label>거주지역: <span class="required">*</span></label>
                <select class="form-group" name="local_code">
                	<option>--</option>
                	<c:forEach var="i" items="${local_list}">
                		<option value="${i.local_code}">${i.local_name} / ${i.local_code}</option>
                	</c:forEach>
                </select>
              </div>
              
              <div class="form-group">
				<label>전화번호: <span class="required">*</span></label>
                <input class="form-control" id="hp" name="hp" type="text" placeholder="01012345678과 같이 '-'를 뺀 형식으로 입력하세요.">
              </div>
			  
			  <div class="form-group">
				<label>Email: <span class="required">*</span></label>
				<input class="form-control" name="email" type="email" required data-bv-emailaddress-message="The input is not a valid email address">
              </div>

			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Create my account</button> -->
				<input type="submit" class="btn btn-default" value="Create my account">
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