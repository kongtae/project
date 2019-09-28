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

<!-- For IE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

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
								<a href="searchFestival" class="theme-btn btn-style-one">Search Festival</a>
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
									<li class="dropdown"><a href="#">Home</a>
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
			style="background: url(images/background/page-title-2.jpg);">
			<div class="container">
				<div class="title-text text-center">
					<h3>Withdraw</h3>
					<ul>
						<li><a href="/festival">home</a></li>
						<li>/</li>
						<li>Withdraw</li>
					</ul>
				</div>
			</div>
		</section>
		<!-- End Page Title-->


		<!--Schedule Section-->
		<section class="schedule-section" id="schedule-tab">
			<div class="container">
				<div class="schedule-area">
					<div class="schedule-title">
						
						
					</div>
					<div class="schedule-content clearfix">
						<b style="color: orange;">会員脱退後にはID <b style="color: #fa334f">${sessionScope.loginid}</b> で　再加入することはできず、IDとデータは復旧できません。<br> 
						   掲示板型サービスに残っている書き込みは脱退後、削除することはできません。</b>
						<br>
						<b><input type="checkbox" name="" id="check"/>&nbsp;&nbsp;&nbsp;案内事項を全て確認しており、これに同意します。</b>
						<a id="withdraw" class="theme-btn btn-style-one">脱退</a>
					</div>
				</div>
			</div>
		</section>
		<!--End Schedule Section-->


		<!--Contact Info-->
		<section class="contact-info">
			<div class="container">
				<div class="info-area">
					<div class="row">
						<div class="col-xl-4 col-md-6 col-sm-12">
							<div class="contact-info-item-one">
								<div class="icon-box">
									<i class="flaticon-placeholder"></i>
								</div>
								<div class="text">
									<p>
										184 Collins Street West <br>Victoria, United States, 8007
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-6 col-sm-12">
							<div class="contact-info-item-one">
								<div class="icon-box">
									<i class="flaticon-phone-call"></i>
								</div>
								<div class="text">
									<p>
										(1800) 123 4567 <br>(1800) 123 4568
									</p>
								</div>
							</div>
						</div>
						<div class="col-xl-4 col-md-6 col-sm-12">
							<div class="contact-info-item-one">
								<div class="icon-box">
									<i class="flaticon-e-mail-envelope"></i>
								</div>
								<div class="text">
									<p>
										<a href="#">info@wiscon.com</a> <a href="#">support@wiscon.com</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--End Contact Info-->

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
		<script>
		
		$("#withdraw").click(function(){
			
			if($('input:checkbox[id="check"]:checked').length < 1){
				alert("チェックしてください。");
				return false;
			}
			
			$.ajax({
				url: "withdraw",
				type: "get",
				success: function(){
					alert("会員脱退になりました。");
					location.href="festival";	
				},
				error: function(){alert("該当作業に失敗しました。");}
			});
		});
		</script>

	</div>
</body>
</html>
