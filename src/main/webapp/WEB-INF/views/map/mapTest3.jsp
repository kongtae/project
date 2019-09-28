<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>FESPEDIA | マップ</title>
<!-- responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 3.3.7  -->
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
<!-- For IE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- jvectormap -->
<link rel="stylesheet"
	href="bower_components/jvectormap/jquery-jvectormap.css">
<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">
</head>
<style>
.title-text h3 {
	font-family: 'Poppins', sans-serif;
}
.title-text ul {
	font-family: 'Robtoto', sans-serif;
}
.fc-right {
	visibility: hidden;
}
.content {
	position: absolute;
}

.col-md-9 {
	margin: auto;
	min-width: fit-content;
	padding: 8%;
}
.main-footer {
	padding-top: 7.8%;
    padding-bottom: 7.8%;
    width: -webkit-fill-available;
}
.footer-menu {
	font-family: 'Robtoto', sans-serif;
}
.footer-bottom {
	font-family: 'Robtoto', sans-serif;
}

.box{
	margin-bottom: 0px;
	height: 500px;
}
.country {
	fill: #ccc;
	stroke: #fff;
	stroke-width: .5px;
	stroke-linejoin: round;
}

.graticule {
	fill: none;
	stroke: #000;
	stroke-opacity: .3;
	stroke-width: .5px;
}

.graticule.outline {
	stroke: #333;
	stroke-opacity: 1;
	stroke-width: 1.5px;
}

.jvectormap-label {
	border: 1px solid white;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	border-radius: 7px;
	background: #fa334f;
	color: white;
	font-family: Arial;
	padding: auto;
	font-size: 15px;
	line-height: 30px;
}
</style>

<body>
	<div class="boxed_wrapper">
		<!--Start Preloader -->
		<div class="preloader"></div>
		<!--End Preloader -->

		<!-- Main Header-->
		<header class="main-header">

			<!--Header Top-->
			<div class="header-top">
			<div class="container">
				<div class="clearfix"
					style="font-size: 16px; color: #848484; line-height: 26px; font-weight: 400; font-family: 'Roboto', sans-serif;">
					<!--Top Left-->
					<div class="top-left">
						<ul class="header-info-list">
								<li><span class="icon fa fa-envelope"></span><strong>Email</strong>
									SC.IT@MASTER.COM</li>
								<li><span class="icon fa fa-map-marker"></span><strong>Location</strong>
									Trade Center COEX, SEOUL 135-731 KOREA</li>
						</ul>
					</div>
					<!--Top Right-->
					<div class="top-right">
						<!--Social Box-->
						<ul class="social-box">
							<c:if test="${sessionScope.loginid == null}" >
									<c:if test="${sessionScope.adminid == null}" >
									<li><a href="registermember">Sign Up</a></li>
									<li><a href="loginForm">Sign in</a></li>
									</c:if>
								</c:if>
								
								<c:if test="${sessionScope.loginid != null}">
									<li><a href="memberPage">UserPage</a></li>
									<li><a href="logout">Logout</a></li>
								</c:if>
								
								<c:if test="${sessionScope.adminid !=null}">
									<li><a href="adminListPage">AdminListPage</a></li>
									<li><a href="adminBulPage">AdminBulPage</a></li>
									<li><a href="logout">Logout</a></li>
								</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>

			<!--Header-Upper-->
			<div class="header-upper">
			<div class="container">
				<div class="clearfix">

					<div class="float-left logo-box">
						<div class="logo"
							style="width: 179px; height: 80px; background: white;">
							<a href="/festival"><img src="images/logo.png" alt=""
								title=""></a>
						</div>
					</div>

					<div class="nav-outer clearfix">

						<!-- Main Menu -->
						<nav class="main-menu navbar-expand-md">
							<div class="navbar-header">
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#navbarSupportedContent"
									aria-controls="navbarSupportedContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

							<div class="navbar-collapse collapse clearfix"
								id="navbarSupportedContent">
								<ul class="navigation clearfix">
									<li class="dropdown"><a href="festival">Home</a></li>
									<li class="dropdown"><a href="listForm">List</a>
										<ul>
											<li><a href="listForm">List</a></li>
										</ul></li>
									<li class="dropdown"><a href="calendar">Calendar</a>
										<ul>
											<li><a href="calendar">Calendar</a></li>
										</ul></li>
									<li class="dropdown"><a href="map">Map</a>
										<ul>
											<li><a href="map">Map</a></li>
										</ul></li>
									<li class="dropdown"><a href="boardList">Board</a>
										<ul>
											<li><a href="boardList">Board</a></li>
										</ul></li>
								</ul>
							</div>

						</nav>

						<!--Button Box-->
						<div class="button-box">
							<a href="searchFestival" class="theme-btn btn-style-one">Search Festival</a>
						</div>

						<!--Search Box Outer-->
						<div class="search-box-outer">
							<div class="dropdown">
								<button class="search-box-btn dropdown-toggle" type="button"
									id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"></button>
								<ul class="dropdown-menu pull-right search-panel"
									aria-labelledby="dropdownMenu3">
									<li class="panel-outer">
										<div class="form-container">
											<form method="post" action="blog.html">
												<div class="form-group">
													<input type="search" name="field-name" value=""
														placeholder="Search Here" required>
													<button type="submit" class="search-btn">
														<span class="fa fa-search"></span>
													</button>
												</div>
											</form>
										</div>
									</li>
								</ul>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
			<!--End Header Upper-->
		</header>
		<!--End Main Header -->


		<!-- Page Title-->
		<section class="page-title" style="background: url(resources/images/userimage/불꽃놀이.jpg); margin-top: 6%;">
    	<div class="container">
        	<div class="title-text text-center">
           	 <h3>マップ</h3>
           	 <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="map">Map</a></li>
            </ul>
        	</div>                
   		</div>
	</section>
		<!-- End Page Title-->

		<!-- Map box -->
		<div class="box box-solid bg-light-blue-gradient">
			<div class="box-header">
				<!-- tools box -->
				<div class="pull-right box-tools">
					<button type="button" class="btn btn-primary btn-sm pull-right"
						data-widget="collapse" data-toggle="tooltip" title="Collapse"
						style="margin-right: 5px;">
						<i class="fa fa-minus"></i>
					</button>
				</div>
				<!-- /. tools -->

				<i class="fa fa-map-marker"></i>

				<h1 class="box-title">FESPEDIA</h1>


			</div>
			<div class="box-body">
				<div id="world-map" style="height: 400px; width: 100%;"></div>
				<h1 id="name"></h1>
			</div>
		</div>
		<!-- /.box -->

		<!-- Main Footer-->
	<footer class="main-footer">
    <div class="container">
        <div class="footer-area text-center">
            <div class="footer-logo">
                <figure>
                    <a href="index.html"><img src="images/logo-2.png" alt=""></a>
                </figure>
            </div>
            <ul class="footer-menu">
                <li><a href="festival">Home</a></li>
                <li><a href="listForm">List</a></li>
                <li><a href="Calendar">Calendar</a></li>
                <li><a href="map">Map</a></li>
                <li><a href="boardList">Board</a></li>
				<li><a href="searchFestival">Search Festival</a></li>
            </ul>
            <ul class="social-links">
					
            </ul>
        </div>            
    </div>
	</footer>
	<!--End Main Footer-->

	<!--Footer Bottom Section-->
	<section class="footer-bottom">
			<div class="container">
				<div class="copyright-text text-center">
					Copyright &copy; <a href="festival">FESPEDIA</a> 2019. All Rights Reserved
				</div>
			</div>
	</section>
	<!--End Footer Bottom Section-->

		<!--Scroll to top-->
		<div class="scroll-to-top scroll-to-target" data-target="html">
			<span class="fa fa-angle-up"></span>
		</div>


		<script src="js/jquery.js"></script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.fancybox.js"></script>
		<script src="js/owl.js"></script>
		<script src="js/wow.js"></script>
		<script src="js/jquery.countTo.js"></script>
		<script src="js/jquery.countdown.min.js"></script>
		<script src="js/appear.js"></script>
		<script src="js/jquery-ui.js"></script>
		<script src="js/isotope.js"></script>
		<script src="js/bxslider.js"></script>
		<script src="js/validate.js"></script>

		<!-- Custom script -->
		<script src="js/custom.js"></script>

		<!--Google Map-->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBevTAR-V2fDy9gQsQn1xNHBPH2D36kck0"></script>
		<script src="js/map-script.js"></script>
		<!--End Google Map APi-->
	</div>
	<!-- Sparkline -->
	<script
		src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- jQuery Knob Chart -->
	<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script src="bower_components/moment/min/moment.min.js"></script>
	<script
		src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
	<!-- datepicker -->
	<script
		src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<!-- <script src="js/jquery-3.4.1.js"></script> -->
	<script>
