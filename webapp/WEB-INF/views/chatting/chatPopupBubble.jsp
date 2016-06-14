<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='.././resources/css/bubbleChat.css'/>"/>

<title>WebSocket messenger</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	var websocket = null;
	var first = "true";
	$('#sendBtn').attr("disabled", true);
	
	
	$(document).ready(function() {
		//var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/'+'${roomId}'; // 원본
		var url = 'ws://' + window.location.host + '${pageContext.request.contextPath}/chat/'+'${roomId}';
		websocket = connection(url);
		
		websocket.onopen = function(){
			send('${id}');
			$('#sendBtn').attr("disabled", false);
		};

		websocket.onmessage = function(message) {
			processMessage(message);
			//console.log(message); //나중에 지우자
		};
		
		websocket.onclose = function() {
			//console.log('Info: WebSocket closed.');
		};
		
		websocket.onerror = function(message) {
			processError(message);
		};
		
		$('#sendBtn').click(function() {
			send(textMessage.value);
			textMessage.value = "";
		});
		
		$('#textMessage').keypress(function(e) {
			if(e.which==13) {
				send(textMessage.value);
				textMessage.value = "";
			}
		});
		
		$('#leaveBtn').click(function() {
			websocket.close();
			window.close();
		});
	});

	function processMessage(message) {
		
		var jsonData = JSON.parse(message.data);
		
		//alert("jsonData: " + jsonData.messageType + "," + jsonData.name +  "," + jsonData.message + "," + jsonData.users  );
		if (jsonData.messageType == "ChatMessageDTO") {
			message = jsonData.name + " : "+ jsonData.message + '\n';
			//display(message);
			
			displaybubble(jsonData);
		} else if (jsonData.messageType == "UsersMessageDTO") {
			var other = "";
			for(var i = 0; i<jsonData.ids.length; i++) {
				if ("${id}"!=jsonData.ids[i]) {
					$('#ids').append(jsonData.ids[i]+"님과 대화중입니다.");
					other = jsonData.ids[i];
					first = "false";
				}
			}
			if(first=="false" && other=="") {
				$('#ids').empty();
				$('#ids').append("대화상대가 아무도 없습니다.");
			} 
		}
	}
	
	function connection(url) {
		var websocket = null;
		if ('WebSocket' in window) {
			websocket = new WebSocket(url);
		} else if ('MozWebSocket' in window) {
			websocket = new MozWebSocket(url);
		} else {
			Console.log('Error: WebSocket is not supported by this browser.');
            return null;
		}
		return websocket;
	}

	function send(message) {
		websocket.send(JSON.stringify({ 'message' : message , 'room' : "${roomId}"}));
	}
	
	function display(message) {
		
	}
	
	function displaybubble(data) {
		console.log(data);
		//message = jsonData.name + " : "+ jsonData.message + '\n';
		if (data.name == "${id}") {
			
			$('#chat').append(data.name+"(me)<br/><div class='bubble right'><span class='tail'>&nbsp;</span>"+data.message +"</div>");
	      	    
		} else {
		    $('#chat').append(data.name+"<br/><div class='bubble left'><span class='tail'>&nbsp;</span>"+data.message+"</div>");
		}
	}

	function processError(message) {
	}

 	window.onbeforeunload = function() {
		websocket.close();
		
	};  
</script>
</head>
<body>
	
	<div class="chat" id="chat">
	    <p>
	       <div id="ids"></div>
	    </p>
	    <hr/>
	</div>
	<br/>
	<input id="textMessage" type="text" style="width: 300px" />
	<input type="button" id="sendBtn" name="sendBtn" value="Send"/>
	<input type="button" id="leaveBtn" name="leaveBtn" value="Leave"/>
</body>
</html>
