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

$(function () {
	$.ajax({
		type:'post',
		url:'board_month_count.htm',
		dataType:'JSON',
		success:function(data){
			var chart = new Highcharts.Chart({
				chart: {
		            type: 'column',
		            renderTo : 'chart1'
		        },
		        credits:{
		        	enabled : false
		        },
		        title: {
		            text: '월별 게시판 게시글수'
		        },
		        xAxis: {
		        	categories: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
		            crosshair: true
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '게시글 수'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y}개</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            name: '가이드구함 게시판',
		            data: [data.guide[0], data.guide[1], data.guide[2], data.guide[3], data.guide[4], data.guide[5], data.guide[6], data.guide[7], data.guide[8], data.guide[9], data.guide[10], data.guide[11]]

		        }, {
		            name: '여행자구함 게시판',
		            data: [data.traveler[0], data.traveler[1], data.traveler[2], data.traveler[3], data.traveler[4], data.traveler[5], data.traveler[6], data.traveler[7], data.traveler[8], data.traveler[9], data.traveler[10], data.traveler[11]]

		        }, {
		            name: '여행후기 게시판',
		            data: [data.review[0], data.review[1], data.review[2], data.review[3], data.review[4], data.review[5], data.review[6], data.review[7], data.review[8], data.review[9], data.review[10], data.review[11]]

		        }]
			});
		}
	});
	$.ajax({
		type:'post',
		url:'member_gender_rate.htm',
		dataType:'JSON',
		success:function(data){
			var chart = new Highcharts.Chart({
		        chart: {
		            plotBackgroundColor: null,
		            plotBorderWidth: null,
		            plotShadow: false,
		            type: 'pie',
		            renderTo : 'chart2'
		        },
		        credits:{
		        	enabled : false
		        },
		        title: {
		            text: 'Serendipity 남여 비율'
		        },
		        tooltip: {
		            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		        },
		        plotOptions: {
		            pie: {
		                allowPointSelect: true,
		                cursor: 'pointer',
		                dataLabels: {
		                    enabled: true,
		                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
		                    style: {
		                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		                    }
		                }
		            }
		        },
		        series: [{
		            name: 'Rate',
		            colorByPoint: true,
		            data: [{
		                name: 'Male',
		                y: data.data[0]
		            }, {
		                name: 'Female',
		                y: data.data[1]
		            }]
		        }]
			});
		}
	});
	$.ajax({
		type:'post',
		url:'report_month_count.htm',
		dataType:'JSON',
		success:function(data){
			var chart = new Highcharts.Chart({
				chart: {
		            type: 'line',
		            renderTo : 'chart4'
		        },
		        credits:{
		        	enabled : false
		        },
				title: {
		            text: '최근 일주일간 신고 횟수',
		            x: -20 //center
		        },
		        xAxis: {
		        	categories: [data.day[6], data.day[5], data.day[4], data.day[3], data.day[2], data.day[1], data.day[0]]
		        },
		        yAxis: {
		            title: {
		                text: '신고 횟수'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '회'
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '신고',
		            data: [data.count[6], data.count[5], data.count[4], data.count[3], data.count[2], data.count[1], data.count[0]]
		        }]
			});
		}
	});
	$.ajax({
		type:'post',
		url:'join_month_count.htm',
		dataType:'JSON',
		success:function(data){
			var chart = new Highcharts.Chart({
				chart: {
		            type: 'line',
		            renderTo : 'chart3'
		        },
		        credits:{
		        	enabled : false
		        },
				title: {
		            text: '최근 일주일간 가입자수',
		            x: -20 //center
		        },
		        xAxis: {
		            categories: [data.day[6], data.day[5], data.day[4], data.day[3], data.day[2], data.day[1], data.day[0]]
		        },
		        yAxis: {
		            title: {
		                text: '가입자 수'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '명'
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '가입',
		            data: [data.count[6], data.count[5], data.count[4], data.count[3], data.count[2], data.count[1], data.count[0]]
		        }]
			});
		}
	});
	$.ajax({
		type:'post',
		url:'visit_today_count.htm',
		dataType:'JSON',
		success:function(data){
			var chart = new Highcharts.Chart({
				chart: {
		            type: 'line',
		            renderTo : 'chart5'
		        },
		        credits:{
		        	enabled : false
		        },
				title: {
		            text: '최근 일주일간 방문자수',
		            x: -20 //center
		        },
		        xAxis: {
		            categories: [data.day[6], data.day[5], data.day[4], data.day[3], data.day[2], data.day[1],data.day[0]]
		        },
		        yAxis: {
		            title: {
		                text: '방문자 수'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '명'
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '방문',
		            data: [data.visitCount[6], data.visitCount[5], data.visitCount[4], data.visitCount[3], data.visitCount[2], data.visitCount[1], data.visitCount[0]]
		        }]
			});
		}
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
						<li><a href="#chart2">남여비율 통계</a></li>
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