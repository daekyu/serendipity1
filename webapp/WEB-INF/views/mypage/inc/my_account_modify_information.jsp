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
      <h1 class="title">개인정보 수정</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-9 content">
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
			<form class="form-box" action="login.htm" method="post">
			  <h3 class="title">추가정보 수정</h3>
			  <p>요 밑에 테이블 이상하게 보이는건 나중에 수정해보자...</p>
			  
              <table class="table">
              	<tr>
              		<td>취미/관심사</td>
              		<td>언어</td>
              	</tr>
              	<tr>
              		
              		<td>
              			<c:forEach var="i" items="${hobby_list}" varStatus="j">
						  	<input type="checkbox" name="hobby">${i.hobby_name}<br>
						</c:forEach>
              		</td>
              		
              		
              		<td>
              			<c:forEach var="i" items="${language_list}" varStatus="j">
						  	<input type="checkbox" name="language">${i.language_name}<br>
						</c:forEach>
              		</td>
              	</tr>
              	
              	<tr>
              		<th>사진: </th>
              		<td><input type="file"></td>
              	</tr>
              	
              	<tr>
              		<th>자기소개: </th>
              		<td><textarea class="form-control" style="resize:none; height:100px;" wrap="soft" name="board_Content"></textarea></td>
              	</tr>
              </table>
			  
			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Login</button> -->
				<input type="submit" class="btn btn-default" value="수정하기">
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 추가정보수정 form태그 끝 -->
		  
		  
		  <!-- 기본정보수정 Form태그 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<form class="form-box register-form form-validator" action="joinMember.htm" method="post">
			  <h3 class="title">기본정보 수정</h3>
			  <p>여기는 그냥 회원가입/로그인하고 그냥 같음</p>
			  
			  <div class="form-group">
				<label>이름: <span class="required">*</span></label>
				<input type="text" class="form-control" name="name" value="${member_info.name}">
                <!-- <input type="text" class="form-control" name="name" data-bv-trigger="keyup" required data-bv-notempty-message="The name is required and cannot be empty"> -->
              </div>

			  <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
				<input type="text" class="form-control" name="id" value="${member_info.id}">
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
                <input class="form-control" id="age" type="text" value="${member_info.age}">
              </div>
              
              <div class="form-group">
				<label>국적: <span class="required">*</span></label>
                <select class="form-group" name="country_code" id="country">
                	<option value="-">--</option>
                	<c:forEach var="i" items="${country_list}">
                		<option value="${i.country_code}">${i.country_name}</option>
                	</c:forEach>
                </select>
              </div>
              
              <!-- 한국 어느지역 사람인지 나타내주는 코드. 외국인일경우 숨기고, 한국인이면 보여주게하자. 그리고 한국인이 입력안하면 넘어가지 못하게 하자 -->
              <div class="form-group" id="local">
				<label>거주지역: <span class="required">*</span></label>
                <select class="form-group" name="local_code">
                	<option value="-">--</option>
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
      
      <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
    
  </div><!-- .container -->
</section><!-- #main -->