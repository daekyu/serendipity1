<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					"user_num" : <%=session.getAttribute("user_num")%>,
					"review_num" : <%= request.getParameter("review_num")%>
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
					
					console.log("user_num1 : "+data);
					$('#likeCount').text(data);
					$('#btn_like2').text(data+" Likeㅎㅎ");
					
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
					
					console.log("user_num2 : "+data);
					$('#likeCount').text(data);
					$('#btn_like').text(data+" Like");
					isLike();
				}
			});
		});
	});
</script>

<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title">여행기 상세보기</h1>
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
				  	<%-- <p>${reveiwdetail.review_picture1}</p> --%>
					<div class="col-sm-12 col-md-12">
					<c:choose>
						<c:when test="${reviewdetail.review_picture1 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${reviewdetail.review_picture1}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content1}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					 <c:choose>
						<c:when test="${reviewdetail.review_picture2 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${reviewdetail.review_picture2}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content2}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${reviewdetail.review_picture3 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${reviewdetail.review_picture3}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content3}</p>
					</div>
				  </div>
				</div>
		
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${reviewdetail.review_picture4 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${reviewdetail.review_picture4}" width="620" height="550" alt="">
						</c:otherwise>
					</c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content4}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <c:choose>
						<c:when test="${reviewdetail.review_picture5 eq '사진없음'}">
							<img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
						</c:when>
						<c:otherwise>
							<img class="replace-2x slid-img" src="${pageContext.request.contextPath}/resources/img/review_upload/${reviewdetail.review_picture5}" width="620" height="550" alt="">
						</c:otherwise>
					  </c:choose>
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content5}</p>
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
			<p><b>여행테마: </b><span>자연경관, 야경, 맛집....</span></p>
			<p><b>지역: </b><span>${reviewdetail.local_code}</span></p>
			<p><b>Date: </b><span>${reviewdetail.review_date}</span></p><br>
			<h4><span id="likeCount">${count}</span> Like(s)</h4>
			
			<button type="button" class="btn btn-danger" id="btn_like2"><i class="fa fa-heart"></i> ${count} Like</button><button type="button" class="btn btn-primary" id="btn_like"><i class="fa fa-heart"></i> ${count} Like</button><br><br>
			
			<c:choose>
				<c:when test="${sessionScope.user_num == reviewdetail.user_num}">
					<a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/travel_review/review_updateform.htm?review_num=${reviewdetail.review_num}"><i class="livicon shadowed" data-s="24" data-n="pen" data-c="white" data-hc="0"></i> Modify</a>
					<a class="btn btn-danger btn-sm" id="delete" href="${pageContext.request.contextPath}/travel_review/review_delete.htm?review_num=${reviewdetail.review_num}"><i class="livicon shadowed" data-s="24" data-n="trash" data-c="white" data-hc="0"></i> Delete</a>
				</c:when>
			</c:choose>
		  </div>
		  
		  <div class="bottom-padding col-sm-8 col-md-8">
			<p>${reviewdetail.review_content}</p>
		  </div>
		</div>
		  
		<div class="clearfix"></div>
		  
		<div class="product-tab">
		  <!-- <form class="comments-form" action="reply_delete.htm?" method="post"> -->
		  <ul class="nav nav-tabs">
			<li><a href="#reviews">댓글</a></li>
		  </ul><!-- .nav-tabs -->	
		  <div class="tab-content">
			<div class="tab-pane active" id="reviews">
			  <h3 class="title slim">Comments</h3>
		<ul class="commentlist">
		<c:forEach var="i" items="${replylist}">
		  <li>
			<img class="replace-2x avatar" width="84" height="84" src="content/img/avatar-1.jpg" alt="">
			<div class="meta">
			  <span>${i.user_num}</span>, 
			  <span class="time">${i.reply_date}</span>
			</div>
			<p class="description">
			  ${i.reply_content}&nbsp;&nbsp;&nbsp;
			  <c:choose>
				<c:when test="${sessionScope.user_num == i.user_num}">
			  		<a href="reply_delete.htm?reply_num=${i.reply_num}&review_num=${reviewdetail.review_num}">삭제</a>
			  	</c:when>
			  </c:choose>
			</p>
		  </li>
		  </c:forEach>
		</ul>
		<!-- </form> -->
			  <form class="comments-form" action="review_detail.htm?user_num=${sessionScope.user_num}&review_num=${reviewdetail.review_num}" method="post">
				<div class="row">
				  <div class="col-sm-7 col-md-7">
					<label>댓글: <span class="required">*</span></label>
					<input type="text" class="form-control" name="reply_content"></input>
					<i>Note: HTML is not translated!</i>
				  </div>
				  <div class="col-sm-12 col-md-12">
				  	<input type="submit" class="btn btn-default" value="submit">
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