<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 

	@Author : 강대규
	@File name : admin_report_list_element.jsp
	@Date : 16.06.10
	@Desc : 관리자가 통계를 볼수 있는 화면
 -->
<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript">
$(function(){
    var SUB_STA_NM=[];
    var RIDE_PASGR_NUM=[];
    var ALIGHT_PASGR_NUM=[];
    $.getJSON(
          "20160322bundang.json"
           ,function(data){
              $.each(data.DATA,function(index,obj){
                  SUB_STA_NM.push(obj.SUB_STA_NM);
                  RIDE_PASGR_NUM.push(parseInt(obj.RIDE_PASGR_NUM));
                  ALIGHT_PASGR_NUM.push(parseInt(obj.ALIGHT_PASGR_NUM));
               });
    
     $('#highchart').highcharts({        //차트형식
         chart: {
             type: 'line'
         },
         title: {                    //차트주제
             text: '2016년 3월 22일 분당선 역별 승하차 인원수 '
         },
      
         xAxis: {            //x축 내용
             categories:  SUB_STA_NM,
             crosshair:{
                 color: 'lightgreen',
                 width:3
             }
         },
         yAxis: {            //y 축내용
             min: 0,
             title: {
                 text: '(명)'
             }
         },
         
         legend: {        //범례
             layout: 'vertical',
             align: 'right',
             verticalAlign: 'middle'
             
         },
         
         tooltip: {        //말풍선
             headerFormat: '<span style="font-size:15px">{point.key}</span>',
             pointFormat: '<table><tr><td style="color:{series.color}">{series.name}: </td>' +
                 '<td><b>{point.y:f} 명</b></td></tr></table>',
             shared: true,
             useHTML: true
         },
      
         series: [{
             name: '하차 인원',
             data:  ALIGHT_PASGR_NUM

         }, {
             name: '승차인원',
             data:  RIDE_PASGR_NUM

         }]
     });
  });
});
</script>
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
						<li class="active"><a href="#chart1">게시글 통계</a></li>
						<li><a href="#chart2">남녀비율 통계</a></li>
						<li><a href="#chart3">가입자수 통계</a></li>
						<li><a href="#chart4">신고건수 통계</a></li>
						<li><a href="#chart5">방문자수 통계</a></li>
					</ul>
					<!-- .nav-tabs -->
					<div class="tab-content">

						<!-- 지도 들어가는 부분 시작 -->
						<div class="tab-pane active" id="chart1">

						</div>

						<div class="tab-pane" id="chart2">

						</div>
						
						<div class="tab-pane" id="chart3">

						</div>
						
						<div class="tab-pane" id="chart4">

						</div>
						
						<div class="tab-pane" id="chart5">

						</div>

					</div>
					<!-- .tab-content -->
				</div>
      </article><!-- .content -->
	  
	  <jsp:include page="admin_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->