<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
		
		$('#btnSubmit').click(function(){
			if($('#pw').val() != $('#confirm_pw').val()){
				alert("비밀번호와 확인 입력값이 일치하지 않습니다.");
				return false;
			}else{
				mo.submit();
			}
		});
		
	});
</script>

<!-- 로그인/회원가입부분 -->
<section id="main" class="login-register">
  <header class="page-header">
    <div class="container">
      <h1 class="title">
<spring:message code="mypage.my_account_modify_information"/></h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-9 content">
		<div class="row filter-elements hidden">
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<div class="info-box">
			  <h3 class="title"><spring:message code="mypage.my_account_modify_information1"/></h3>
			  <p class="descriptions"><spring:message code="mypage.my_account_modify_information2"/></p>
			  <button id="new-costumers" class="btn btn-default filter-buttons" data-filter=".register"><spring:message code="mypage.my_account_modify_information3"/></button>
			</div>
		  </div>
		  
		  
		  <!-- 로그인하는 Form태그가 있는 부분 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box login">
			<form class="form-box" action="InfoModify.htm" method="post" enctype="multipart/form-data">
			<%-- <input type="hidden" name="user_name" value="${sessionScope.user_num}"> --%>
			  <h3 class="title"><spring:message code="mypage.my_account_modify_information4"/></h3>
			  <input type="hidden" name="user_num" value="${sessionScope.user_num}">
              <table class="table">
              	<tr >
              		<th><spring:message code="mypage.my_account_modify_information5"/> </th>
              		<td >
              			<c:forEach var="i" items="${language_list}" varStatus="j"> 
						  	<input type="checkbox" name="language_code" value="${i.language_code}">${i.language_name}<br>
						</c:forEach>
              		</td> 
              	</tr>
              	
              	<tr>
              		<th><spring:message code="mypage.my_account_modify_information6"/></th>
              		<td >
              			<c:forEach var="i" items="${hobby_list}" varStatus="j">
						  	<input type="checkbox" name="hobby_code" value="${i.hobby_code}">${i.hobby_name}<br>
						</c:forEach>
              		</td> 
              	</tr>
              	
              	<tr>
              		<th><spring:message code="mypage.my_account_modify_information7"/> </th>
              		<td><input type="file" name="profile_picture"></td>
              	</tr>
              	
              	<tr>
              		<th><spring:message code="mypage.my_account_modify_information8"/> </th>
              		<td><textarea class="form-control" style="resize:none; height:100px;" wrap="soft" name="profile_description">${member_info.profile_description}</textarea></td>
              	</tr>
              </table> 
			  
			  <div class="buttons-box clearfix">
				<!-- <button class="btn btn-default">Login</button> -->
				<input type="submit" class="btn btn-default" value="<spring:message code="mypage.my_account_modify_information8.1"/>">
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 추가정보수정 form태그 끝 -->
		  
		  
		  <!-- 기본정보수정 Form태그 -->
		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<form name="mo" class="form-box register-form form-validator" action="InfoModify2.htm?user_num=${sessionScope.user_num}" method="post">
			  <h3 class="title"><spring:message code="mypage.my_account_modify_information9"/></h3>
			  
			  
			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information10"/> <span class="required">*</span></label>
				<input type="text" class="form-control" name="name" value="${member_info.name}" readonly>
                <!-- <input type="text" class="form-control" name="name" data-bv-trigger="keyup" required data-bv-notempty-message="The name is required and cannot be empty"> -->
              </div>

			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information11"/> <span class="required">*</span></label>
				<input type="text" class="form-control" name="id" value="${member_info.id}" readonly>
			  </div>
				
			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information12"/> <span class="required">*</span></label>
                <input class="form-control" name="pw" id="pw" type="password">              
              </div>
			  
			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information13"/> <span class="required">*</span></label>
                <input class="form-control" id="confirm_pw" type="password">
              </div>
			  
			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information14"/> <span class="required">*</span></label>
                <c:choose>
                	<c:when test="${member_info.gender == 'M'}">
                		<input class="form-control" value="<spring:message code="mypage.my_account_modify_information14.1"/>" readonly>
                	</c:when>
                	<c:otherwise>
	                	<input class="form-control" value="<spring:message code="mypage.my_account_modify_information14.2"/>" readonly>
                	</c:otherwise>
                </c:choose>
              </div>
              
              <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information15"/><span class="required">*</span></label>
                <input class="form-control" id="age" type="text" value="${member_info.age}" readonly>
              </div>
              
              <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information16"/> <span class="required">*</span></label>
                <input class="form-control" id="age" type="text" value="${country}" readonly>
              </div>
              
              <div class="form-group" id="local">
				<label><spring:message code="mypage.my_account_modify_information17"/> <span class="required">*</span></label>
                <select class="form-group" name="local_code">
                	<option value="-">--</option>
                	<c:forEach var="i" items="${local_list}">
                		<option value="${i.local_code}">${i.local_name} / ${i.local_code}</option>
                	</c:forEach>
                </select>
              </div>
              
              <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information18"/> <span class="required">*</span></label>
                <input class="form-control" id="hp" name="hp" type="text" placeholder="01012345678과 같이 '-'를 뺀 형식으로 입력하세요." value="${member_info.hp}">
              </div>
			  
			  <div class="form-group">
				<label><spring:message code="mypage.my_account_modify_information19"/> <span class="required">*</span></label>
				<input class="form-control" name="email" type="email" required data-bv-emailaddress-message="The input is not a valid email address" value="${member_info.email}">
              </div>

			  <div class="buttons-box clearfix">
				<input type="button" class="btn btn-default" value="<spring:message code="mypage.my_account_modify_information20"/>" id="btnSubmit">
				<span class="required"><b>*</b> Required Field</span>
			  </div>
			</form><!-- .form-box -->
		  </div>
		  <!-- 회원가입 form태그 끝 -->

		  <div class="col-xs-12 col-sm-6 col-md-6 box register">
			<div class="info-box">
			  <h3 class="title"><spring:message code="mypage.my_account_modify_information21"/></h3>
			  <p class="descriptions"><spring:message code="mypage.my_account_modify_information22"/></p>
			  <button id="login-account" class="btn btn-default filter-buttons active-form" data-filter=".login"><spring:message code="mypage.my_account_modify_information23"/></button>
			</div>
		  </div>
		</div>
      </div>
      
      <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
    
  </div><!-- .container -->
</section><!-- #main -->