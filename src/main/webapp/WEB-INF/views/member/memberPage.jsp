<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<!-- For IE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>FESPEDIA | プロフィール</title>

<!-- responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<!-- == -->
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
      folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

<style>
.main-footer {
	padding-top: 7.5%;
    padding-bottom: 7.5%;
    width: -webkit-fill-available;
}
</style>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.js"></script>
<script>

$(function() {
	memberSelect();
});

function memberSelect(){
	
	$.ajax({
		url : "memberSelect",
		type : "post",
		success : function(result) {
			if(result.originalFileName != null) {
				originalFileName = "resources/images/userimage/" +result.originalFileName;
			$('#profileImage').attr("src", originalFileName);
			}
		},
		error : function() {
			alert("会員を見つけられませんでした。");
		}
	});
	
}


</script>
</head>

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
								<li><span class="icon fa fa-envelope"
									style="font-family: 'Font Awesome 5 Free'; font-weight: 900;"></span><strong>Email</strong>
									info@wiscon.com</li>
								<li><span class="icon fa fa-map-marker"
									style="font-family: 'Font Awesome 5 Free'; font-weight: 900;"></span><strong>Location</strong>
									49 BelWest Lane, TX 26098</li>
							</ul>
						</div>
						<!--Top Right-->
						<div class="top-right">
							<!--Social Box-->
							<ul class="social-box">
									<li><a href="adminPage">AdminPage</a></li>
								<c:if test="${sessionScope.loginid == null}">
									<li><a href="registermember">Sign Up</a></li>
									<li><a href="loginForm">Sign in</a></li>
								</c:if>
								<c:if test="${sessionScope.loginid != null}">
									<li><a href="memberPage">UserPage</a></li>
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
							<div class="logo" style="width: 179px; height: 80px;">
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
										<li class="dropdown"><a href="/festival">Home</a></li>
										<li class="dropdown"><a href="#">List</a>
											<ul>
												<li><a href="listForm">List</a></li>
											</ul></li>
										<li class="dropdown"><a href="#">Calendar</a>
											<ul>
												<li><a href="calendar">Calendar</a></li>
											</ul></li>
										<li class="dropdown"><a href="#">Map</a>
											<ul>
												<li><a href="#">Map</a></li>
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
								<a href="#" class="theme-btn btn-style-one">Search Festival</a>
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

			<!--Sticky Header-->
			<div class="sticky-header stricky">
				<div class="container clearfix">
					<!--Logo-->
					<div class="logo float-left">
						<a href="index.html" class="img-responsive"><img
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
									<li class="dropdown"><a href="/festival">Home</a>
										<ul>
											<li><a href="index.html">Home Page 01</a></li>
											<li><a href="index-2.html">Home Page 02</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">About</a>
										<ul>
											<li><a href="about-us.html">About Us</a></li>
											<li><a href="speakers.html">Speakers</a></li>
											<li><a href="speakers-details.html">Speaker Details</a></li>
											<li><a href="error-page.html">Error Page</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">Shedule</a>
										<ul>
											<li><a href="shedule.html">Shedule</a></li>
											<li><a href="shedule-details.html">Shedule Details</a></li>
										</ul></li>
									<li class="current dropdown"><a href="#">Sponsors</a>
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
		<!-- <section class="page-title" style="background: url(images/background/page-title-6.jpg);">
    <div class="container">
        <div class="title-text text-center">
            <h3>Our Sponsors</h3>
            <ul>
                <li><a href="index.html">home</a></li>
                <li>/</li>
                <li>Our Sponsors</li>
            </ul>
        </div>                
    </div>
