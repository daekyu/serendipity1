<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div class="col-sm-12 col-md-12">
					  <img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content1}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content2}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content3}</p>
					</div>
				  </div>
				</div>
		
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
					</div>
					<div class="slid-content col-sm-4 col-md-4">
					  <p class="descriptions">${reviewdetail.review_content4}</p>
					</div>
				  </div>
				</div>
				
				<div class="col-sm-12 col-md-12">
				  <div class="slid row">
					<div class="col-sm-12 col-md-12">
					  <img class="replace-2x slid-img" src="content/img/slide-4.jpg" width="620" height="550" alt="">
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
			<h4><span>${reviewdetail.like_count} Like(s)</span></h4>
			<button type="button" class="btn btn-border btn-danger"><i class="fa fa-heart"></i>${reviewdetail.like_count} Like</button>
		  </div>
		  
		  <div class="bottom-padding col-sm-8 col-md-8">
			<p>${reviewdetail.review_content}</p>
		  </div>
		</div>
		  
		<div class="clearfix"></div>
		  
		<div class="product-tab">
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
			  ${i.reply_content}
			</p>
		  </li>
		  </c:forEach>
		</ul>
			  <form class="comments-form" action="" method="post">
				<div class="row">
				  <div class="col-sm-7 col-md-7">
					<label>댓글: <span class="required">*</span></label>
					<input type="text" class="form-control" name="reply_content"></input>
					<i>Note: HTML is not translated!</i>
				  </div>
				  <div class="col-sm-12 col-md-12">
					<button class="btn btn-default">Submit</button>
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