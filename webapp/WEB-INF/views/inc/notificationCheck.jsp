<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 
	@filename : notificationCheck.js
	@Date : 16.06.15
	@Author : 강대규
	@Desc : 여러 알림을 처리하기 위한 JS코드
  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//root ContextPath
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host) + location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	};

	$(function() {
		setInterval(function() {
			if ('${sessionScope.user_num}' != '') {
				// 쪽지기능 알림
				$.ajax({
					type : "post",
					url : getContextPath()
							+ "/message/msgNotificationCheck.htm",
					data : {
						"receiver" : "${sessionScope.user_num}"
					},
					success : function(data) {
						if (data != '') {
							for (var i = 0; i < data.length; i++) {
								var options = {
									body : data[i].ID + "님이 쪽지를 보냈습니다.",
									icon : getContextPath() + "/resources/img/profile_picture/" + data[i].PROFILE_PICTURE
								}
								
								Notification.requestPermission(function(permission) {
									// Whatever the user answers, we make sure Chrome store the information
									if (!('permission' in Notification)) {
										Notification.permission = permission;
									}
		
									// If the user is okay, let's create a notification
									if (permission === "granted") {
										var notification = new Notification("Serendipity", options);
									}
								});
		
								$.ajax({
									type : "post",
									url : getContextPath()
											+ "/message/changeMsgNotificationState.htm",
									data : {
										"receiver" : "${sessionScope.user_num}",
										"message_num" : data[i].MESSAGE_NUM
									},
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
					data : {
						"user_num" : "${sessionScope.user_num}"
					},
					success : function(data) {
						if (data != '') {
							for (var i = 0; i < data.length; i++) {
								var options = {
									body : data[i].ID + "님이 댓글을 달았습니다.",
									icon : getContextPath() + "/resources/img/profile_picture/" + data[i].PROFILE_PICTURE
								}
								Notification.requestPermission(function(permission) {
									// Whatever the user answers, we make sure Chrome store the information
									if (!('permission' in Notification)) {
										Notification.permission = permission;
									}

									// If the user is okay, let's create a notification
									if (permission === "granted") {
										var notification = new Notification("Serendipity", options);
									}
								});
								
								$.ajax({
									type : "post",
									url : getContextPath() + "/travel_review/changeReplyState.htm",
									data : {
										"reply_num" : data[i].REPLY_NUM
									},
									success : function() {
									}
								});
							}
						}
					}
				});
		
				//좋아요 알림
				$.ajax({
					type : "post",
					url : getContextPath()
							+ "/travel_review/likeNotificationCheck.htm",
					data : {
						"user_num" : "${sessionScope.user_num}"
					},
					success : function(data) {
						if (data != '') {
							for (var i = 0; i < data.length; i++) {
								var options = {
									body : data[i].ID + "님이 회원님의 " + data[i].REVIEW_NUM + "번 게시물을 좋아합니다.",
									icon : getContextPath() + "/resources/img/profile_picture/" + data[i].PROFILE_PICTURE
								}
								Notification.requestPermission(function(permission) {
									// Whatever the user answers, we make sure Chrome store the information
									if (!('permission' in Notification)) {
										Notification.permission = permission;
									}

									// If the user is okay, let's create a notification
									if (permission === "granted") {
										var notification = new Notification(
												"Serendipity",
												options);
									}
								});
								
								$.ajax({
									type : "post",
									url : getContextPath()
											+ "/travel_review/changeLikeState.htm",
									data : {
										"review_num" : data[i].REVIEW_NUM,
										"user_num" : data[i].USER_NUM
									},
									success : function() {
									}
								});
							}
						}
					}
				});
			}
		}, 5000);
	});
</script>