<%-- 
	@Project : Serendipity
	@File name : login_join.jsp
	@Author : 강대규
	@Date : 16.06.08
	@Desc : 로그인/회원가입을 하는 부분.
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
</script> 
<link rel="stylesheet" type="text/css" 
href=".././resources/js/sweetalert.css">    
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript">

	/*
	@Author : 강대규
	@Date : 16.06.08
	@Desc : 외국인일 경우 지역을 입력하는 칸을 보이지 않게 하고, 한국인일 경우에만 보이게 하는 JQuery 메소드
	*/
	
	function getContextPath() {
		   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
		
		
	$(function() {
		var check;
		
		$('#req_confirm_num').click(function() {
			if($('#email').val() == '') {
			/* 	alert('E-mail주소를 입력해주세요'); */
				swal("E-mail 주소를 입력해주세요")
			 }
				else{
				/* alert('입력하신 E-mail주소로 인증번호가 발송됩니다.'); */
				$.ajax({
					type: "post",
					url : getContextPath()+"/member/EmailCheck.htm",
					data : {"email" : $('#email').val()},
					success : function(data) {
		        		  console.log(data);
		        		  if(data == 1) {
		        			  swal("이미 같은 메일이 존재합니다!");
		        			 /*  alert("비밀번호가 틀렸거나 존재하지 않는 아이디입니다."); */
		        			  $('#email').focus();
		        			  return false;
		        		  } else {
		        			  swal("입력하신 E-mail 주소로 인증번호가 발송됩니다.");
		      				$.ajax({
		      		        	  type : "post",
		      		        	  url : getContextPath() + "/email/confirm_email.htm",
		      		        	  data : {"receiver" : $('#email').val()},
		      		        	  success : function(data) {
		      		        		  swal("인증번호를 발송했습니다!", "메일을 확인해주세요!")
		      		        		  $('#confirm').click(function() {
		      		        			  console.log(data);
		      		        			  if($('#confirm_number').val() != data) {
		      		        				  swal("인증정보가 정확하지 않습니다!")
		      		        				 
		      		        			  } else {
		      		        				  swal("인증정보가 확인되었습니다!")
		      		        				  $('#confirm_val').val('1');
		      		        			  }
		      		        		  })
		      		        	  }
		      		          });
		        		  }
		        	  }
				})
				
				
				
				
				
			}
		});
		
		$('#local').hide();
		
		$('#country_code').change(function() {
			if($(this).val() == '82') {
				console.log($(this).val());
				$('#local').show();
			}else {
				console.log($(this).val());
				$('#local').hide();	
			}
		});
		
		//로그인 유효성 검증 
		$('#btn_login_form').click(function() {
			if($('#id_login').val() == '') {
				swal("아이디를 입력해주세요!")
				/* alert('아이디를 입력해주세요'); */
				$('#id_login').focus();
				return false;
			} else if($('#pw_login').val() == '') {
				
				swal("비밀번호를 입력해주세요!")
				$('#pw_login').focus();
				return false;
			} else if ($('#id_login').val() != '' && $('#pw_login').val() != ''){
				
				
				
				// 로그인 아이디, 비밀번호 비교하는거 비동기로 검사하기
				$.ajax({
		        	  type : "post",
		        	  url : "loginCheck.htm",
		        	  data : {"id" : $('#id_login').val(), "pw" : $('#pw_login').val()},
		        	  success : function(data) {
		        		  console.log(data);
		        		  if(data == 0) {
		        			  swal("비밀번호가 틀렸거나 존재하지 않는 아이디입니다.")
		        			 /*  alert("비밀번호가 틀렸거나 존재하지 않는 아이디입니다."); */
		        			  $('#id_login').focus();
		        			  return false;
		        		  } else {
		        			  $('#login_form').submit();
		        		  }
		        	  }
		          });
			}
		});
		
		$("#loginbutton").click(function(){
			
			var reg_name = /^[a-zA-Z가-힣]/g; //한글10자, 영문20자, 한글,영문,숫자 사용가능
			var reg_id = /^[a-z0-9_-]{4,12}$/;
			var reg_email = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
			var reg_pw = /^[a-z0-9_-]{4,12}$/; // 비밀번호 검사식
			var reg_hp = /^[a-z0-9_-]{10,20}$/;
			var reg_age = /^[0-9]{1,4}$/;
			var name= $('#name'), id = $('#id_1'), pw_1 = $('#pw_1'), confirm_pw = $('confirm_pw'), hp = $('#hp'), email = $('#email'), gender = $('#gender'), age=$('#age'), country_code=$('#country_code'), local_code=$('#local_code');

			if (!reg_name.test(name.val()) == true) {
				swal("이름을 입력해주세요")
				/* alert("이름을 입력해주세요"); */
				name.focus();
				return false;
				
			} else if (!reg_id.test(id.val()) == true) {
				swal("아이디는 4-12자 이여야 하며 \n"
						+ "마침표,'-', '_'를 제외한 문자는 사용할 수 없습니다.")
				/* alert("아이디는 4-12자 이여야 하며 \n"
						+ "마침표,'-', '_'를 제외한 문자는 사용할 수 없습니다."); */
				id.focus();
				return false;
			 }else if (!reg_pw.test(pw_1.val()) == true) { //비밀번호 검사
					swal("비밀번호를 다시 입력해주세요.(최소 4자리 이상)")
				 /* alert('비밀번호를 다시 입력해주세요.(최소 4자리 이상)'); */
				pw_1.focus();
				return false;
			} else if ($('#pw_1').val()!=$('#confirm_pw').val()){ // 비밀번호 확인 검사
				/* alert('비밀번호가 일치하지 않습니다'); */
				swal("비밀번호가 일치하지 않습니다")
				confirm_pw.focus();
				return false;
			} else if (gender.val() == "") { // 이름 검사
				/* alert('성별 선택해 주세요.'); */
				swal("성별 선택해 주세요.")
				gender.focus();
				return false;
			} else if (!reg_age.test(age.val()) == true) {
				/* alert("나이를 숫자로 입력해주세요"); */
				swal("나이를 숫자로 입력해주세요")
				age.focus();
				return false;
			}else if (country_code.val() == "") { // 이름 검사
				/* alert('국적을 선택해 주세요.'); */
				swal("국적을 선택해 주세요.")
				country_code.focus();
				return false;
			} else if (!reg_hp.test(hp.val()) == true) { //휴대폰 유효성
				/* alert('휴대폰 번호를 잘못입력하셨습니다.(최소 10자리 이상)'); */
				swal("휴대폰 번호를 잘못입력하셨습니다.(최소 10자리 이상)")
				hp.focus();
				return false;
			} else if (!reg_email.test(email.val()) == true) {
				/* alert('이메일 주소는 @와.를 입력해야합니다.'); */
				swal("이메일 주소는 @와.를 입력해야합니다.")
				email.focus();
				return false;
			} else if($('#confirm_val').val() == '0') {
				/* alert('E-mail 인증이 완료되지 않았습니다.'); */
				swal("E-mail 인증이 완료되지 않았습니다.")
				return false;
			} else if($('#id_check_val').val() == '0') {
				/* alert('아이디 중복검사를 먼저 해주시기 바랍니다.'); */
				swal("아이디 중복검사를 먼저 해주시기 바랍니다.")
				return false;
			} else{
				/* alert("회원가입 성공"); */
				swal("회원가입이 되었습니다!","성공","success")
			} 

			
			
		});
		
		$("#id_button").click(function(){
		    
			if ($('#id_1').val() == ''){
			/* 	alert("ID를 입력해주세요"); */
				swal("ID를 입력해주세요.")
				$("#id_1").focus();
				return false;
				
			}else{
				$.ajax({
		        	  type : "post",
		        	  url : "IdCheck.htm",
		        	  data : {"id" : $('#id_1').val()},
		        	  success : function(data) {
		        		  console.log(data);
		        		  if(data == 0) {
		        			 /*  alert("사용가능한 아이디입니다."); */
		        			  swal("사용가능한 아이디입니다.")
		        			  $('#id_check_val').val('1');
		        		  } else {
		        			 /*  alert("이미 존재하는 아이디입니다."); */
		        			  swal("이미 존재하는 아이디입니다.")
		        			  $('#id_1').focus();
		        		  }
		        	  }
		          });
				
			}
		});
		
		$("#login").click(function(){

    		var id_login=('#id') , password=('#pw');
			var reg_id = /^[a-z0-9_-]{4,12}$/;
			var reg_pw = /^[a-z0-9_-]{4,12}$/; // 비밀번호 검사식
			
			
    		if (!reg_id.test(id_login.val()) == true) {
				/* alert("아이디는 4-12자 이여야 하며 \n"
						+ "마침표,'-', '_'를 제외한 문자는 사용할 수 없습니다."); */
				swal("아이디는 4-12자 이여야 하며 \n"
						+ "마침표,'-', '_'를 제외한 문자는 사용할 수 없습니다.")
				id_login.focus();
				return false;
			}else if (!reg_pw.test(password.val()) == true) { //비밀번호 검사
			/* 	alert('비밀번호를 다시 입력해주세요.(최소 4자리 이상)'); */
				swal("비밀번호를 다시 입력해주세요.(최소 4자리 이상)")
				password.focus();
				return false;
			}

		});
		
		
		
	});
	
</script>

<!-- 로그인/회원가입부분 -->
<section id="main" class="login-register">
  <header class="page-header">
    <div class="container">
      <h1 class="title"><spring:message code="member.join_login"/></h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <div class="content col-sm-12 col-md-12">
		<div class="row filter-elements hidden">
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<div class="info-box">
			  <h3 class="title"><spring:message code="member.join_login1"/></h3>
			  <p class="descriptions"><spring:message code="member.join_login2"/></p>
			  <button id="new-costumers" class="btn btn-default filter-buttons" data-filter=".register"><spring:message code="member.join_login3"/></button>
			</div>
		  </div>
		  
		  
		  <!-- 로그인하는 Form태그가 있는 부분 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<form class="form-box login-form form-validator" id="login_form" action="${pageContext.request.contextPath}/member/login.htm" method="post">
			  <h3 class="title"><spring:message code="member.join_login4"/></h3>
			  <p><spring:message code="member.join_login5"/></p>
			  
			  <div class="form-group">
				<label>ID: <span class="required">*</span></label>
				<input class="form-control" name="id" id="id_login" type="text"> <!--  required data-bv-emailaddress-message="The input is not a valid email address">-->
              </div>
			  
			  <div class="form-group">
				<label>Password: <span class="required">*</span></label>
                <input class="form-control" name="pw" id="pw_login" type="password">
              </div>
			  
			  <div class="buttons-box clearfix">
				<input type="submit" id="btn_login_form" class="btn btn-default" value="Login">
				
				<!-- 각종 SNS로 로그인하는 버튼 만드는 부분 -->
				<button class="btn btn-info"><i class="fa fa-twitter"></i> Login with Twitter</button>
				<a href="${pageContext.request.contextPath}/member/recover_id_pw.htm" class="forgot">아이디/비밀번호를 잊으셨나요?</a>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 로그인 form태그 끝 -->
		  
		  
		  <!-- 회원가입 Form태그 -->
		  <div id="joinDiv" class="col-xs-12 col-sm-6 col-md-6 box register">
			
			  <h3 class="title">Registered customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			<form class="form-box register-form form-validator" action="joinMember.htm" method="post" id="joinMember">
			  <div class="form-group">
			  	<label><spring:message code="member.join_login_re10"/><span class="required">*</span></label>
			    <input type="text" name="email" class="form-control" id="email">		  
			  </div>  
			  <div class="form-group">
			  	인증번호: 
			    <input type="text" class="form-control" id="confirm_number">
			    <input type="hidden" id="confirm_val" value="0">
			    	<a id="req_confirm_num" class="btn btn-danger">인증번호 요청</a> <a id="confirm" class="btn btn-danger">인증번호 확인</a>		  
			  </div> 
			  
			  <div class="form-group">
				<label><spring:message code="member.join_login_re"/><span class="required" >*</span></label>
				<input type="text" class="form-control" name="name" id="name">
                <!-- <input type="text" class="form-control" name="name" data-bv-trigger="keyup" required data-bv-notempty-message="The name is required and cannot be empty"> -->
              </div>

			  <div class="form-group">
				<label><spring:message code="member.join_login_re1"/><span class="required" id="id_text">*</span></label>
				<input type="text" class="form-control" name="id" id="id_1">
				<input type="button" class="btn btn-default" id="id_button" value="<spring:message code="member.join_login_re2"/>"/>
				<input type="hidden" id="id_check_val" value="0">
				<!-- <input type="text" class="form-control" name="id"
				  data-bv-trigger="blur"
				  data-bv-message="The username is not valid"
				  required data-bv-notempty-message="The ID is required and cannot be empty"
				  pattern="[a-zA-Z0-9]+" data-bv-regexp-message="The ID can only consist of alphabetical, number"> -->
			  </div>
				
			  <div class="form-group">
				<label><spring:message code="member.join_login_re3"/><span class="required">*</span></label>
                <input class="form-control" name="pw" id="pw_1" type="password"><!-- 속성에 required를 이용해보자 -->
              </div>
			  
			  <div class="form-group">
				<label><spring:message code="member.join_login_re4"/><span class="required">*</span></label>
                <input class="form-control" id="confirm_pw" type="password">
              </div>
			  
			  <div class="form-group">
				<label><spring:message code="member.join_login_re5"/><span class="required">*</span></label>
                <select class="form-group" name="gender" id="gender">
                	<option value="">--</option>
                	<option value="M">남자</option>
                	<option value="F">여자</option>
                </select>
              </div>
              
              <div class="form-group">
				<label><spring:message code="member.join_login_re6"/><span class="required">*</span></label>
                <input class="form-control" id="age" type="text">
              </div>
              
              <div class="form-group">
				<label><spring:message code="member.join_login_re7"/><span class="required">*</span></label>

                <select class="form-group" name="country_code" id="country_code">
                	<option value="">--</option>

                	<c:forEach var="i" items="${country_list}">
                		<option value="${i.country_code}">${i.country_name}</option>
                	</c:forEach>
                </select>
              </div>
              
              <!-- 한국 어느지역 사람인지 나타내주는 코드. 외국인일경우 숨기고, 한국인이면 보여주게하자. 그리고 한국인이 입력안하면 넘어가지 못하게 하자 -->
              <div class="form-group" id="local">
				<label><spring:message code="member.join_login_re8"/><span class="required">*</span></label>

                <select class="form-group" name="local_code" id="local_code">
                	<option value="-">--</option>
                	<c:forEach var="i" items="${local_list}">
                		<option value="${i.local_code}">${i.local_name} / ${i.local_code}</option>
                	</c:forEach>
                </select>
              </div>
              
              <div class="form-group">
				<label><spring:message code="member.join_login_re9"/><span class="required">*</span></label>
                <input class="form-control" id="hp" name="hp" type="text" placeholder="01012345678과 같이 '-'를 뺀 형식으로 입력하세요.">
              </div>

			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Create my account</button> -->
				<input type="submit" class="btn btn-default" id="loginbutton" value="<spring:message code="member.join_login_re11"/>">
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