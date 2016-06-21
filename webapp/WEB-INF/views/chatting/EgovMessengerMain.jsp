<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>messenger</title>
<link type="text/css" rel="stylesheet" href="<c:url value='.././resources/css/table.css'/>"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- <script src="resource/js/json2.js"></script>-->
<script>
	//chat 팝업창을 여러개 띄우기 위함	
	var webSocket = null;
	
	$(document).ready(function() {
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/usersServerEndpoint';
		webSocket = connection(url);
		var connectionType;
		
		webSocket.onopen = function(){ processOpen(); };
		webSocket.onmessage = function(message) { processMessage(message); };
		webSocket.onerror = function(message) { processError(message); };
		
	});
	//var webSocket = new WebSocket('ws://' + window.location.host + '/egov-messenger/usersServerEndpoint');
	
	
	function connection(url) {
		var webSocket = null;
		if ('WebSocket' in window) {
			webSocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			webSocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return webSocket;
	}
	
	function processOpen() {
		connectionType = "firstConnection";
		id = "${id}";
		webSocket.send(JSON.stringify({ "connectionType" : connectionType, "id" : id }));
	}
		
	//server에서 메시지가 넘어왔을때
	function processMessage(message) {
		var jsonData = JSON.parse(message.data);
		
		if (jsonData.allUsers != null) {
			//다른 사용자 접속 시,
			displayUsers(jsonData.allUsers);
		} 
		
		if (jsonData.disconnectedUser != null) {
			//다른 사용자가 접속을 끊을 때,
			$("#"+jsonData.disconnectedUser).remove();
		}
		
		//다른 사용자와 대화하고자 시도할 때, 채팅창을 팝업
		if (jsonData.enterChatId != null) {
			var roomId = jsonData.enterChatId;
			$("#roomId").val(roomId);
			$("#id").val(jsonData.id);
			openPopup(roomId);
		}
	}
	
	function openPopup(roomId) {
		var popOptions = "width= 400, height= 550, resizable=yes, status= no, scrollbar= yes"; 
		var targetTitle = random(roomId); //두명의 사용자가 다른 팝업으로 뜨기 위해서 targetTitle을 랜덤으로 만들어준다.
		popupPost("<c:url value='/chatting/chattingPopup.htm'/>", targetTitle, popOptions);
	}
	
	function popupPost(url, target, option) {
		window.open("", target, option);
		
		var form = $("form[name=usersForm]");
		form.attr("target", target);
		form.attr("action", url);
		form.attr("method", "post");
		form.submit();
	}
	
	
	function displayUsers(userList) {
		var id;
		$("#ids tr:not(:first)").remove();
		for (var i=0; i<userList.length; i++) {
			if("${id}"==userList[i]) {
				id = userList[i]+"(me!)";
			} else {
				id = userList[i];
			}
			$.newTr = $("<tr id="+userList[i]+" onclick='trClick(this)'><td>"+ id +"</td></tr>");
			//append
			$("#ids").last().append($.newTr);
			
		}
	}
	
	//다른 사용자 선택 시, 선택한 사용자 값을 서버에 전달
	function trClick(selectedTr) {
		if (selectedTr.id != null) {
				connectionType = "chatConnection";
				webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTr.id }));
			}
	}
	
	function random(roomId) {
		<%
			String rUid = "";
			for(int i=0; i<8; i++) {
				rUid += (char)((Math.random()*26)+97);
			}
		%>
		return roomId+"."+"<%=rUid%>";
	}
	
	function processError(message) {
		/* messagesTextArea.value += "error...\n"; */
	}

	window.onbeforeunload = function() {
		webSocket.close();
	};
</script>
</head>
<body>
	<!-- <textarea id="messagesTextArea" readonly="readonly" rows="10" cols="45"></textarea>
	<textarea id="usersTextArea" readonly="readonly" rows="10" cols="10"></textarea>
	<br />
	<br />
	<input id="textMessage" type="text" size="50" />
	<select id="locationSelect">
		<option value="US">US</option>
		<option value="Canada">Canada</option>
		<option value="Other">Other</option>
	</select> -->
	<form name="usersForm">
		<input type="hidden" id="roomId" name="roomId"/>
		<input type="hidden" id="id" name="id"/>
	<br/>
	<div id="content">Web MESSENGER!!</div>
	본인 외의 대화상태를 선택하면 대화창이 뜹니다. <br/>
	<!-- List -->
	<table id="ids" name="ids" cellspacing='0'><!-- cellspacing='0' is important, must stay -->
    	<tr><th>Web Messenger Users</th></tr><!-- Table Header -->
    	<tr><td>There is no one to chat</td></tr>
    </table>
	</form>
</body>
</html>
