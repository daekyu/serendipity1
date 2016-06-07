<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 여행자가 가이드를 모집하는 글을 올리는 곳 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="keywords" content="HTML5 Template">
		<meta name="description" content="Progressive — Responsive Multipurpose HTML Template">
		<meta name="author" content="itembridge.com">
		<meta class="viewport" name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Insert title here</title>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href=".././resources/img/favicon.ico">
		
		<!-- Font -->
		<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Arimo:400,700,400italic,700italic'>
		
		<!-- Plugins CSS -->
		<link rel="stylesheet" href=".././resources/css/bootstrap.css">
		<link rel="stylesheet" href=".././resources/css/font-awesome.min.css">
		<link rel="stylesheet" href=".././resources/css/jslider.css">
		<link rel="stylesheet" href=".././resources/css/revslider/settings.css">
		<link rel="stylesheet" href=".././resources/css/jquery.fancybox.css">
		<link rel="stylesheet" href=".././resources/css/animate.css">
		<link rel="stylesheet" href=".././resources/css/video-js.min.css">
		<link rel="stylesheet" href=".././resources/css/morris.css">
		<link rel="stylesheet" href=".././resources/css/royalslider/royalslider.css">
		<link rel="stylesheet" href=".././resources/css/royalslider/skins/minimal-white/rs-minimal-white.css">
		<link rel="stylesheet" href=".././resources/css/layerslider/css/layerslider.css">
		<link rel="stylesheet" href=".././resources/css/ladda.min.css">
		<link rel="stylesheet" href=".././resources/css/datepicker.css">
		<link rel="stylesheet" href=".././resources/css/jquery.scrollbar.css">
		
		<!-- Theme CSS -->
		<link rel="stylesheet" href=".././resources/css/style.css">
		
		<!-- Custom CSS -->
		<link rel="stylesheet" href=".././resources/css/customizer/pages.css">
		<link rel="stylesheet" href=".././resources/css/customizer/home-pages-customizer.css">
		
		<!-- IE Styles-->
		<!-- <link rel='stylesheet' href="../css/ie/ie.css"> -->
	</head>


	<!-- Body 시작 -->
	<body class="fixed-header hidden-top">
		<div class="page-box">
			<div class="page-box-content">
				
				<!-- 로그인/회원가입 들어갈 수 있는 버튼 나와있는 부분 -->
				<jsp:include page="../inc/top-box.jsp"></jsp:include>
				<!-- 상단 메뉴 -->
				<jsp:include page="../inc/header.jsp"></jsp:include>
				
				<div class="clearfix"></div>
				
				<jsp:include page="inc/guide_detail_element.jsp"></jsp:include>
				
			</div><!-- .page-box-content -->
		</div><!-- .page-box -->
		
		<!-- Footer -->
		<jsp:include page="../inc/footer.jsp"/>
		
		<div class="clearfix"></div>
		
		
		<!-- 각종 Javascript -->
		
		<!--[if (!IE)|(gt IE 8)]><!-->
		<script src=".././resources/js/jquery-2.1.3.min.js"></script>
		<!--<![endif]-->
		
		<!--[if lte IE 8]>
		<script src="js/jquery-1.9.1.min.js"></script>
		<![endif]-->
		<script src=".././resources/js/bootstrap.min.js"></script>
		<script src=".././resources/js/price-regulator/jshashtable-2.1_src.js"></script>
		<script src=".././resources/js/price-regulator/jquery.numberformatter-1.2.3.js"></script>
		<script src=".././resources/js/price-regulator/tmpl.js"></script>
		<script src=".././resources/js/price-regulator/jquery.dependClass-0.1.js"></script>
		<script src=".././resources/js/price-regulator/draggable-0.1.js"></script>
		<script src=".././resources/js/price-regulator/jquery.slider.js"></script>
		<script src=".././resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
		<script src=".././resources/js/jquery.touchwipe.min.js"></script>
		<script src=".././resources/js/jquery.elevateZoom-3.0.8.min.js"></script>
		<script src=".././resources/js/jquery.imagesloaded.min.js"></script>
		<script src=".././resources/js/jquery.appear.js"></script>
		<script src=".././resources/js/jquery.sparkline.min.js"></script>
		<script src=".././resources/js/jquery.easypiechart.min.js"></script>
		<script src=".././resources/js/jquery.easing.1.3.js"></script>
		<script src=".././resources/js/jquery.fancybox.pack.js"></script>
		<script src=".././resources/js/isotope.pkgd.min.js"></script>
		<script src=".././resources/js/jquery.knob.js"></script>
		<script src=".././resources/js/jquery.selectBox.min.js"></script>
		<script src=".././resources/js/jquery.royalslider.min.js"></script>
		<script src=".././resources/js/jquery.tubular.1.0.js"></script>
		<script src=".././resources/js/SmoothScroll.js"></script>
		<script src=".././resources/js/country.js"></script>
		<script src=".././resources/js/spin.min.js"></script>
		<script src=".././resources/js/ladda.min.js"></script>
		<script src=".././resources/js/masonry.pkgd.min.js"></script>
		<script src=".././resources/js/morris.min.js"></script>
		<script src=".././resources/js/raphael.min.js"></script>
		<script src=".././resources/js/video.js"></script>
		<script src=".././resources/js/pixastic.custom.js"></script>
		<script src=".././resources/js/livicons-1.4.min.js"></script>
		<script src=".././resources/js/layerslider/greensock.js"></script>
		<script src=".././resources/js/layerslider/layerslider.transitions.js"></script>
		<script src=".././resources/js/layerslider/layerslider.kreaturamedia.jquery.js"></script>
		<script src=".././resources/js/revolution/jquery.themepunch.tools.min.js"></script>
		<script src=".././resources/js/revolution/jquery.themepunch.revolution.min.js"></script>
		<!-- SLIDER REVOLUTION 5.0 EXTENSIONS  
		(Load Extensions only on Local File Systems !
		The following part can be removed on Server for On Demand Loading) -->	
		<script src=".././resources/js/revolution/extensions/revolution.extension.actions.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.carousel.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.kenburn.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.layeranimation.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.migration.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.navigation.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.parallax.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.slideanims.min.js"></script>
		<script src=".././resources/js/revolution/extensions/revolution.extension.video.min.js"></script>
		<script src=".././resources/js/bootstrapValidator.min.js"></script>
		<script src=".././resources/js/bootstrap-datepicker.js"></script>
		<script src=".././resources/js/jplayer/jquery.jplayer.min.js"></script>
		<script src=".././resources/js/jplayer/jplayer.playlist.min.js"></script>
		<script src=".././resources/js/jquery.scrollbar.min.js"></script>
		<script src=".././resources/js/main.js"></script>
	
	</body>
</html>