</section> -->
		<!-- End Page Title-->


		<!--Sponcer Section-->
		<!-- <section class="sponsor-section two" id="sponsor-tab">
    <div class="container">
        <div class="sponsor-area two text-center">
            <div class="tab-btn clearfix">
                <div class="btn active" data-tab-name="tab-one">
                    gold Sponsor
                </div>
                <div class="btn" data-tab-name="tab-two"> 
                    silver Sponsor                                     
                </div>  
            </div>
            <div class="tab-content clearfix">
                <div id="tab-one">
                    <div class="sponsor-area-one">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/6.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/7.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/8.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/9.png" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>            
                    </div>
                    <div class="sponsor-area-two">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/10.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/11.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/12.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/13.png" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab-two">
                    <div class="sponsor-area-one">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/6.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/7.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/8.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/9.png" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>            
                    </div>
                    <div class="sponsor-area-two">
                        <div class="row">
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/10.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/11.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/12.png" alt="">
                                    </figure>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 col-sm-6">
                                <div class="image-box">
                                    <figure>
                                        <img src="images/sponsor/13.png" alt="">
                                    </figure>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> -->
		<!--End Sponcer Section-->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<!-- Main content -->
			<section class="content" style="width: 80%;">

				<div class="row">
					<div class="col-md-3">

						<!-- Profile Image -->
						<div class="box box-primary">
							<div class="box-body box-profile">
								<img class="profile-user-img img-responsive img-circle"
									src="dist/img/user4-128x128.jpg" id="profileImage" alt="User profile picture">

								<h3 class="profile-username text-center">Nina Mcintire</h3>

								<p class="text-muted text-center">Software Engineer</p>

								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>Followers</b> <a
										class="pull-right">1,322</a></li>
									<li class="list-group-item"><b>Following</b> <a
										class="pull-right">543</a></li>
									<li class="list-group-item"><b>Friends</b> <a
										class="pull-right">13,287</a></li>
								</ul>
								<a href="memberUpdate" class="btn btn-primary btn-block"><b>Update</b></a>
								<a href="WithdrawForm" class="btn btn-primary btn-block"><b>Withdraw</b></a>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->

						<!-- About Me Box -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">About Me</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<strong><i class="fa fa-book margin-r-5"></i> Education</strong>

								<p class="text-muted">B.S. in Computer Science from the
									University of Tennessee at Knoxville</p>

								<hr>

								<strong><i class="fa fa-map-marker margin-r-5"></i>
									Location</strong>

								<p class="text-muted">Malibu, California</p>

								<hr>

								<strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

								<p>
									<span class="label label-danger">UI Design</span> <span
										class="label label-success">Coding</span> <span
										class="label label-info">Javascript</span> <span
										class="label label-warning">PHP</span> <span
										class="label label-primary">Node.js</span>
								</p>

								<hr>

								<strong><i class="fa fa-file-text-o margin-r-5"></i>
									Notes</strong>

								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Etiam fermentum enim neque.</p>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="nav-tabs-custom">
							<div class="tab-content">
								<div class="active tab-pane" id="timeline">
									<!-- The timeline -->
									<ul class="timeline timeline-inverse">
										<!-- timeline time label -->
										<li class="time-label"><span class="bg-red"> 10
												Feb. 2014 </span></li>
										<!-- /.timeline-label -->
										<!-- timeline item -->
										<li><i class="fa fa-envelope bg-blue"></i>

											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i>
													12:05</span>

												<h3 class="timeline-header">
													<a href="#">Support Team</a> sent you an email
												</h3>

												<div class="timeline-body">Etsy doostang zoodles
													disqus groupon greplin oooj voxy zoodles, weebly ning
													heekya handango imeem plugg dopplr jibjab, movity jajah
													plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
													quora plaxo ideeli hulu weebly balihoo...</div>
												<div class="timeline-footer">
													<a class="btn btn-primary btn-xs">Read more</a> <a
														class="btn btn-danger btn-xs">Delete</a>
												</div>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline item -->
										<li><i class="fa fa-user bg-aqua"></i>

											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i> 5
													mins ago</span>

												<h3 class="timeline-header no-border">
													<a href="#">Sarah Young</a> accepted your friend request
												</h3>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline item -->
										<li><i class="fa fa-comments bg-yellow"></i>

											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i> 27
													mins ago</span>

												<h3 class="timeline-header">
													<a href="#">Jay White</a> commented on your post
												</h3>

												<div class="timeline-body">Take me to your leader!
													Switzerland is small and neutral! We are more like Germany,
													ambitious and misunderstood!</div>
												<div class="timeline-footer">
													<a class="btn btn-warning btn-flat btn-xs">View comment</a>
												</div>
											</div></li>
										<!-- END timeline item -->
										<!-- timeline time label -->
										<li class="time-label"><span class="bg-green"> 3
												Jan. 2014 </span></li>
										<!-- /.timeline-label -->
										<!-- timeline item -->
										<li><i class="fa fa-camera bg-purple"></i>

											<div class="timeline-item">
												<span class="time"><i class="fa fa-clock-o"></i> 2
													days ago</span>

												<h3 class="timeline-header">
													<a href="#">Mina Lee</a> uploaded new photos
												</h3>

												<div class="timeline-body">
													<img src="http://placehold.it/150x100" alt="..."
														class="margin"> <img
														src="http://placehold.it/150x100" alt="..." class="margin">
													<img src="http://placehold.it/150x100" alt="..."
														class="margin"> <img
														src="http://placehold.it/150x100" alt="..." class="margin">
												</div>
											</div></li>
										<!-- END timeline item -->
										<li><i class="fa fa-clock-o bg-gray"></i></li>
									</ul>
								</div>
								<!-- /.tab-pane -->
							</div>
							<!-- /.tab-content -->
						</div>
						<!-- /.nav-tabs-custom -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer-->
		<footer class="main-footer"
			style="background: url(images/background/footer.jpg);">
			<div class="container">
				<div class="footer-area text-center">
					<div class="footer-logo">
						<figure>
							<a href="index.html"><img src="images/logo-2.png" alt=""></a>
						</figure>
					</div>
					<ul class="footer-menu">
						<li><a href="index.html">Home</a></li>
						<li><a href="about-us.html">About</a></li>
						<li><a href="speakers.html">Speakers</a></li>
						<li><a href="#">Pages</a></li>
						<li><a href="shedule.html">Schedule</a></li>
						<li><a href="sponsor.html">Sponsors</a></li>
						<li><a href="blog.html">Blog</a></li>
						<li><a href="contact-us.html">Contact</a></li>
					</ul>
					<ul class="social-links">
						<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="#"><i class="fab fa-twitter"></i></a></li>
						<li><a href="#"><i class="fab fa-vine"></i></a></li>
						<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
						<li><a href="#"><i class="fab fa-pinterest"></i></a></li>
						<li><a href="#"><i class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</footer>
		<!--End Main Footer-->


		<!--Footer Bottom Section-->
		<section class="footer-bottom">
			<div class="container">
				<div class="copyright-text text-center">
					Copyright &copy; <a href="#">Wiscon</a> 2019. All Rights Reserved
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
</body>
</html>