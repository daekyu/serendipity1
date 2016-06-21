<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<c:url value='.././resources/css/bubbleChat.css'/>"/>

<title>WebSocket messenger</title>
<!-- Favicon -->
		<link rel="shortcut icon" href=".././resources/img/favicon.ico">
		
		<!-- Font -->
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic,700italic'>
		
		<!-- Plugins CSS -->
		<link rel="stylesheet" href=".././resources/css/bootstrap.css">
		<link rel="stylesheet" href=".././resources/css/font-awesome.min.css">
		<link rel="stylesheet" href=".././resources/css/jslider.css">
		<link rel="stylesheet" href=".././resources/css/revslider/settings.css">
		<link rel="stylesheet" href=".././resources/css/jquery.fancybox.css">
		<link rel="stylesheet" href=".././resources/css/animate.css">
		<link rel="stylesheet" href=".././resources/css/video-js.min.css">
		<link rel="stylesheet" href=".././resources/css/morris.css">
		<link rel="stylesheet" href=".././resources/css/royalslider/royalslider.css">
		<link rel="stylesheet" href=".././resources/css/royalslider/skins/minimal-white/rs-minimal-white.css">
		<link rel="stylesheet" href=".././resources/css/layerslider/css/layerslider.css">
		<link rel="stylesheet" href=".././resources/css/ladda.min.css">
		<link rel="stylesheet" href=".././resources/css/datepicker.css">
		<link rel="stylesheet" href=".././resources/css/jquery.scrollbar.css">
		
		<!-- Theme CSS -->
		<link rel="stylesheet" href=".././resources/css/style.css">
		
		<!-- Custom CSS -->
		<link rel="stylesheet" href=".././resources/css/customizer/pages.css">
		<link rel="stylesheet" href=".././resources/css/customizer/home-pages-customizer.css">
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
	<div class="container">
	<div class="chat" id="chat">
	    <p>
	       <div id="ids"></div>
	    </p>
	    <hr/>
	</div>
	<br/>
	<!-- <div class="top-padding">
		<input class="form-control" id="textMessage" type="text" style="width: 300px" />
		<input type="button" class="btn" id="sendBtn" name="sendBtn" value="Send"/>
		<input type="button" class="btn" id="leaveBtn" name="leaveBtn" value="Leave"/>
	</div> -->
	<!-- <table>
	<tr>
		<td>
			<div class="top-padding center">
			<input class="form-control" id="textMessage" type="text" style="width: 300px" />
			</div>
		</td>
		<td>
			<input type="button" class="btn" id="sendBtn" name="sendBtn" value="Send"/><br>
		</td>
		<td>
			<input type="button" class="btn" id="leaveBtn" name="leaveBtn" value="Leave"/><br>
		</td>
	</tr>
	</table> -->
	<table>
	<tr>
		<td>
			<div class="top-padding center">
			<input class="form-control" id="textMessage" type="text" style="width: 300px" />
			</div>
		</td>
		<td>
			<div class="livicon block" data-n="rocket" data-s="48" data-op="0" data-c="#738d00" data-hc="0"></div>
		</td>
		<td>
			<div class="livicon block" data-n="rocket" data-s="48" data-op="0" data-c="#738d00" data-hc="0"></div>
		</td>
	</tr>
	</table>
	</div>
	<!-- 각종 Javascript -->
		
		<!--[if (!IE)|(gt IE 8)]><!-->
		<script src="./resources/js/jquery-2.1.3.min.js"></script>
		<!--<![endif]-->
		
		<!--[if lte IE 8]>
		<script src="js/jquery-1.9.1.min.js"></script>
		<![endif]-->
		<script src="./resources/js/bootstrap.min.js"></script>
		<script src="./resources/js/price-regulator/jshashtable-2.1_src.js"></script>
		<script src="./resources/js/price-regulator/jquery.numberformatter-1.2.3.js"></script>
		<script src="./resources/js/price-regulator/tmpl.js"></script>
		<script src="./resources/js/price-regulator/jquery.dependClass-0.1.js"></script>
		<script src="./resources/js/price-regulator/draggable-0.1.js"></script>
		<script src="./resources/js/price-regulator/jquery.slider.js"></script>
		<script src="./resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
		<script src="./resources/js/jquery.touchwipe.min.js"></script>
		<script src="./resources/js/jquery.elevateZoom-3.0.8.min.js"></script>
		<script src="./resources/js/jquery.imagesloaded.min.js"></script>
		<script src="./resources/js/jquery.appear.js"></script>
		<script src="./resources/js/jquery.sparkline.min.js"></script>
		<script src="./resources/js/jquery.easypiechart.min.js"></script>
		<script src="./resources/js/jquery.easing.1.3.js"></script>
		<script src="./resources/js/jquery.fancybox.pack.js"></script>
		<script src="./resources/js/isotope.pkgd.min.js"></script>
		<script src="./resources/js/jquery.knob.js"></script>
		<script src="./resources/js/jquery.selectBox.min.js"></script>
		<script src="./resources/js/jquery.royalslider.min.js"></script>
		<script src="./resources/js/jquery.tubular.1.0.js"></script>
		<script src="./resources/js/SmoothScroll.js"></script>
		<script src="./resources/js/country.js"></script>
		<script src="./resources/js/spin.min.js"></script>
		<script src="./resources/js/ladda.min.js"></script>
		<script src="./resources/js/masonry.pkgd.min.js"></script>
		<script src="./resources/js/morris.min.js"></script>
		<script src="./resources/js/raphael.min.js"></script>
		<script src="./resources/js/video.js"></script>
		<script src="./resources/js/pixastic.custom.js"></script>
		<script src="./resources/js/livicons-1.4.min.js"></script>
		<script src="./resources/js/layerslider/greensock.js"></script>
		<script src="./resources/js/layerslider/layerslider.transitions.js"></script>
		<script src="./resources/js/layerslider/layerslider.kreaturamedia.jquery.js"></script>
		<script src="./resources/js/revolution/jquery.themepunch.tools.min.js"></script>
		<script src="./resources/js/revolution/jquery.themepunch.revolution.min.js"></script>
		<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  
		(Load Extensions only on Local File Systems !
		The following part can be removed on Server for On Demand Loading) -->	
		<script src="./resources/js/revolution/extensions/revolution.extension.actions.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.carousel.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.kenburn.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.layeranimation.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.migration.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.navigation.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.parallax.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.slideanims.min.js"></script>
		<script src="./resources/js/revolution/extensions/revolution.extension.video.min.js"></script>
		<script src="./resources/js/bootstrapValidator.min.js"></script>
		<script src="./resources/js/bootstrap-datepicker.js"></script>
		<script src="./resources/js/jplayer/jquery.jplayer.min.js"></script>
		<script src="./resources/js/jplayer/jplayer.playlist.min.js"></script>
		<script src="./resources/js/jquery.scrollbar.min.js"></script>
		<script src="./resources/js/main.js"></script>
</body>
</html>
