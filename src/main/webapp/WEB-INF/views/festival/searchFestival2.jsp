<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<title>Search Festival</title>
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
<style>
#left-box {
  float: left;
}
#right-box {
  float: right;
}
</style>
<script src="js/jquery.js"></script>
<script>
$(function(){
	random_image();	
})
	
	function random_image(){
		var myimages = new Array();
	 	myimages[0] = "resources/images/userimage/CFB53A33-A542-4820-990D-EF45DD937BA5.gif"
	  	myimages[1] = "resources/images/userimage/dislike.png";
		myimages[2] = "resources/images/userimage/dislike2.png";
	  	myimages[3] = "resources/images/userimage/externalFile.gif";
		myimages[4] = "resources/images/userimage/heart.png";
	  	myimages[5] = "resources/images/userimage/home.jpg";
		myimages[6] = "resources/images/userimage/ico_login.png";
	  	myimages[7] = "resources/images/userimage/like.png";
		myimages[8] = "resources/images/userimage/login_icon.png";
	  	myimages[9] = "resources/images/userimage/logo.png";
		myimages[10] = "resources/images/userimage/test.png";
		myimages[11] = "resources/images/userimage/달력.png";
		myimages[12] = "resources/images/userimage/세계지도.png";
		
		 var ry = Math.floor( Math.random() * (myimages.length-1) );
		 var rn = Math.floor( Math.random() * (myimages.length-1) );
		 $('#left-box').append('<img src="' + myimages[ry] + '" border=0>');
		 $('#right-box').append('<img src="' + myimages[rn] + '" border=0>');
		 
		myimages.splice(ry,1);
		myimages.splice(rn,1);		
		
		
	 }
	 
	 /* $('#left-btn').click(function(){
		alert("left");
	 });
	 
	$('#right-btn').click(function(){
		alert("right");
	 }); */

	 function leftBtn(){
		location.href = "searchFestival1?myimages="+myimages; 
	 }
	 
 	function rightBtn(){
 		location.href = "searchFestival1?myimages="+myimages;
	 }
	 
</script>
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
		</header>
		<!-- Page Title-->
		<section class="page-title"
			style="background: url(images/background/page-title-2.jpg);">
			<div class="container">
				<div class="title-text text-center">
					<h3>Search Festival</h3>
					<ul>
						<li><a href="/festval">home</a></li>
						<li>/</li>
						<li>Search Festival</li>
					</ul>
				</div>
			</div>
		</section>
		<!-- End Page Title-->
		<div class="container">
			<div id="left-box">
				<div class="title-text text-center">
					<h3><a href="javascript:leftBtn();">Search Festival</a></h3>
				</div>
			</div>
			<div id="right-box">
				<div class="title-text text-center">
					<h3><a href="javascript:rightBtn();">Search Festival</a></h3>
				</div>
			</div>
		</div>


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


	</div>
</body>
</html>