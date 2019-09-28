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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

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
									<li class="dropdown"><a href="/festival">Home</a></li>
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
		
	</header>
	<!--End Main Header -->
	
	<!-- Page Title-->
	<section class="page-title" style="background: url(images/background/page-title-2.jpg); margin-top: 6%;">
    	<div class="container">
        	<div class="title-text text-center">
           	 <h3>Events Schedule</h3>
           	 <ul>
                <li><a href="index.html">home</a></li>
                <li>/</li>
                <li>Schedule</li>
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
	<footer class="main-footer" style="background: url(images/background/footer.jpg);">
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
				<li><a href="contact-us.html">Search Festival</a></li>
            </ul>
            <ul class="social-links">
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

	<!-- </div> -->

	<!-- <footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 2.4.18
		</div>
		<strong>Copyright &copy; 2014-2019 <a
			href="https://adminlte.io">AdminLTE</a>.
		</strong> All rights reserved.
	</footer> -->


	<!-- jQuery 3 -->
	<script src="bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
	<!-- Slimscroll -->
	<script
		src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js"></script>
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
