<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='.././resources/css/button.css'/>"/>
<link rel="stylesheet" href=".././resources/css/style.css">
<link rel="stylesheet" href=".././resources/css/bootstrap.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function() {
		$('#connectMsgBtn').click(function() {
			var form = $("form[name=msgForm]");
			form.attr("action", "<c:url value='enterChatting.htm'/>");
			form.attr("method", "post");
			form.submit();
		});		
	});
</script>
<style type="text/css">
	.dk-box{
		margin: auto;
		width: 400px;
		height: 280px;
		padding: 70px;
	}
	.dk-box img{
		display: block;
		margin: 0 auto;
	}
</style>
</head>
<body align="center">

			
<div class="dk-box">
<div>
	<img src=".././resources/img/main_logo.png">
</div>
<form name="msgForm" id="msgForm" action="<c:url value='  '/>" method="post">
	<c:if test="${id != null}">
		${id}님, 메신저에 접속 합니다. <br>
		<input class="btn btn-primary" type="button" id="connectMsgBtn" name="connectMsgBtn" value="메신저 접속"/>  <button class="btn btn-danger">나가기</button>
	</c:if>
	<c:if test="${id == null}">
		접속 후 가능한 메뉴입니다. <br/>
		로그인 후 이용해주시기 바랍니다.
	</c:if>
</form>
</div>
</body>
</html>