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
		var check;
		
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
		
		$('#btn_login_form').click(function() {
			if($('#id_login').val() == '') {
				alert('아이디를 입력해주세요');
				$('#id_login').focus();
				return false;
			} else if($('#pw_login').val() == '') {
				alert('비밀번호를 입력해주세요');
				$('#pw_login').focus();
				return false;
			} else if ($('#id_login').val() != '' && $('#pw_login').val() != ''){
				
				// 아이디, 비밀번호 비교하는거 비동기로 검사하기
				$.ajax({
		        	  type : "post",
		        	  url : "loginCheck.htm",
		        	  data : {"id" : $('#id_login').val(), "pw" : $('#pw_login').val()},
		        	  success : function(data) {
		        		  if(data == 0) {
		        			  alert("비밀번호가 틀렸거나 존재하지 않는 아이디입니다.");
		        			  $('#id_login').focus();
		        			  return false;
		        		  } else {
		        			  $('#login_form').submit();
		        		  }
		        	  }
		          });
			}
		});
	});
	




/* $(document).ready(function(){
	
	
	$("#loginbutton").click(function(){
		
	var tell_pattern =/(^01[016789]$)/;
		
	  
      //alert("ok");
      if ($("#name").val() == "") {
          alert("이름을 꼭 입력하세요!");
          $("#name").focus();
          
      } else if ($("#id_1").val() == "") {
          alert("아이디를 꼭 입력하세요!");
          $("#id_1").focus();
          
      } 
     
         else if ($("#pw_1").val() == "") {
          alert("비밀번호를 꼭 입력하세요!");
          $("#pw_1").focus();

      }else if ($("#confirm_pw").val() == "") {
          alert("비밀번호확인을 꼭 입력하세요!");
          $("#confirm_pw").focus();

      } else if ($("#pw_1").val() != $("#confirm_pw").val()) {
          alert("비밀번호와 비밀번호 확인이 일치하지않습니다.");
          $("#pw_1").val("");
          $("#confirm_pw").val("");
          $("#pw_1").focus();

      } else if ($("#gender").val() =="") {
          alert("성별을 꼭 입력하세요!");
          $("#gender").focus();

      } else if ($("#age").val() == "") {
          alert("나이를 꼭 입력하세요!");
          $("#age").focus();

      } else if ($("#country_code").val() == "") {
          alert("국가코드를 꼭 입력하세요!");
          $("#country_code").focus();
          
      }else if ($("#tel").val() == "") {
          alert("전화번호 첫번째자리 입력하세요!");
          $("#tel").focus();

      } else if ($("#tel").val().length != 11 & $("#tel").val().length > 9) {

          alert("전화번호를 올바르게 입력하세요!");
          $("#tel").val("");
          $("#tel").focus();

      } else if (isNaN($("#tel").val())) {
          alert("전화번호를 올바르게 입력하세요!");
          $("#tel").val("");
          $("#tel").focus();

      } */
      
   
      
      /*
      
      if($("#tel1").val() != "" & $("#tel1").val().length ==3 & !isNaN($("#tel1").val()) ){
      alert("okkkkkkk");
      var pattern = /(^01[016789]$)/; //정규식 슬래쉬(/)로 시작해서, 슬래쉬(/)로 끝났다.
      var tel1=$("#tel1").val();
      if(! pattern.test(tel1)){
      //틀리면
      alert("010, 011, 016, 017, 018, 019,o19만 가능합니다.")  
      $("#tel").val("")
      $("#tel").focus();
             
          }
      }*/

      
    /*   else if ($("#email").val() == "") {
          alert("이메일을 꼭 입력하세요!");
          $("#email").focus();
          
      } else {
          alert("회원가입이 완료 되었습니다");
      }

		
	});
	
	
	
}); */



