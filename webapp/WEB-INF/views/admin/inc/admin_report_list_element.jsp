<!-- 

	@Author : 강대규
	@File name : admin_report_list_element.jsp
	@Date : 16.06.10
	@Desc : 관리자가 신고목록을 볼 수 있는 부분
 -->
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
function getContextPath() {
	   var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	   return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
function report_detail(index){
	console.log(index);
	$.ajax({
		type : "post",
		url : getContextPath() + "/report/report_detail.htm",
		data : {
			"report_num" : $('#report_num'+index).val()
		},
		success : function(data){
			console.log("성공");
			console.log(data);
			$('#reporter').text(data.REPORTER);
			$('#villain').text(data.VILLAIN);
			$('#report_title').text(data.REPORT_TITLE);
			$('#report_content').text(data.REPORT_CONTENT);
		}
	});
}
</script>
<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page">
  <header class="page-header">
    <div class="container">
      <h1 class="title">신고목록</h1>
    </div>	
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
		<div class="my-account">
		  <div class="table-responsive">
			<table class="table table-striped table-bordered text-center my-orders-table">
			  <thead>
			  	<tr>
			  		<th>신고한 사람</th>
			  		<th>신고받은 사람</th>
			  		<th>제목</th>
			  	</tr>
			  </thead>
			  
			  <tbody>
			  <c:forEach var="i" items="${report_list}" varStatus="j">
			  	<tr>
			  		<td>${i.REPORTER} / ${j.index}</td>
			  		<td>${i.VILLAIN} / ${i.REPORT_NUM}</td>
			  		<td>
			  			<a onclick="report_detail(${j.index})" data-toggle="modal" data-target="#reportModal">${i.REPORT_TITLE}</a>
			  			<input type="hidden" id="report_num${j.index}" value="${i.REPORT_NUM}">
			  		</td>
			  	</tr>
			  </c:forEach>
			  </tbody>
			</table>
		  </div>
		</div>
      </article><!-- .content -->
	  
	  <jsp:include page="admin_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->

<!-- 신고내역 상세보기 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">${memberdto.id}</h4>
      </div>
      <div class="modal-body">
        <div class="product-tab">
		  <ul class="nav nav-tabs">
		  	<li class="active"><a href="#report_detail">신고</a></li>
		  </ul><!-- .nav-tabs -->	
		  <div class="tab-content">
		  	<div class="tab-pane active" id="report_detail">
		  		<div class="bottom-padding">
			<br><br>
			<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th class="danger">신고한 사용자</th>
					<td><span id="reporter"></span></td>
				</tr>
				<tr>
					<th class="danger">신고당한 사용자</th>
					<td><span id="villain"></span></td>
				</tr>
				<tr>
					<th class="danger">제목</th>
					<td><span id="report_title"></span></td>
				</tr>
				
				<tr>
					<th class="danger">내용</th>
					<td><span id="report_content"></span></td>
				</tr>
			</table>
			</div>
		  </div>
		  	</div>

		  </div><!-- .tab-content -->
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
  </div>