window.onload =function(){
	selectMap();
}

var visitorsData = {
  US: 398, // USA
  SA: 400, // Saudi Arabia
  CA: 1000, // Canada
  DE: 500, // Germany
  FR: 760, // France
  CN: 300, // China
  AU: 700, // Australia
  BR: 600, // Brazil
  IN: 800, // India
  GB: 320, // Great Britain
  RU: 647 // Russia
};
 var mapList = {};
function selectMap(){
	
	 $.ajax({
		url : "selectMap1",
		type:"post",
		dataType:"json",
		success : function(data) {	//데이터를 hashmap으로 갖고온다.
			mapList = data;
		
		},
		error : function(data) {
			alert("マップを読み込めませんでした。");
		}
	});
}

//jvectormap data

	// World map by jvectormap
	var worldmap = $('#world-map').vectorMap({
	  map              : 'world_mill_en',
	  backgroundColor  : 'transparent',
	  enableZoom: true,
	  showTooltip: true,
	  regionStyle      : {
	    initial: {
	      fill            : '#e4e4e4',
	      'fill-opacity'  : 1,
	      stroke          : 'none',
	      'stroke-width'  : 0,
	      'stroke-opacity': 1
	    	},
			hover        : {
		      'fill-opacity': 0.7,
		      cursor        : 'pointer'
		    },
		    selected     : {
		      fill: 'yellow'
		    },
		    selectedHover: {}
		  
	  },
	  series           : {
	    regions: [
	      {
	        values           : mapList,	//밸류에 mapList 주고
	        scale            : ['#92c1dc', '#ebf4f9'],
	        normalizeFunction: 'polynomial'
	      }
	    ]
	  },
	  onRegionLabelShow: function (e, el, code) {
		
	    if (typeof mapList[code] != 'undefined'){
	        el.html(el.html() + ' : ' + mapList[code] + '個');
	    } 
	  },
		onRegionClick: function(event, code, el){
			location.href="countryList?country="+code;
		}
	});
</script>
</body>
</html>
