<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 

	@Author : 강대규
	@File name : admin_report_list_element.jsp
	@Date : 16.06.10
	@Desc : 관리자가 신고목록을 볼 수 있는 부분
 -->

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page">
  <header class="page-header">
    <div class="container">
      <h1 class="title">사이트 통계</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="product-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#chart1">Chart 1</a></li>
						<li><a href="#chart2">Chart 2</a></li>
					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">

						<!-- 지도 들어가는 부분 시작 -->
						<div class="tab-pane active" id="chart1">

						</div>

						<div class="tab-pane" id="chart2">

						</div>

					</div>
					<!-- .tab-content -->
				</div>
      </article><!-- .content -->
	  
	  <jsp:include page="admin_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->