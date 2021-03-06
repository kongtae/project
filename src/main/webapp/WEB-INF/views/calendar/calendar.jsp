<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>FESPEDIA | カレンダー</title>
<!-- responsive meta -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- For IE -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- master stylesheet -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">

<!-- Favicon -->
<link rel="shortcut icon" href="images/f.png" type="image/x-icon">
<link rel="icon" href="images/f.png" type="image/x-icon">


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
<!-- fullCalendar -->
<link rel="stylesheet"
	href="bower_components/fullcalendar/dist/fullcalendar.min.css">
<link rel="stylesheet"
	href="bower_components/fullcalendar/dist/fullcalendar.print.min.css"
	media="print">
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
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	<link href="https://fonts.googleapis.com/css?family=M+PLUS+1p|M+PLUS+Rounded+1c&display=swap" rel="stylesheet">
<style>

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
	margin-top: 85%;
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
</style>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
$(function () {
    $('#home1').on('click', function(){
    	location.href = "festival";
    });
    $('#home2').on('click', function(){
    	location.href = "festival";
    });
 });
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- <div class="boxed_wrapper"> -->
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
							<a href="festival"><img src="images/fespedia.png" alt="" title=""></a>
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
									<li class="dropdown" id="home1"><a href="">Home</a></li>
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
		
		<!--Sticky Header-->
			<div class="sticky-header stricky">
				<div class="container clearfix">
					<!--Logo-->
					<div class="logo float-left" style="width: 179px; height: 80px; background: white;" >
						<a href="festival" class="img-responsive"><img src="images/fespedia.png" alt="" title=""></a>
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
									<li class="dropdown" id="home2"><a href="">HOME</a></li>
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
						<!-- Main Menu End-->
					</div>

				</div>
			</div>
			<!--End Sticky Header-->
		
		
	</header>
	<!--End Main Header -->
	
	<!-- Page Title-->
	<section class="page-title" style="background: url(resources/images/userimage/Holi.jpg); margin-top: 6%;">
    	<div class="container">
        	<div class="title-text text-center">
           	 <h3>カレンダー</h3>
           	 <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="calendar">calendar</a></li>
            </ul>
        	</div>                
   		</div>
	</section>
	<!-- End Page Title-->

	<!-- Calendar Main content -->
	<section class="content">
		<div class="row">
			<!-- /.col -->
			<div class="col-md-9">
				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->

		<!-- Main Footer-->
		<footer class="main-footer"
			>
			<div class="container">
				<div class="footer-area text-center">
					<div class="footer-logo">
						<figure>
						<c:if test="${sessionScope.adminid != null}">
							<a href="tourAPI"><img src="images/fespedia_w.png" alt=""></a>
						</c:if>
						<c:if test="${sessionScope.adminid == null}">
							<a href=""><img src="images/fespedia_w.png" alt=""></a>
						</c:if>
						</figure>
					</div>
            <ul class="footer-menu">
                <li><a href="">Home</a></li>
                <li><a href="listForm">List</a></li>
                <li><a href="calendar">Calendar</a></li>
                <li><a href="map">Map</a></li>
                <li><a href="boardList">Board</a></li>
				<li><a href="searchFestival">Search Festival</a></li>
            </ul>
					<ul class="social-links">
						<li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
						<li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
						<li><a href="https://vine.co/"><i class="fab fa-vine"></i></a></li>
						<li><a href="https://kr.linkedin.com/"><i class="fab fa-linkedin-in"></i></a></li>
						<li><a href="https://www.pinterest.co.kr/"><i class="fab fa-pinterest"></i></a></li>
						<li><a href="https://www.instagram.com"><i class="fab fa-instagram"></i></a></li>
					</ul>
				</div>
			</div>
		</footer>
		<!--End Main Footer-->

		<!--Footer Bottom Section-->
		<section class="footer-bottom">
			<div class="container">
				<div class="copyright-text text-center">
					Copyright &copy; <a href="#">FESPEDIA</a> 2019. All Rights
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

	<!-- fullCalendar -->
	<script src="bower_components/moment/moment.js"></script>
	<script src="bower_components/fullcalendar/dist/fullcalendar.min.js"></script>
	<!-- Page specific script -->

	<script>
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()
	  $('#calendar').fullCalendar({
		      header    : {
		        left  : 'prev,next today',
		        center: 'title',
		        right : 'month,agendaWeek,agendaDay'
		      },
		      buttonText: {
		        today: 'today',
		        month: 'month',
		        week : 'week',
		        day  : 'day'
		      },	
      		      //랜덤 기본 이벤트
      		    /*   events    : [
      		    	   
      		    	  
      		        {
      		          title          : 'Birthday Party',
      		          start          : new Date(y, m, d + 1, 19, 0),
      		          end            : new Date(y, m, d + 1, 22, 30),
      		          allDay         : false,
      		          backgroundColor: '#00a65a', //Success (green)
      		          borderColor    : '#00a65a' //Success (green)
      		        },
      		        {
      		          title          : 'Click for Google',
      		          start          : new Date(y, m, 28),
      		          end            : new Date(y, m, 29),
      		          url            : 'http://google.com/',
      		          backgroundColor: '#3c8dbc', //Primary (light-blue)
      		          borderColor    : '#3c8dbc' //Primary (light-blue)
      		        }  
      		      ]
      		    }) */

     events: function (start, end, timezone, callback) {
         $.ajax({
          url: 'selectCalendar',
          type: "post",
          success: function(data){
              var events = [];
              $.each(data, function(i, obj) {
            	  var colors = ['#dd1e2f', '#06a2cb', '#218559', '#d0c6b1', 
            		  '#88001b', '#ff7f27', '#3f48cc', '#b97a56', '#00a8f3', 
            		  '#0ed145', '#563c86', '#f3008e', '#e34a39',
            		  '#241984', '#57d2b7', '#595d91', '#f4050e', '#fbc2d4'];
					var color = colors[Math.floor(Math.random() * colors.length)];
					var url = "listDetailGO?mainBoardNum="+obj.mainBoardNum;
            	 
               events.push({title: obj.title, start: obj.startEvent, end: obj.endEvent, url: url, color: color});
           });
             	console.log(events);
              callback(events);
          },
          error : function() {
      			alert("マップを読み込めませんでした。");
      		}
         });
     }
    });
    
    setTimeout(function(){
    	$('.fc-time').empty(); 
    	}, 500);  
    	
    	$(document).ready(function(){
    		$('.fc-time').empty();
    		});
</script>
</body>
</html>
