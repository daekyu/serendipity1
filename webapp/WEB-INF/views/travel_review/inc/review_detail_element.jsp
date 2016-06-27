<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript"> 
	$(function() {
		$('#btn_like').hide();
		$('#btn_like2').hide();
		function isLike() {
			$.ajax({
				type : "post",
				url : "is_like.htm",
				data : {
					"user_num" : '${sessionScope.user_num}',
					"review_num" : '${param.review_num}'
				},
				
				success : function(data) {
					if(data>0) {
						$('#btn_like').hide();
						$('#btn_like2').show();
					} else {
						$('#btn_like2').hide();
						$('#btn_like').show();
					}
				}
			});
		}
		
		isLike();
		
		
		$('#btn_like').click(function() {
			$.ajax({
				type : "post",
				url : "review_like.htm",
				data : {"user_num" : <%=session.getAttribute("user_num")%>,
						"review_num" : <%= request.getParameter("review_num")%>		
				},
				success : function(data) {
					$('#likeCount').text(data);
					$('#btn_like').hide();
					$('#btn_like2').show();
					
					isLike();
				}
			});
		});
		
		$('#btn_like2').click(function() {
			$.ajax({
				type : "post",
				url : "delete_review_like.htm",
				data : {"user_num" : <%=session.getAttribute("user_num")%>,
						"review_num" : <%= request.getParameter("review_num")%>		
				},
				success : function(data) {
					$('#likeCount').text(data);
					$('#btn_like2').hide();
					$('#btn_like').show();
					isLike();
				}
			});
		});
	});
</script>

