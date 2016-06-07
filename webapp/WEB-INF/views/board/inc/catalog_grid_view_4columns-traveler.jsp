<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 여행자가 올린 글 목록을 보여주는 페이지-->
<section id="main">
  <header class="page-header">
    <div class="container">
      <h1 class="title">가이드 구합니다. (여행자가 글 올리는 곳)</h1>
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
			<span class="grid">
			  <span class="glyphicon glyphicon-th-large"></span>
			</span>
			<a href="shop-catalog-list.html" class="list">
			  <span class="glyphicon glyphicon-th-list"></span>
			</a>
		  </div>
		  
		  <!-- 검색조건. 추후 수정해보자 -->
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
		<!-- 검색 조건 끝 .-->
		
		<div class="clearfix"></div>
		
	
		<div class="products grid row">
		  <div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">여행자가 올린 글 제목1</a>
				  </h3>
				  <div class="price">여행자 이름1</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">여행자가 올린 글 제목1</a>
			  </h3>
			  <div class="price">여행자 이름1</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: 붓싼</li>
				<li>가격상한: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">하고싶은 여행: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
	
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">가이드가 올린 글 제목2</a>
				  </h3>
				  <div class="price">가이드 이름2</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">가이드가 올린 글 제목2</a>
			  </h3>
			  <div class="price">가이드 이름2</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: </li>
				<li>가격: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">간단한 설명: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">가이드가 올린 글 제목3</a>
				  </h3>
				  <div class="price">가이드 이름3</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">가이드가 올린 글 제목3</a>
			  </h3>
			  <div class="price">가이드 이름3</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: </li>
				<li>가격: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">간단한 설명: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">가이드가 올린 글 제목4</a>
				  </h3>
				  <div class="price">가이드 이름4</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">가이드가 올린 글 제목4</a>
			  </h3>
			  <div class="price">가이드 이름4</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: </li>
				<li>가격: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">간단한 설명: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
	
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">가이드가 올린 글 제목5</a>
				  </h3>
				  <div class="price">가이드 이름5</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">가이드가 올린 글 제목5</a>
			  </h3>
			  <div class="price">가이드 이름5</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: </li>
				<li>가격: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">간단한 설명: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
	
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale top"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">가이드가 올린 글 제목6</a>
				  </h3>
				  <div class="price">가이드 이름6</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">가이드가 올린 글 제목6</a>
			  </h3>
			  <div class="price">가이드 이름6</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-1.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>지역: </li>
				<li>가격: $10</li>
				<li>언어: 영어, 한국어</li>
				<li>관심사: 맛집, 술, 술</li>
			  </ul>
			  <br>
			  <span class="">간단한 설명: <a href="#">이소라는 예쁘다. 조인성은 인성이 좋다. 김하남은 이미 집에갔다.</a></span>
			</div><!-- .product-hover -->
		  </div><!-- .product
	
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">Sony Xperia Z</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">Sony Xperia Z</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product
	
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">Xperia miro</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">Xperia miro</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-5.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html"> 800 Series Diamond</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html"> 800 Series Diamond</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-5.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <span class="sale new"></span>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-6.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">AirPlay Hi-Fi system</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">AirPlay Hi-Fi system</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-6.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">Sony Xperia Z</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">Sony Xperia Z</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-7.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product
		  
		  --><div class="col-sm-3 col-md-3 product rotation">
			<div class="default">
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="270" height="270">
			  </a>
			  <div class="product-description">
				<div class="vertical">
				  <h3 class="product-name">
					<a href="shop-product-view.html">Xperia miro</a>
				  </h3>
				  <div class="price">$1, 449.00</div>	
				</div>
			  </div>
			</div>
			
			<div class="product-hover">
			  <h3 class="product-name">
				<a href="shop-product-view.html">Xperia miro</a>
			  </h3>
			  <div class="price">$1, 449.00</div>
			  <a href="shop-product-view.html" class="product-image">
				<img class="replace-2x" src="content/img/product-8.jpg" alt="" title="" width="70" height="70">
			  </a>
			  <ul>
				<li>117 cm / 46"LCD TV</li>
				<li>Full HD 3D &amp; 2D</li>
				<li>Sony Internet TV</li>
				<li>Dynamic Edge LED</li>
				<li>1X-Reality PRO</li>
			  </ul>
			  <div class="actions">
				<a href="shop-product-view.html" class="add-cart">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<g>
					  <path fill="#1e1e1e" d="M15.001,4h-0.57l-3.707-3.707c-0.391-0.391-1.023-0.391-1.414,0c-0.391,0.391-0.391,1.023,0,1.414L11.603,4
						H4.43l2.293-2.293c0.391-0.391,0.391-1.023,0-1.414s-1.023-0.391-1.414,0L1.602,4H1C0.448,4,0,4.448,0,5s0.448,1,1,1
						c0,2.69,0,7.23,0,8c0,1.104,0.896,2,2,2h10c1.104,0,2-0.896,2-2c0-0.77,0-5.31,0-8c0.553,0,1-0.448,1-1S15.554,4,15.001,4z
						M13.001,14H3V6h10V14z"></path>
					  <path fill="#1e1e1e" d="M11.001,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1s-1,0.447-1,1v4C10.001,12.553,10.448,13,11.001,13z"></path>
					  <path fill="#1e1e1e" d="M8,13c0.553,0,1-0.447,1-1V8c0-0.553-0.448-1-1-1S7,7.447,7,8v4C7,12.553,7.448,13,8,13z"></path>
					  <path fill="#1e1e1e" d="M5,13c0.553,0,1-0.447,1-1V8c0-0.553-0.447-1-1-1S4,7.447,4,8v4C4,12.553,4.448,13,5,13z"></path>
					</g>
				  </svg>
				</a>
				<a href="#" class="add-wishlist">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
				  <path fill="#1e1e1e" d="M11.335,0C10.026,0,8.848,0.541,8,1.407C7.153,0.541,5.975,0,4.667,0C2.088,0,0,2.09,0,4.667C0,12,8,16,8,16
					s8-4,8-11.333C16.001,2.09,13.913,0,11.335,0z M8,13.684C6.134,12.49,2,9.321,2,4.667C2,3.196,3.197,2,4.667,2C6,2,8,4,8,4
					s2-2,3.334-2c1.47,0,2.666,1.196,2.666,2.667C14.001,9.321,9.867,12.49,8,13.684z"></path>
				  </svg>
				</a>
				<a href="#" class="add-compare">
				  <svg x="0" y="0" width="16px" height="16px" viewBox="0 0 16 16" enable-background="new 0 0 16 16" xml:space="preserve">
					<path fill="#1e1e1e" d="M16,3.063L13,0v2H1C0.447,2,0,2.447,0,3s0.447,1,1,1h12v2L16,3.063z"></path>
					<path fill="#1e1e1e" d="M16,13.063L13,10v2H1c-0.553,0-1,0.447-1,1s0.447,1,1,1h12v2L16,13.063z"></path>
					<path fill="#1e1e1e" d="M15,7H3V5L0,7.938L3,11V9h12c0.553,0,1-0.447,1-1S15.553,7,15,7z"></path>
				  </svg>
				</a>
			  </div><!-- .actions -->
			</div><!-- .product-hover -->
		  </div><!-- .product -->
		</div><!-- .products -->
		
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
		  <a href="${pageContext.request.contextPath}/board/traveler_writeform.htm" class="btn btn-default">글작성<span class="glyphicon glyphicon-arrow-right"></span></a>
		</div><!-- .pagination-box -->
      </div><!-- .content -->
      
    </div>
  </div><!-- .container -->
</section><!-- #main -->