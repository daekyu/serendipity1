<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title">여행기를 올립시당~~~</h1>
    </div>	
  </header>
  
  <div class="container">
    <div class="row">
      <div id="catalog" class="content col-sm-12 col-md-12">
		<div class="category-img">
		  <img class="replace-2x" src="content/img/category-img.jpg" width="870" height="370" alt="">
		  <div class="description">Automation &amp; Integration technology to fit any lifestyle</div>
		</div>
	
		<div class="toolbar clearfix">
		  <div class="grid-list">
			<a href="shop-catalog-grid.html" class="grid">
			  <span class="glyphicon glyphicon-th-large"></span>
			</a>
			<span class="grid">
			  <span class="glyphicon glyphicon-th-list"></span>
			</span>
		  </div>
		  
		  <!-- 정렬기준을 바꾸는곳. 정해지면 바꾸자. -->
		  <div class="sort-catalog">
			<div class="btn-group sort-by btn-select">
			  <a class="btn dropdown-toggle btn-default" role="button" data-toggle="dropdown" href="#">Sort by: <span>Rating</span> <span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<li><a href="#">Price</a></li>
				<li><a href="#">Rating</a></li>
				<li><a href="#">Name</a></li>
			  </ul>
			</div><!-- .sort-by -->
			<button type="button" class="btn up-down btn-default" data-toggle="button"><span></span></button>
		  </div><!-- .sort-catalog -->
		  
		  <div class="sort-catalog">
			<div class="btn-group show-by btn-select">
			  <a class="btn dropdown-toggle btn-default" role="button" data-toggle="dropdown" href="#">Show: <span>12</span> <span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">11</a></li>
				<li><a href="#">12</a></li>
			  </ul>
			</div><!-- .show -->
			<span class="per-page">per page</span>
		  </div><!-- .sort-catalog -->
		  
		  <div class="price-regulator pull-right">
			<b>Price:</b>
			<div class="layout-slider">
			  <input id="Slider2" type="slider" name="price" value="20000;120000" class="form-control">
			</div>
		  </div><!-- .price-regulator -->
		</div>
		<!-- 정렬기준 끝 -->
		
		<div class="clearfix"></div>
		
		<div class="products list row">
		  <div class="product">
			<div class="col-sm-4 col-md-4">
			  <a href="shop-product-view.html" class="product-image">
				<!-- <span class="sale"></span> -->
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			</div>
			<div class="col-sm-8 col-md-8">
			  <h3 class="price">
				<a href="#">ABCD</a>
			  </h3>
			  <div class="excerpt">
				<span>이름: 조인성</span><br>
				<span>장소: 발리</span><br>
			  	<span>작성일 : 16.06.01</span>
			  </div>
			  <div class="excerpt">
				<a href="#">간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 </a>
			  </div>
			  <div class="price-box">
				<a href="#" class="add-review"><span class="excerpt">5 Like(s)</span></a>
			  </div>	
			  <div class="actions">
			  	<!-- 좋아요버튼 -->
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<!-- 좋아요버튼 끝 -->
			  </div><!-- .actions -->
			</div>
		  </div><!-- .product -->
		  
		  <div class="product">
			<div class="col-sm-4 col-md-4">
			  <a href="shop-product-view.html" class="product-image">
				<!-- <span class="sale"></span> -->
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			</div>
			<div class="col-sm-8 col-md-8">
			  <h3 class="price">
				<a href="#">ABCD</a>
			  </h3>
			  <div class="excerpt">
				<span>이름: 조인성</span><br>
				<span>장소: 발리</span><br>
			  	<span>작성일 : 16.06.01</span>
			  </div>
			  <div class="excerpt">
				<a href="#">간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 </a>
			  </div>
			  <div class="price-box">
				<a href="#" class="add-review"><span class="excerpt">5 Like(s)</span></a>
			  </div>	
			  <div class="actions">
			  	<!-- 좋아요버튼 -->
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<!-- 좋아요버튼 끝 -->
			  </div><!-- .actions -->
			</div>
		  </div><!-- .product -->
		  
		  <div class="product">
			<div class="col-sm-4 col-md-4">
			  <a href="shop-product-view.html" class="product-image">
				<!-- <span class="sale"></span> -->
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			</div>
			<div class="col-sm-8 col-md-8">
			  <h3 class="price">
				<a href="#">ABCD</a>
			  </h3>
			  <div class="excerpt">
				<span>이름: 조인성</span><br>
				<span>장소: 발리</span><br>
			  	<span>작성일 : 16.06.01</span>
			  </div>
			  <div class="excerpt">
				<a href="#">간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 간단한 설명 </a>
			  </div>
			  <div class="price-box">
				<a href="#" class="add-review"><span class="excerpt">5 Like(s)</span></a>
			  </div>	
			  <div class="actions">
			  	<!-- 좋아요버튼 -->
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<!-- 좋아요버튼 끝 -->
			  </div><!-- .actions -->
			</div>
		  </div><!-- .product -->
		  
		  
		
		<div class="pagination-box">
		  <ul class="pagination">
			<li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
			<li class="active"><span>1</span></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li class="disabled"><a href="#">...</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
		  </ul>
		  <i class="pagination-text">Displaying 1 to 10 (of 100 posts)</i>
		</div><!-- .pagination-box -->
      </div><!-- .content -->
    </div>
  </div><!-- .container -->
</section><!-- #main -->