<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title"><spring:message code="board.review_detail"/></h1>
    </div>
  </header>
  <div class="container">
    <div class="row">
      <div class="content portfolio col-sm-12 col-md-12">
		<div class="slider progressive-slider page-slider load bottom-padding">
		  <div class="container">
			<div class="row">
			  <div class="sliders-box">
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					<c:choose>
						<c:when test="${review_detail.REVIEW_PICTURE1 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${review_detail.REVIEW_PICTURE1}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${review_detail.REVIEW_CONTENT1}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					 <c:choose>
						<c:when test="${review_detail.REVIEW_PICTURE2 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${review_detail.REVIEW_PICTURE2}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${review_detail.REVIEW_CONTENT2}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${review_detail.REVIEW_PICTURE3 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${review_detail.REVIEW_PICTURE3}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${review_detail.REVIEW_CONTENT3}</p>
					</div>
				  </div>
				</div>
		
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${review_detail.REVIEW_PICTURE4 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${review_detail.REVIEW_PICTURE4}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${review_detail.REVIEW_CONTENT4}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${review_detail.REVIEW_PICTURE5 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${review_detail.REVIEW_PICTURE5}" width="620" height="550" alt="">
						</c:otherwise>
					  </c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${review_detail.REVIEW_CONTENT5}</p>
					</div>
				  </div>
				</div>
			  </div><!-- .sliders-box -->
		
			  <div class="slider-nav col-sm-4 col-md-4">
				<div class="nav-box">
				  <a class="next" href="#">
					<svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
					  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#838383" points="1,0.001 0,1.001 7,8 0,14.999 1,15.999 9,8 "></polygon>
					</svg>
				  </a>
				  <a class="prev" href="#">
					<svg x="0" y="0" width="9px" height="16px" viewBox="0 0 9 16" enable-background="new 0 0 9 16" xml:space="preserve">
					  <polygon fill-rule="evenodd" clip-rule="evenodd" fill="#838383" points="8,15.999 9,14.999 2,8 9,1.001 8,0.001 0,8 "></polygon>
					</svg>
				  </a>
				  <div class="pagination switches"></div>	
				</div>
			  </div>
			</div>
		  </div>
		</div><!-- .progressive-slider -->
		  
		<div class="row">
		  <div class="portfolio-tags bottom-padding col-sm-4 col-md-4">
			<p><b><spring:message code="board.review_detail2"/></b><span>${review_detail.LOCAL_NAME}</span></p>
			<p><b><spring:message code="board.review_detail3"/></b><span>${review_detail.REVIEW_DATE}</span></p><br>
			<h4><span id="likeCount">${count}</span> Like(s)</h4>
			
			<div class="icon circle bg icon-40"data-s="48" data-op="0" data-c="#c10841" data-hc="0" id="btn_like"><i class="fa fa-heart-o"></i></div><div class="icon circle bg icon-40"data-s="48" data-op="0" data-c="#c10841" data-hc="0" id="btn_like2"><i class="fa fa-heart"></i></div><br><br>
			<c:choose>
				<c:when test="${sessionScope.user_num == review_detail.USER_NUM}">
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/travel_review/review_updateform.htm?review_num=${review_detail.REVIEW_NUM}"><i class="livicon shadowed" data-s="24" data-n="pen" data-c="white" data-hc="0"></i> <spring:message code="board.review_detail4"/></a>
					<a class="btn btn-danger btn-sm" id="delete" href="${pageContext.request.contextPath}/travel_review/review_delete.htm?review_num=${review_detail.REVIEW_NUM}"><i class="livicon shadowed" data-s="24" data-n="trash" data-c="white" data-hc="0"></i> <spring:message code="board.review_detail5"/></a>
				</c:when>
			</c:choose>
		  </div>
		  
		  <div class="bottom-padding col-sm-8 col-md-8">
			<p>전체적인 설명 : ${review_detail.REVIEW_CONTENT}</p>
		  </div>
		</div>
		  
		<div class="clearfix"></div>
		  
		<div class="product-tab">
		  <ul class="nav nav-tabs">
			<li><a href="#reviews"><spring:message code="board.review_detail6"/></a></li>
		  </ul><!-- .nav-tabs -->	
		  <div class="tab-content">
			<div class="tab-pane active" id="reviews">
		<ul class="commentlist bottom-padding">
		<li></li>
		  <c:forEach var="i" items="${reply_list}">
		  <li class="">
		  	<div class="row">
				 <c:choose>
					<c:when test="${i.PROFILE_PICTURE == null}">
						<img class="image avatar img-circle replace-2x animated rotateIn" width="84" height="84" src=".././resources/img/avatar.PNG" alt="">
					</c:when>
					<c:otherwise>
						<img class="image avatar img-circle replace-2x animated rotateIn" width="84" height="84" src="${pageContext.request.contextPath}/resources/img/profile_picture/${i.PROFILE_PICTURE}" alt="">
					</c:otherwise>
				 </c:choose>
			<div class="meta">
			  <span><b>${i.ID}</b></span>, 
			  <span class="time"><b>${i.REPLY_DATE}</b>
			  	<c:choose>
				<c:when test="${sessionScope.user_num == i.USER_NUM}">
			  		<a href="reply_delete.htm?reply_num=${i.REPLY_NUM}&review_num=${review_detail.REVIEW_NUM}"><spring:message code="board.review_detail7"/></a>
			  	</c:when>
			  </c:choose>
			  </span>
			</div>
			  ${i.REPLY_CONTENT}
			<div class="meta">&nbsp;&nbsp;&nbsp;</div>
			<div class="meta">&nbsp;&nbsp;&nbsp;</div>
			</div>
			
		  </li>
		  </c:forEach>
		</ul>
			  
			  <form class="comments-form" action="review_detail.htm?user_num=${sessionScope.user_num}&review_num=${review_detail.REVIEW_NUM}" method="post">
				<div class="row">
				  <div class="row">
					<label><spring:message code="board.review_detail8"/> <span class="required">*</span></label>
					<input type="text" class="form-control" name="reply_content" style="width:85%">  <input type="submit" class="btn btn-default" value="<spring:message code="board.review_detail9"/>">
					<i>Note: HTML is not translated!</i>
				  </div>
				  <div class="col-sm-12 col-md-12">
				  	
				  </div>
				</div>
			  </form><!-- .comments-form -->
			</div><!-- #reviews -->
		  </div><!-- .tab-content -->
		</div>
      </div><!-- .content -->
    </div>
  </div><!-- .container -->
</section><!-- #main -->