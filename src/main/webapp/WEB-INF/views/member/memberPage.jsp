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
<link rel="icon" href="images/f.png" type="image/x-icon">
<link rel="shortcut icon" href="images/f.png" type="image/x-icon">

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
.content-wrapper {
	width: 100%
}
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
   $('#home1').on('click', function(){
   	location.href = "festival";
   });
   $('#home2').on('click', function(){
   	location.href = "festival";
   });
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
                           SC.IT@MASTER.COM</li>
                        <li><span class="icon fa fa-map-marker"
                           style="font-family: 'Font Awesome 5 Free'; font-weight: 900;"></span><strong>Location</strong>
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
                     <div class="logo" style="width: 179px; height: 80px;">
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
                              <span class="icon-bar"></span> <span class="icon-bar"></span>
                              <span class="icon-bar"></span>
                           </button>
                        </div>

                        <div class="navbar-collapse collapse clearfix"
                           id="navbarSupportedContent">
                           <ul class="navigation clearfix">
                              <li class="dropdown" id="home1"><a href="festival">Home</a></li>
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
            <div class="logo float-left" style="width: 149px; height: 80px"  >
                <a href="festival" class="img-responsive"><img src="images/fespedia.png" alt="" title=""></a>
            </div>
            
            <!--Right Col-->
            <div class="right-col float-right">
                <!-- Main Menu -->
                <nav class="main-menu navbar-expand-md">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent1" aria-controls="navbarSupportedContent1" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent1">
                     <ul class="navigation clearfix">
                        <li class="dropdown" id="home2"><a href="festival">Home</a></li>
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
                </nav><!-- Main Menu End-->
            </div>
            
        </div>
    </div>
    <!--End Sticky Header-->

</header>
<!--End Main Header -->



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
                           src="images/userimage/ico_login.png" id="profileImage" alt="User profile picture">
<!-- 
                        <h3 class="profile-username text-center">Nina Mcintire</h3>

                        <p class="text-muted text-center">Software Engineer</p>

                        <ul class="list-group list-group-unbordered">
                           <li class="list-group-item"><b>Followers</b> <a
                              class="pull-right">1,322</a></li>
                           <li class="list-group-item"><b>Following</b> <a
                              class="pull-right">543</a></li>
                           <li class="list-group-item"><b>Friends</b> <a
                              class="pull-right">13,287</a></li>
                        </ul> -->
                        <a href="memberUpdate" class="btn btn-primary btn-block"><b>Update</b></a>
                        <a href="WithdrawForm" class="btn btn-primary btn-block"><b>Withdraw</b></a>
                     </div>
                     <!-- /.box-body -->
                  </div>
                  <!-- /.box -->

                  <!-- About Me Box -->
                  <!-- <div class="box box-primary">
                     <div class="box-header with-border">
                        <h3 class="box-title">About Me</h3>
                     </div>
                     /.box-header
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
                     /.box-body
                  </div> -->
                  <!-- /.box -->
               </div>
					<!-- /.col -->
					<div class="col-md-9">
						<div class="box box-primary">
						<div class="nav-tabs-custom">
						<div class="tab-content">
							<div class="active tab-pane" id="activity">
								<!-- Post -->
								<c:forEach var="result" items="${list}" varStatus="status"
									begin="0">
									<div class="post">
										<div>
											<span class="username"> <strong>
											TITLE:
											<a href="listDetailGO?mainBoardNum=${result.mainBoardNum}">
											<c:out value="${result.title}"></c:out></strong>
											</span>
											</a>
											<!-- <span class="description"></span> -->
										</div>
										<!-- /.user-block -->
										<p>
										FESTIVAL_INTRO : 
										<c:out value="${result.festival_intro}"></c:out>
										</p>
										COUNTRY :
										<c:out value="${result.country}"></c:out>
										<br> 祭りの期間 :
										<c:out value="${result.startEvent}"></c:out>
										~
										<c:out value="${result.endEvent}"></c:out>
										<br> ADDRESS :
										<c:out value="${result.adress}"></c:out>
									</div>
								</c:forEach>
								<!-- END timeline item -->
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



   </div>
</body>
</html>