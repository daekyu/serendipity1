<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<meta charset="UTF-8">
		<title>Insert title here</title>
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

	    <fieldset class="">
			<table class="table">
				<thead>
					<tr>
						<td colspan="2">
							사진 사진 사진 사진 사진
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
							<div class="form-group">
								<textarea class="form-control" id="messageWindow" style="resize:none; height:220px;" wrap="soft" contenteditable="false" ></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<input class="form-control" id="inputMessage" type="text"/>
						</td>
						
						<td>
							<input class="btn btn-danger" type="submit" value="send" onclick="send()" />
						</td>
					</tr>
				</tbody>
			</table>
	    </fieldset>

    <script type="text/javascript">
       
					var textarea = document.getElementById("messageWindow");
					var webSocket = new WebSocket(
							'ws://192.168.0.129:8090/serendipity/broadcasting?user_num=<%=session.getAttribute("user_num")%>'); //IP를 어떻게 얻어오지?
					var inputMessage = document.getElementById('inputMessage');
					webSocket.onerror = function(event) {
						onError(event)
					};
					webSocket.onopen = function(event) {
						onOpen(event)
					};
					webSocket.onmessage = function(event) {
						onMessage(event)
					};
					function onMessage(event) {
						textarea.value += "상대 : " + event.data + "\n";
					}
					function onOpen(event) {
						textarea.value += "연결 성공\n";
					}
					function onError(event) {
						alert(event.data);
					}
					function send() {
						textarea.value += "나 : " + inputMessage.value + "\n";
						webSocket.send(inputMessage.value);
						inputMessage.value = "";
					}
				</script>