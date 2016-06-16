<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 
	@filename : notificationCheck.js
	@Date : 16.06.15
	@Author : 강대규
	@Desc : 여러 알림을 처리하기 위한 JS코드
  -->
<script type="text/javascript">

//root ContextPath
function getContextPath() {
   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};

$(function() {
	setInterval(function() {
		if('${sessionScope.user_num}' != ''){
			// 쪽지기능 알림
			$.ajax({
		        type : "post",
		        url : getContextPath() + "/message/msgNotificationCheck.htm",
		        data: {"receiver" : "${sessionScope.user_num}"},
		        success : function(data) {
		        	if(data != ''){
		        		for(var i=0; i<data.length; i++){
						    var notification = new Notification(data[i].sender + "님이 쪽지보냄");
						    $.ajax({
		        				type : "post",
		        				url : getContextPath() + "/message/changeMsgNotificationState.htm",
		        				data : {"receiver" : "${sessionScope.user_num}", "message_num" : data[i].message_num},
		        				success : function() {
		        					
		        				}
		        			});
		        		}
		        	}
		        }
	
		     });
		     
			//댓글알림
			$.ajax({
				type : "post",
				url : getContextPath() + "/travel_review/replyNotificationCheck.htm",
				data: {"user_num" : "${sessionScope.user_num}"},
				success : function(data) {
					if(data != ''){
						for(var i=0; i<data.length; i++){
							var notification = new Notification(data[i].USER_NUM + "님이 댓글달았음");
							$.ajax({
								type : "post",
								url : getContextPath() + "/travel_review/changeReplyState.htm",
								data : {"reply_num" : data[i].REPLY_NUM},
								success : function() {
								}
							});
						}
					}
				}
		     });
		     
		     // 가이드-여행자 요청 알림
	//		$.ajax({
				
	//		});
		}
	}, 5000);
});




</script>