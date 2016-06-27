<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<link rel="stylesheet" type="text/css" href=".././resources/js/sweetalert.css">   
<script type="text/javascript" src=".././resources/js/sweetalert.min.js"></script>
<script type="text/javascript">
	function getContextPath() {
		   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	$(function() {
		$('#find_id_btn').click(function() {
			if($('#find_id_name').val() == '') {
				swal('이름을 입력해주세요');
				$('#find_id_name').focus();
				return false;
			} else if($('#find_id_email').val() == '') {
				swal('이메일을 입력해주세요');
				$('#find_id_email').focus();
				return false;
			} else {
				$.ajax({
					type : "post", 
					url : getContextPath() + "/member/sendFindIdEmail.htm",
					data : {
						"name" : $('#find_id_name').val(),
						"email" : $('#find_id_email').val()
					},
					success : function(data) {
						console.log(data);
						if(data == '') {
							alert('회원님의 이름과 이메일 주소를 다시 확인해주세요');
						} else {
							alert('회원님의 이메일 주소로 아이디가 전송되었습니다.');
						}
					}
				})
			}
		});
		
		$('#find_pw_btn').click(function() {
			if($('#find_pw_name').val() == '') {
				alert('이름을 입력해주세요');
				$('#find_pw_name').focus();
			} else if($('#find_pw_id').val() == '') {
				alert('아이디를 입력해주세요');
				$('#find_pw_id').focus();
			} else if($('#find_pw_email').val() == '') {
				alert('이메일을 입력해주세요');
				$('#find_pw_email').focus();
			} else {
				$.ajax({
					type : "post", 
					url : getContextPath() + "/member/sendFindPwEmail.htm",
					data : {
						"name" : $('#find_pw_name').val(),
						"id" : $('#find_pw_id').val(),
						"email" : $('#find_pw_email').val()
					},
					success : function(data) {
						console.log(data);
						if(data == '') {
							alert('회원님의 이름과 아이디, 이메일 주소를 다시 확인해주세요');
						} else {
							alert('회원님의 이메일 주소로 임시 비밀번호가 전송되었습니다.');
						}
					}
				})
			}
		});
	});
</script>

<section id="main" class="login-register">
  <header class="page-header">
    <div class="container">
      <h1 class="title">아이디 / 비밀번호 찾기</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <div class="content col-sm-12 col-md-12">
		<div class="row filter-elements hidden">
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<div class="info-box">
			  <h3 class="title">비밀번호 찾기</h3>
			  <p class="descriptions">비밀번호를 잊으셨다구요?<br> 하단의 버튼을 눌러 비밀번호를 찾으세요!</p>
			  <button id="new-costumers" class="btn btn-default filter-buttons" data-filter=".register">Go to Find Password</button>
			</div>
		  </div>

		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<form class="form-box login-form form-validator" action="" method="">
			  <h3 class="title">아이디 찾기</h3>
			  <p>가입한 계정의 이름과 이메일주소를 입력해주세요.</p>
			  <div class="form-group">
				<label>이름: <span class="required">*</span></label>
				<input class="form-control" id="find_id_name" type="text">
              </div>
			  
			  <div class="form-group">
				<label>이메일: <span class="required">*</span></label>
                <input class="form-control" id="find_id_email" type="text">
              </div>

			  <div class="buttons-box clearfix">
				<a id="find_id_btn" class="btn btn-default">Find My ID</a>
				<a href="${pageContext.request.contextPath}/member/join_login.htm" class="btn btn-info">Back to Login</a>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>

		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<form class="form-box register-form form-validator">
			  <h3 class="title">비밀번호 찾기</h3>
			  <p>가입한 계정의 이름, 아이디 그리고 이메일 주소를 입력해주세요.</p>
			  
			  <div class="form-group">
				<label>이름: <span class="required">*</span></label>
                <input type="text" class="form-control" id="find_pw_name">
              </div>
              
              <div class="form-group">
				<label>아이디: <span class="required">*</span></label>
                <input type="text" class="form-control" id="find_pw_id">
              </div>
              
              <div class="form-group">
				<label>이메일: <span class="required">*</span></label>
                <input type="text" class="form-control" id="find_pw_email">
              </div>

			  <div class="buttons-box clearfix">
				<a id="find_pw_btn" class="btn btn-default">Find my Password</a>
				<a href="${pageContext.request.contextPath}/member/join_login.htm" class="btn btn-info">Back to Login</a>
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>

		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<div class="info-box">
			  <h3 class="title">아이디 찾기</h3>
			  <p class="descriptions">아이디를 잊으셨다구요? <br>하단의 버튼을 눌러 아이디를 찾으세요!</p>
			  <button id="login-account" class="btn btn-default filter-buttons active-form" data-filter=".login">Go to Find ID</button>
			</div>
		  </div>
		</div>
      </div>
    </div>
  </div><!-- .container -->
</section><!-- #main -->