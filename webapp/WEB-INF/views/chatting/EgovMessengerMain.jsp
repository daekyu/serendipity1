<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Serendipity :: 채팅</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				var popOptions = "width= 400, height= 580, resizable=yes, status= no, scrollbar= yes"; 
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
				$("#ids").empty();
				for (var i=0; i<userList.length; i++) {
					if("${id}"==userList[i]) {
						id = userList[i]+"(me!)";
					} else {
						id = userList[i];
					}
					
					$.newTr = $("<tr><td id='"+userList[i]+"' onclick='tdClick(this)'>"+ id +"</td></tr>");
					$("#ids").last().append($.newTr);
				}
			} // 아이콘 색바꾸기
			
			//다른 사용자 선택 시, 선택한 사용자 값을 서버에 전달
			function tdClick(selectedTd) {
				if (selectedTd.id != null) {
						connectionType = "chatConnection";
						webSocket.send(JSON.stringify({ "connectionType" : connectionType, "connectingUser" : selectedTd.id }));
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
			}
		
			window.onbeforeunload = function() {
				webSocket.close();
			};
		</script>
		<!-- Favicon -->
		<link rel="shortcut icon" href=".././resources/img/main_ico.png">
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
		
		<style type="text/css">
		.dk-box2 {
			margin-top: 10px;
			margin-bottom: 10px;
			margin-left: 10px;
			margin-right: 10px;
			width: 400px;
			height: 280px;
		}
		
		.dk-box img {
			display: block;
			margin: 0 auto;
		}
		</style>
	</head>
	
	
	<body>
		<div class="dk-box2" align="center">
			<img src=".././resources/img/main_logo.png">
			<div class="dk-font title-box text-center">
				Serendipity Messenger<br>
				<br>
			</div>
			<form name="usersForm">
				<input type="hidden" id="roomId" name="roomId" /> 
				<input type="hidden" id="id" name="id" />
				<table class="table" align="center" id="ids" name="ids" border="0">
					<tr>
						<th>Web Messenger Users</th>
					</tr>
					<tr>
						<td>There is no one to chat</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- 각종 Javascript -->
		<script src=".././resources/js/jquery-2.1.3.min.js"></script>
		<script src=".././resources/js/bootstrap.min.js"></script>
		<script src=".././resources/js/price-regulator/jshashtable-2.1_src.js"></script>
		<script src=".././resources/js/price-regulator/jquery.numberformatter-1.2.3.js"></script>
		<script src=".././resources/js/price-regulator/tmpl.js"></script>
		<script src=".././resources/js/price-regulator/jquery.dependClass-0.1.js"></script>
		<script src=".././resources/js/price-regulator/draggable-0.1.js"></script>
		<script src=".././resources/js/price-regulator/jquery.slider.js"></script>
		<script src=".././resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
		<script src=".././resources/js/jquery.touchwipe.min.js"></script>
		<script src=".././resources/js/jquery.elevateZoom-3.0.8.min.js"></script>
		<script src=".././resources/js/jquery.imagesloaded.min.js"></script>
		<script src=".././resources/js/jquery.appear.js"></script>
		<script src=".././resources/js/jquery.sparkline.min.js"></script>
		<script src=".././resources/js/jquery.easypiechart.min.js"></script>
		<script src=".././resources/js/jquery.easing.1.3.js"></script>
		<script src=".././resources/js/jquery.fancybox.pack.js"></script>
		<script src=".././resources/js/isotope.pkgd.min.js"></script>
		<script src=".././resources/js/jquery.knob.js"></script>
		<script src=".././resources/js/jquery.selectBox.min.js"></script>
		<script src=".././resources/js/jquery.royalslider.min.js"></script>
		<script src=".././resources/js/jquery.tubular.1.0.js"></script>
		<script src=".././resources/js/SmoothScroll.js"></script>
		<script src=".././resources/js/country.js"></script>
		<script src=".././resources/js/spin.min.js"></script>
		<script src=".././resources/js/ladda.min.js"></script>
		<script src=".././resources/js/masonry.pkgd.min.js"></script>
		<script src=".././resources/js/morris.min.js"></script>
		<script src=".././resources/js/raphael.min.js"></script>
		<script src=".././resources/js/video.js"></script>
		<script src=".././resources/js/pixastic.custom.js"></script>
		<script src=".././resources/js/livicons-1.4.min.js"></script>
		<script src=".././resources/js/layerslider/greensock.js"></script>
		<script src=".././resources/js/layerslider/layerslider.transitions.js"></script>
		<script src=".././resources/js/layerslider/layerslider.kreaturamedia.jquery.js"></script>
		<script src=".././resources/js/revolution/jquery.themepunch.tools.min.js"></script>
		<script src=".././resources/js/revolution/jquery.themepunch.revolution.min.js"></script>
		<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  
			(Load Extensions only on Local File Systems !
			The following part can be removed on Server for On Demand Loading) -->
		<script src=".././resources/js/revolution/extensions/revolution.extension.actions.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.carousel.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.kenburn.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.layeranimation.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.migration.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.navigation.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.parallax.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.slideanims.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.video.min.js"></script>
		<script src=".././resources/js/bootstrapValidator.min.js"></script>
		<script src=".././resources/js/bootstrap-datepicker.js"></script>
		<script src=".././resources/js/jplayer/jquery.jplayer.min.js"></script>
		<script src=".././resources/js/jplayer/jplayer.playlist.min.js"></script>
		<script src=".././resources/js/jquery.scrollbar.min.js"></script>
		<script src=".././resources/js/main.js"></script>
	</body>
</html>