$(document).ready(function(){
	
	
	$("#loginbutton").click(function(){
		
						var reg_name = /^[a-zA-Z가-힣]/g; //한글10자, 영문20자, 한글,영문,숫자 사용가능
						var reg_id = /^[a-z0-9_-]{4,12}$/;
						var reg_email = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
						var reg_pw = /^[a-z0-9_-]{4,12}$/; // 비밀번호 검사식
						var reg_hp = /^[a-z0-9_-]{10,20}$/;
						var reg_age = /^[0-9]{1,4}$/;
						var name= $('#name'), id = $('#id_1'), pw_1 = $('#pw_1'), confirm_pw = $('confirm_pw'), hp = $('#hp'), email = $('#email'), gender = $('#gender'), age=$('#age'), country_code=$('#country_code'), local_code=$('#local_code');

						if (!reg_name.test(name.val()) == true) {
							alert("이름을 입력해주세요");
							name.focus();
							return false;
							
						} else if (!reg_id.test(id.val()) == true) {
							alert("아이디는 4-12자 이여야 하며 \n"
									+ "마침표,'-', '_'를 제외한 문자는 사용할 수 없습니다.");
							id.focus();
							return false;
						}else if (!reg_pw.test(pw_1.val()) == true) { //비밀번호 검사
							alert('비밀번호가 맞질 않습니다.(최소 4자리 이상)');
							pw_1.focus();
							return false;
						} else if ($('#pw_1').val()!=$('#confirm_pw').val()){ // 비밀번호 확인 검사
							alert('비밀번호가 일치하지 않습니다');
							confirm_pw.focus();
							return false;
						} else if (gender.val() == "") { // 이름 검사
							alert('성별 선택해 주세요.');
							gender.focus();
							return false;
						} else if (!reg_age.test(age.val()) == true) {
							alert("나이를 숫자로 입력해주세요");
							age.focus();
							return false;
						}else if (country_code.val() == "") { // 이름 검사
							alert('국적을 선택해 주세요.');
							country_code.focus();
							return false;

						} else if (!reg_hp.test(hp.val()) == true) { //휴대폰 유효성
							alert('휴대폰 번호를 잘못입력하셨습니다.(최소 10자리 이상)');
							hp.focus();
							return false;
						} else if (!reg_email.test(email.val()) == true) {
							alert('이메일 주소는 @와.를 입력해야합니다.');
							email.focus();
							return false;
						}else{
							alert("로그인 성공");
						} 

			});
    }); // 유효성체크
    









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
			<form class="form-box login-form form-validator" id="login_form" action="${pageContext.request.contextPath}/member/login.htm" method="post">
			  <h3 class="title">Login customers</h3>
			  <p>If you have an account with us, please log in.</p>
			  
			  <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
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
				<input type="text" class="form-control" name="name" id="name">
                <!-- <input type="text" class="form-control" name="name" data-bv-trigger="keyup" required data-bv-notempty-message="The name is required and cannot be empty"> -->
              </div>

			  <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
				<input type="text" class="form-control" name="id_1" id="id_1">
				<!-- <input type="text" class="form-control" name="id"
				  data-bv-trigger="blur"
				  data-bv-message="The username is not valid"
				  required data-bv-notempty-message="The ID is required and cannot be empty"
				  pattern="[a-zA-Z0-9]+" data-bv-regexp-message="The ID can only consist of alphabetical, number"> -->
			  </div>
				
			  <div class="form-group">
				<label>비밀번호: <span class="required">*</span></label>
                <input class="form-control" name="pw_1" id="pw_1" type="password"><!-- 속성에 required를 이용해보자 -->
              </div>
			  
			  <div class="form-group">
				<label>비밀번호 확인: <span class="required">*</span></label>
                <input class="form-control" id="confirm_pw" type="password">
              </div>
			  
			  <div class="form-group">
				<label>성별: <span class="required">*</span></label>
                <select class="form-group" name="gender" id="gender">
                	<option value="">--</option>
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

                <select class="form-group" name="country_code" id="country_code">
                	<option value="">--</option>

                	<c:forEach var="i" items="${country_list}">
                		<option value="${i.country_code}">${i.country_name}</option>
                	</c:forEach>
                </select>
              </div>
              
              <!-- 한국 어느지역 사람인지 나타내주는 코드. 외국인일경우 숨기고, 한국인이면 보여주게하자. 그리고 한국인이 입력안하면 넘어가지 못하게 하자 -->
              <div class="form-group" id="local">
				<label>거주지역: <span class="required">*</span></label>

                <select class="form-group" name="local_code" id="local_code">
                	<option value="-">--</option>
                	<c:forEach var="i" items="${local_list}">
                		<option value="${i.local_code}">${i.local_name} / ${i.local_code}</option>
                	</c:forEach>
                </select>
              </div>
              
              <div class="form-group">
				<label>휴대전화: <span class="required">*</span></label>
                <input class="form-control" id="hp" name="hp" type="text" placeholder="01012345678과 같이 '-'를 뺀 형식으로 입력하세요.">
              </div>
			  
			  <div class="form-group">
				<label>Email: <span class="required">*</span></label>
				<input class="form-control" type="text" name="email" id="email" >
              </div>

			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Create my account</button> -->
				<input type="button" class="btn btn-default" id="loginbutton" value="Create my account">
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