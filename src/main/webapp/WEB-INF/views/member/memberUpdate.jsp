<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FESPEDIA | Update Page</title>


<!-- responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

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
<!-- iCheck -->
<link rel="stylesheet" href="plugins/iCheck/square/blue.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet"
	href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- AdminLTE Skins. Choose a skin from the css/skins
      folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>
</style>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.js"></script>
<script>

	var originalFileName = "";
	var password = "";
	
	$(function() {
		select();
		$("#imagePreview").on('change',function(){
			//미리보기함수
			previewImage(this);
			//Data 전송하기
		});
	});
	
	
	function previewImage(input){
		//이미지를 선택하면
		if(input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#image').attr('src',e.target.result) //속성 변경
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function select() {

		$.ajax({
			url : "select",
			type : "post",
			success : function(result) {
				$('#userid').val(result.userid);
				$('#username').val(result.username);
				$('#email').val(result.email);
				password = result.userpwd;
				if(result.originalFileName != null) {
					originalFileName = "resources/images/userimage/" +result.originalFileName;
				$('#image').attr("src", originalFileName);
				}
			},
			error : function() {
				alert("실패");
			}
		});
	}

	
	function updateMember() {
		formcheck();
		var form = $("#updateForm")[0];
		var formData = new FormData(form);

		$.ajax({
			url:"updateMember",
			data:formData,
			type:"post",
			contentType:false,
			processData:false,
			success: function() {
				location.href ="memberPage";
			},
			error: function() {
				alert("投稿ERROR");
			}
		});
	}
	

	function formcheck() {
		var username = $('#username').val();
		var useremail = $('#email').val();
		var userpwd = $('#userpwd').val();
		var new_userpwd = $('#new_userpwd').val();
		var check_new_userpwd = $('#check_new_userpwd').val();
		var icheck = $('#icheck');
		
		//패스워드 길이 유효성
		if(userpwd.length == 0) {
			if(new_userpwd.length != 0){
				alert("現在パスワードを入力してください。");
				return false;
			}
			if(check_new_userpwd.length != 0){
				alert("現在パスワードを入力してください。");
				return false;
			}
		}
		
		if (userpwd.length != 0) {
			if (userpwd != password) {
				alert("現在パスワードと新しいパスワードが異なります。");
				return false;
			}
			if (new_userpwd.length == 0) {
				alert("新しいパスワードを再び入力してください。");
				return false;
			}
			if (check_new_userpwd.length == 0) {
				alert("新しいパスワードを再び入力してください。");
				return false;
			}
			if (new_userpwd != check_new_userpwd) {
				alert("パスワードが間違っています。 もう一度入力してください。");
				$('#check_new_userpwd').focus();
				return false;
			}
			if(userpwd.length<3||userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
			if(new_userpwd.length<3||new_userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
			if(check_new_userpwd.length<3||check_new_userpwd.length>10){
				alert("パスワードが間違っています。 もう一度入力してください。");
				return false;
			}
		}
		return true;
	};
</script>
</head>
<body class="hold-transition register-page">

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
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

							<div class="navbar-collapse collapse clearfix"
								id="navbarSupportedContent">
								<ul class="navigation clearfix">
									<li class="dropdown"><a href="/festival">Home</a></li>
									<li class="dropdown"><a href="#">List</a>
										<ul>
											<li><a href="listForm">List</a></li>
											<li><a href="listDetailForm">List Details</a></li>
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

	<div class="register-box">
		<div class="register-logo">
			<h1>
				<a href="/festival"><b>FES</b>PEDIA</a>
			</h1>
		</div>

		<div class="register-box-body">
			<p class="login-box-msg">Update a Member Information</p>

			<form action="updateMember" id="updateForm" method="post" enctype="multipart/form-data">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" id="userid" name="userid"
						readonly="readonly"> <span
						class="glyphicon glyphicon-ok form-control-feedback" id="ok"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="username"
						id="username"> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="email" class="form-control" name="email" id="email">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="userpwd"
						id="userpwd" placeholder="現在のパスワード"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="new_userpwd"
						id="new_userpwd" placeholder="新しいパスワード"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" id="check_new_userpwd"
						placeholder="新しいパスワード確認"> <span
						class="glyphicon glyphicon-log-in form-control-feedback"></span>
				</div>
				<div>
					<input type="file" id="imagePreview" name="uploadFileName" value="사진첨부"
						accept="image/png,image/jpg,image/gif,image/jpeg"> 
						<img id="image" src="images/guest.png">
				</div>

				<div class="row">
					<div class="col-xs-8"></div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button id="update"
							class="btn btn-primary btn-block btn-flat" onclick="updateMember()">修正</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

		</div>
		<!-- /.form-box -->
	</div>
	<!-- /.register-box -->

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
									info@wiscon.com <br>support@wiscon.com
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

	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- iCheck -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<!-- bootstrap datepicker -->
	<script
		src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' /* optional */
			});
			//Date picker
			$('#datepicker').datepicker({
				autoclose : true
			})
		});
	</script>
</body>
</html>
