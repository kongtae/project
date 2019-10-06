<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Wiscon || Responsive HTML 5 Template</title>
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

<link href="https://fonts.googleapis.com/css?family=M+PLUS+1p|M+PLUS+Rounded+1c&display=swap" rel="stylesheet">

</head>
<style>
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
.vcontainer{
	width: 1000px;
	margin: 30px auto;
}
#vmap{
	width: 100%;
	height: 400px;
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
					<div class="clearfix">
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
								<li class="share">Connect With Us</li>
								<li><a href="#"><span class="fab fa-facebook"></span></a></li>
								<li><a href="#"><span class="fab fa-linkedin"></span></a></li>
								<li><a href="#"><span class="fab fa-vimeo"></span></a></li>
								<li><a href="#"><span class="fab fa-google-plus"></span></a></li>
								<li><a href="#"><span class="fab fa-twitter"></span></a></li>
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
							<div class="logo">
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
										<span class="icon-bar"></span> <span class="icon-bar"></span>
										<span class="icon-bar"></span>
									</button>
								</div>

								<div class="navbar-collapse collapse clearfix"
									id="navbarSupportedContent">
									<ul class="navigation clearfix">
										<li class="dropdown"><a href="#">Home</a>
											<ul>
												<li><a href="festival">Home Page 01</a></li>
												<li><a href="index-2.html">Home Page 02</a></li>
											</ul></li>
										<li class="dropdown"><a href="#">About</a>
											<ul>
												<li><a href="about-us.html">About Us</a></li>
												<li><a href="speakers.html">Speakers</a></li>
												<li><a href="speakers-details.html">Speaker Details</a></li>
												<li><a href="error-page.html">Error Page</a></li>
											</ul></li>
										<li class="current dropdown"><a href="#">Shedule</a>
											<ul>
												<li><a href="shedule.html">Shedule</a></li>
												<li><a href="shedule-details.html">Shedule Details</a></li>
											</ul></li>
										<li class="dropdown"><a href="#">Sponsors</a>
											<ul>
												<li><a href="sponsor.html">Sponsors</a></li>
												<li><a href="sponsor-details.html">Sponsor Details</a></li>
											</ul></li>
										<li class="dropdown"><a href="#">Blog</a>
											<ul>
												<li><a href="blog.html">Blog</a></li>
												<li><a href="blog-single.html">Blog Details</a></li>
											</ul></li>
										<li><a href="contact-us.html">Contact us</a></li>
									</ul>
								</div>

							</nav>

							<!--Button Box-->
							<div class="button-box">
								<a href="#" class="theme-btn btn-style-one">Get Ticket</a>
							</div>

							<!--Search Box Outer-->
							<div class="search-box-outer">
								<div class="dropdown">
									<button class="search-box-btn dropdown-toggle" type="button"
										id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<span class="fa fa-search"></span>
									</button>
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

			<!--Sticky Header-->
			<div class="sticky-header stricky">
				<div class="container clearfix">
					<!--Logo-->
					<div class="logo float-left">
						<a href="festival" class="img-responsive"><img
							src="images/logo.png" alt="" title=""></a>
					</div>

					<!--Right Col-->
					<div class="right-col float-right">
						<!-- Main Menu -->
						<nav class="main-menu navbar-expand-md">
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent1"
								aria-controls="navbarSupportedContent1" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>

							<div class="navbar-collapse collapse clearfix"
								id="navbarSupportedContent1">
								<ul class="navigation clearfix">
									<li class="dropdown"><a href="#">Home</a>
										<ul>
											<li><a href="festival">Home Page 01</a></li>
											<li><a href="index-2.html">Home Page 02</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">About</a>
										<ul>
											<li><a href="about-us.html">About Us</a></li>
											<li><a href="speakers.html">Speakers</a></li>
											<li><a href="speakers-details.html">Speaker Details</a></li>
											<li><a href="error-page.html">Error Page</a></li>
										</ul></li>
									<li class="current dropdown"><a href="#">Shedule</a>
										<ul>
											<li><a href="shedule.html">Shedule</a></li>
											<li><a href="shedule-details.html">Shedule Details</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">Sponsors</a>
										<ul>
											<li><a href="sponsor.html">Sponsors</a></li>
											<li><a href="sponsor-details.html">Sponsor Details</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">Blog</a>
										<ul>
											<li><a href="blog.html">Blog</a></li>
											<li><a href="blog-single.html">Blog Details</a></li>
										</ul></li>
									<li><a href="contact-us.html">Contact us</a></li>
								</ul>
							</div>
						</nav>
						<!-- Main Menu End-->
					</div>

				</div>
			</div>
			<!--End Sticky Header-->

		</header>
		<!--End Main Header -->


		<!-- Page Title-->
		<section class="page-title"
			style="background: url(images/background/page-title-1.jpg);">
			<div class="container">
				<div class="title-text text-center">
					<h3>MAP</h3>
					<ul>
						<li><a href="festival">home</a></li>
						<li>/</li>
						<li>Map</li>
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
                <button type="button" class="btn btn-primary btn-sm pull-right" data-widget="collapse"
                        data-toggle="tooltip" title="Collapse" style="margin-right: 5px;">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->

              <i class="fa fa-map-marker"></i>

              <h3 class="box-title">
                Visitors
              </h3>
            </div>
            
            <div class="vcontainer">
              <div id="world-map" style="height: 250px; width: 100%;"></div>
            	<h1 id="name"></h1>
            </div>
            
            <!-- /.box-body-->
            <div class="box-footer no-border">
              <div class="row">
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-1"></div>
                  <div class="knob-label">Visitors</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center" style="border-right: 1px solid #f4f4f4">
                  <div id="sparkline-2"></div>
                  <div class="knob-label">Online</div>
                </div>
                <!-- ./col -->
                <div class="col-xs-4 text-center">
                  <div id="sparkline-3"></div>
                  <div class="knob-label">Exists</div>
                </div>
                <!-- ./col -->
              </div>
              <!-- /.row -->
            </div>
          </div>
          <!-- /.box -->


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
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script>
		/* $('#world-map').vectorMap({
			map: 'world_en',
			enableZoom: true,
			showTooltip: true,
			onRegionClick: function(event, code, region){
				$('#name').html(region+" (" + code + ")");
			}
		}) */
		// jvectormap data
		  /* var visitorsData = {
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
		  // World map by jvectormap
		  $('#world-map').vectorMap({
		    map              : 'world_en',
		    backgroundColor  : 'transparent',
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
		          values           : visitorsData,
		          scale            : ['#92c1dc', '#ebf4f9'],
		          normalizeFunction: 'polynomial'
		        }
		      ]
		    },
		    onRegionLabelShow: function (e, el, code) {
		      if (typeof visitorsData[code] != 'undefined')
		        el.html(el.html() + ': ' + visitorsData[code] + ' new Festival');
		    }
		  }); */
		$('#world-map').vectorMap({
		    map              : 'world_en',
		    normalizeFunction: 'polynomial',
		    hoverOpacity     : 0.7,
		    hoverColor       : false,
		    backgroundColor  : 'transparent',
		    regionStyle      : {
		      initial      : {
		        fill            : 'rgba(210, 214, 222, 1)',
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
		    markerStyle      : {
		      initial: {
		        fill  : '#00a65a',
		        stroke: '#111'
		      }
		    },
		    markers          : [
		      { latLng: [41.90, 12.45], name: 'Vatican City' },
		      { latLng: [43.73, 7.41], name: 'Monaco' },
		      { latLng: [-0.52, 166.93], name: 'Nauru' },
		      { latLng: [-8.51, 179.21], name: 'Tuvalu' },
		      { latLng: [43.93, 12.46], name: 'San Marino' },
		      { latLng: [47.14, 9.52], name: 'Liechtenstein' },
		      { latLng: [7.11, 171.06], name: 'Marshall Islands' },
		      { latLng: [17.3, -62.73], name: 'Saint Kitts and Nevis' },
		      { latLng: [3.2, 73.22], name: 'Maldives' },
		      { latLng: [35.88, 14.5], name: 'Malta' },
		      { latLng: [12.05, -61.75], name: 'Grenada' },
		      { latLng: [13.16, -61.23], name: 'Saint Vincent and the Grenadines' },
		      { latLng: [13.16, -59.55], name: 'Barbados' },
		      { latLng: [17.11, -61.85], name: 'Antigua and Barbuda' },
		      { latLng: [-4.61, 55.45], name: 'Seychelles' },
		      { latLng: [7.35, 134.46], name: 'Palau' },
		      { latLng: [42.5, 1.51], name: 'Andorra' },
		      { latLng: [14.01, -60.98], name: 'Saint Lucia' },
		      { latLng: [6.91, 158.18], name: 'Federated States of Micronesia' },
		      { latLng: [1.3, 103.8], name: 'Singapore' },
		      { latLng: [1.46, 173.03], name: 'Kiribati' },
		      { latLng: [-21.13, -175.2], name: 'Tonga' },
		      { latLng: [15.3, -61.38], name: 'Dominica' },
		      { latLng: [-20.2, 57.5], name: 'Mauritius' },
		      { latLng: [26.02, 50.55], name: 'Bahrain' },
		      { latLng: [0.33, 6.73], name: 'São Tomé and Príncipe' }
		    ]
		  }); 
	</script>
</body>
</html>
