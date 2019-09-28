<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>FESPEDIA</title>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>



	<div class="boxed_wrapper">

		<!--Start Preloader -->
		<div class="preloader"></div>
		<!--End Preloader -->
		<div class="sdfasd"></div>

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
									info@wiscon.com</li>
								<li><span class="icon fa fa-map-marker"></span><strong>Location</strong>
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
										<li class="dropdown"><a href="/festival">Home</a></li>
									<li class="dropdown"><a href="listForm">List</a>
										<ul>
											<li><a href="listForm">List</a></li>
											<li><a href="listDetailForm">List Details</a></li>
										</ul></li>
									<li class="dropdown"><a href="Calendar">Calendar</a>
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
								<a href="#" class="theme-btn btn-style-one">Search Festival</a>
							</div>

							<!--Search Box Outer-->
							<!--  
                    <div class="search-box-outer">
                        <div class="dropdown">
                            <button class="search-box-btn dropdown-toggle" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-search"></span></button>
                            <ul class="dropdown-menu pull-right search-panel" aria-labelledby="dropdownMenu3">
                                <li class="panel-outer">
                                    <div class="form-container">
                                        <form method="post" action="blog.html">
                                            <div class="form-group">
                                                <input type="search" name="field-name" value="" placeholder="Search Here" required>
                                                <button type="submit" class="search-btn"><span class="fa fa-search"></span></button>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div> 
                    -->

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
									<li class="dropdown"><a href="/festival">Home</a></li>
									<li class="dropdown"><a href="#">List</a>
										<ul>
											<li><a href="listForm">List</a></li>
											<li><a href="listDetailForm">List Details</a></li>
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
						<!-- Main Menu End-->
					</div>

				</div>
			</div>
			<!--End Sticky Header-->

		</header>
		<!--End Main Header -->

		<!--Main Slider-->
		<section class="main-slider">

			<div class="main-slider-carousel owl-carousel owl-theme">

				<div id="info0" class="slide"></div>

				<div id="info1" class="slide"></div>

				<div id="info2" class="slide"></div>

			</div>
		</section>
		<!--End Main Slider-->



		<!-- Main Footer-->
		<footer class="main-footer"
			style="background: url(images/background/footer.jpg);">
			<div class="container">
				<div class="footer-area text-center">
					<div class="footer-logo">
						<figure>
							<a href="tourAPI"><img src="images/logo-2.png" alt=""></a>
						</figure>
					</div>
					<ul class="footer-menu">
						<li><a href="/festival">Home</a></li>
						<li><a href="listForm">List</a></li>
						<li><a href="calendar">Calendar</a></li>
						<li><a href="sponsor.html">Map</a></li>
						<li><a href="blog.html">Board</a></li>
						<li><a href="contact-us.html">Search Festival</a></li>
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
					Copyright &copy; <a href="#">World Festival</a> 2019. All Rights
					Reserved
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
		<script>
		
		$(function() {
			//selectMain();
			func(selectMain);
		});
		
		function func(callback) {
		    console.log( typeof (callback) );
		    // 넘어온 함수 실행하기
		    callback();
		}
		 
		var aFunc = function () {
		    console.log("익명함수 호출됨...")
		}
		 


		function selectMain() {
			$.ajax({
				url: 'selectMain',
				type: 'post',
				success: function(data){
					alert("성공");
					$(data).each(function(index, item){
						var image = item.originalFileName;
						var start = item.startEvent;
						var end = item.endEvent;
						var adress = item.adress;
						var title = item.title;
						
						if(image.charAt(0)=='h'){
							imageurl = image;
						}else {
							var a= image.indexOf(',');
							imageurl = "resources/images/userimage/"; 
							imageurl += image.substring(0,a);
							
						}
						$("#info"+index).attr('style', 'background-image: url('+imageurl+')');
						alert('#info'+index+"");
						$("#info"+index).append("<div class='container'><div class='content'>"+								
							"<h3>"+start+" - "+end+"</h3><h2>"+title+"</h2>"+
							"<div class='text'>"+adress+"</div>"+
							"<div class='link-box'><a href='map' class='theme-btn btn-style-two'>Map</a>"+
							"<a href='++' class='theme-btn btn-style-three'>View Details</a></div></div></div>");
					});
				},
				error: function(){
					alert("실패");
				}
			});
		}
		</script>


	</div>
</body>
</html>