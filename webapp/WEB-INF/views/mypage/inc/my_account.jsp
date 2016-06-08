<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="breadcrumb-box breadcrumb-none"></div>
<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">마이페이지</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account">
		  <div class="bottom-padding">
		  	<div class="row">
			<div class="images-box col-xs-9 col-sm-6 col-md-4">
			  <div class="carousel-box load" data-carousel-pagination="true" data-carousel-nav="false" data-carousel-one="true" data-autoplay-disable="true">
				  <div class="carousel">
					<div class="image">
					  <img class="replace-2x" src="content/img/team-big-1.jpg" alt="" title="" width="768" height="768">
					</div>
				  </div>
				<div class="clearfix"></div>
				<div class="pagination switches"></div>
			  </div>
			</div>
		  
			<div class="employee-description col-sm-8 col-md-8">
			  <h3 class="name">Mett Rayan</h3>
			  <div class="role"></div>
			  <div>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vitae corporis porro ad deleniti odio pariatur fugit dignissimos vero architecto placeat nemo cum ipsum molestiae quae eos et omnis sed magni.</p>
			  </div>
			  <div class="social">
<!-- 				<a class="icon rounded icon-facebook" href="#"><i class="fa fa-facebook"></i></a>
				<a class="icon rounded icon-twitter" href="#"><i class="fa fa-twitter"></i></a>
				<a class="icon rounded icon-google" href="#"><i class="fa fa-google"></i></a>
				<a class="icon rounded icon-linkedin" href="#"><i class="fa fa-linkedin"></i></a> -->
			  </div>
			</div>
			<div class="clearfix"></div>
		  </div>
			<br><br>
			<div class="table-responsive">
			<table class="table table-bordered">
			
				<tr>
					<th class="danger" colspan="2">Information</th>
				</tr>
				<tr>
					<th class="danger">이름</th>
					<td>강대규</td>
				</tr>
				
				<tr>
					<th class="danger">지역</th>
					<td>경기</td>
				</tr>
				
				<tr>
					<th class="danger">언어</th>
					<td>한국어, 영어, 일본어, 독일어, 프랑스어, 스페인어</td>
				</tr>
				
				<tr>
					<th class="danger">취미</th>
					<td>롤, 리그오브레전드, 엘오엘</td>
				</tr>
				
				<tr>
					<th class="danger">관심사</th>
					<td>술, 음식</td>
				</tr>
			</table>
			</div>
		  </div>
		
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->