<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="keywords" content="HTML5 Template">
		<meta name="description" content="Progressive — Responsive Multipurpose HTML Template">
		<meta name="author" content="itembridge.com">
		<meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Serendipity :: 쪽지</title>
		
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
		
		<!-- IE Styles-->
		<!-- <link rel='stylesheet' href="../css/ie/ie.css"> -->
		
		<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
		<script type="text/javascript">
			function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
			};
      
			$(function() {
				$('#receiver').keyup(function() {
					$.ajax({
						type : "post",
						url : getContextPath() + "/message/getMemberList.htm",
						data : {"id": $('#receiver').val()},
						success : function(data) {
							var printdata = "";
							
							$('#div_view').empty();
                     
							$.each(data, function(index, item) {
								printdata += "<li><span id='list" + index + "' onclick='inputReceiver(" + index + ")'>" + item.id + "</span></li>";
							});
                     
							if($('#receiver').val() ==""){
								$('#div_view').empty();
							} else {
								$('#div_view').append("<ul>" + printdata + "</ul>");
							}
                     
							$('#receiver').focusout(function() {
								$.ajax({
									type : "post",
									url : getContextPath() + "/message/getReceiverNum.htm",
									data : {"id" : $('#receiver').val()},
									success : function(data) {
										if(data == ""){
										} else {
										$('#receiver_num').val(data.user_num);
										}
									}
								});
							});
                 		}
					});
				});
			});
      
			function inputReceiver(index) {
				$('#receiver').val($('#list' + index).text());
				$('#div_view').empty();
				$.ajax({
					type : "post",
					url : getContextPath() + "/message/getReceiverNum.htm",
					data : {"id" : $('#receiver').val()},
					success : function(data) {
						$('#receiver_num').val(data.user_num);
					}
				});
			}
      
			function getRcvMessageDetail(message_num) {
				$.ajax({
					type : "post",
					url : getContextPath() + "/message/getRcvMessageDetail.htm",
					data : {
						"message_num" : message_num
					},
					success : function(data) {
						$('#myModalLabel').text(data.message_title);
						$('#myModalBody').text(data.message_content);
					}
				});
			}
      
			function getSendMessageDetail(message_num) {
				$.ajax({
					type : "post",
					url : getContextPath() + "/message/getSendMessageDetail.htm",
					data : {
						"message_num" : message_num
					},
					success : function(data) {
						$('#myModalLabel').text(data.message_title);
						$('#myModalBody').text(data.message_content);
					}
				});
			}
		</script>
	</head>
   
   
	<body>
		<div class="product-tab">
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#msg_receive"><spring:message code="message.message.in"/></a>
				</li>
				<li>
					<a href="#msg_write"><spring:message code="message.message.in1"/></a>
				</li>
				<li>
					<a href="#msg_send"><spring:message code="message.message.in2"/></a>
				</li>
			</ul><!-- .nav-tabs -->   
	
			<div class="tab-content">
			<!-- 받은 쪽지함 시작 -->
				<div class="tab-pane active" id="msg_receive">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th><spring:message code="message.message.in3"/></th>
								<th><spring:message code="message.message.in4"/></th>
								<th><spring:message code="message.message.in5"/></th>
								<th><spring:message code="message.message.in6"/></th>
							</tr>
						</thead>
	      
						<tbody>
							<c:forEach var="i" items="${rcv_message_list}">
								<tr>
							   		<td>${i.SENDER}</td>
									<td>
										<a onclick="getRcvMessageDetail(${i.MESSAGE_NUM})" data-toggle="modal" data-target="#msg_content">${i.MESSAGE_TITLE}</a>
									</td>
									<td>${i.MESSAGE_DATE}</td>
									<td>
										<a class="btn btn-danger" href="${pageContext.request.contextPath}/message/deleteReceiveMessage.htm?message_num=${i.MESSAGE_NUM}"><spring:message code="message.message.in8"/></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- 받은 쪽지함 끝-->
	
				<!-- 쪽지보내기 시작 -->
				<div class="tab-pane" id="msg_write">
					<form action="sendMessage.htm" method="post">
						<table class="table table-responsive">
							<tr>
								<th><spring:message code="message.message.send"/></th>
								<td>
					   				<input type="text" class="form-control" id="receiver">
					   				<div>
					   					<p id="div_view" style="background-color: white"></p>
					   				</div>
									<input type="hidden" id="receiver_num" name="receiver">
									<input type="hidden" name="sender" value="${sessionScope.user_num}">
				  				</td>
							</tr>
							<tr>
								<th><spring:message code="message.message.send1"/> </th>
								<td><input type="text" class="form-control" name="message_title"></td>
							</tr>
							<tr>
								<th><spring:message code="message.message.send2"/> </th>
								<td><textarea class="form-control" style="resize:none; height:200px;" wrap="soft" name="message_content"></textarea></td>
							</tr>
							<tr>
				   				<td colspan="2">
				   					<input type="submit" class="btn btn-danger" value=" <spring:message code="message.message.send3"/> ">
				   				</td>
							</tr>
						</table>
					</form>
				</div><!-- 쪽지보내기 -->
	
				<div class="tab-pane" id="msg_send">
					<table class="table table-responsive">
						<thead>
							<tr>
								<th><spring:message code="message.message.send_le"/></th>
								<th><spring:message code="message.message.send_le1"/></th>
								<th><spring:message code="message.message.send_le2"/></th>
								<th><spring:message code="message.message.send_le3"/></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${message_list}">
								<tr>
									<td>${i.RECEIVER}</td>
									<td>
										<a onclick="getSendMessageDetail(${i.MESSAGE_NUM})" data-toggle="modal" data-target="#msg_content">${i.MESSAGE_TITLE}</a>
									</td>
									<td>${i.MESSAGE_DATE}</td>
									<td>
										<a class="btn btn-danger" href="${pageContext.request.contextPath}/message/deleteSendMessage.htm?message_num=${i.MESSAGE_NUM}"><spring:message code="message.message.send_le5"/></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- 보낸 쪽지함 -->
			</div><!-- .tab-content -->
		</div>
	
		<!-- Modal -->
		<div class="modal fade" id="msg_content" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<p class="modal-title" id="myModalLabel"></p>
					</div>
		      		<div class="modal-body" id="myModalBody"></div>
		      		<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="message.message.get"/></button>
		      		</div>
		    	</div>
		  	</div>
		</div>
	
	
	
		<!-- 각종 Javascript -->
		
		<!--[if (!IE)|(gt IE 8)]><!-->
		<script src=".././resources/js/jquery-2.1.3.min.js"></script>
		<!--<![endif]-->
		
		<!--[if lte IE 8]>
		<script src="js/jquery-1.9.1.min.js"></script>
		<![endif]-->
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