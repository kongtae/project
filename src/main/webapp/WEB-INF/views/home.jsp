<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="UTF-8">

	<title>축제사이트</title>
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
                        <li><span class="icon fa fa-envelope"></span><strong>Email</strong> info@wiscon.com</li>
                        <li><span class="icon fa fa-map-marker"></span><strong>Location</strong> 49 BelWest Lane, TX 26098</li>
                    </ul>
                </div>
                <!--Top Right-->
                <div class="top-right">
                    <!--Social Box-->
                   <ul class="social-box">
                        <c:if test="${seccionScope.userid==null}">
                           <li><a href="member/loginForm">회원가입</a></li>
                           <li><a href="loginForm">로그인</a></li>
<!--                         <li class="share">Connect With Us</li> -->
<!--                         <li><a href="#"><span class="fab fa-facebook"></span></a></li> -->
<!--                         <li><a href="#"><span class="fab fa-linkedin"></span></a></li> -->
<!--                         <li><a href="#"><span class="fab fa-vimeo"></span></a></li> -->
<!--                         <li><a href="#"><span class="fab fa-google-plus"></span></a></li> -->
<!--                         <li><a href="#"><span class="fab fa-twitter"></span></a></li> -->
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
                    <div class="logo"><a href="index.html"><img src="images/logo.png" alt="" title=""></a></div>
                </div>
                
                <div class="nav-outer clearfix">
                
                    <!-- Main Menu -->
                    <nav class="main-menu navbar-expand-md">
                        <div class="navbar-header">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>

                        <div class="navbar-collapse collapse clearfix" id="navbarSupportedContent">
                            <ul class="navigation clearfix">
                                <li class="current dropdown"><a href="#">----</a>
                                    <ul>
                                        <li><a href="index.html">Home Page 01</a></li>
                                        <li><a href="index-2.html">Home Page 02</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Home</a>
                                    <ul>
                                        <li><a href="about-us.html">About Us</a></li>
                                        <li><a href="speakers.html">Speakers</a></li>
                                        <li><a href="speakers-details.html">Speaker Details</a></li>
                                        <li><a href="error-page.html">Error Page</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">List</a>
                                    <ul>
                                        <li><a href="shedule.html">Shedule</a></li>
                                        <li><a href="shedule-details.html">Shedule Details</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Calendar</a>
                                    <ul>
                                        <li><a href="calendar">Calendar</a></li>
                                        <li><a href="sponsor-details.html">Sponsors Details</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Map</a>
                                    <ul>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="blog-single.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact-us.html">Board</a></li>
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
                <a href="index.html" class="img-responsive"><img src="images/logo.png" alt="" title=""></a>
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
                            <li class="current dropdown"><a href="#">----</a>
                                <ul>
                                    <li><a href="index.html">Home Page 01</a></li>
                                    <li><a href="index-2.html">Home Page 02</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Home</a>
                                <ul>
                                    <li><a href="about-us.html">About Us</a></li>
                                    <li><a href="speakers.html">Speakers</a></li>
                                    <li><a href="speakers-details.html">Speaker Details</a></li>
                                    <li><a href="error-page.html">Error Page</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">List</a>
                                <ul>
                                    <li><a href="shedule.html">Shedule</a></li>
                                    <li><a href="shedule-details.html">Shedule Details</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Calendar</a>
                                <ul>
                                    <li><a href="calendar">Calendar</a></li>
                                    <li><a href="sponsor-details.html">Sponsors Details</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Map</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-single.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">Board</a></li>
                        </ul>
                    </div>
                </nav><!-- Main Menu End-->
            </div>
            
        </div>
    </div>
    <!--End Sticky Header-->

</header>
<!--End Main Header -->

<!--Main Slider-->
<section class="main-slider">
    
    <div class="main-slider-carousel owl-carousel owl-theme">
        
        <div class="slide" style="background-image:url(images/main-slider/image-1.jpg)">
            <div class="container">
                <div class="content">
                    <h3>Digital Conference 2018</h3>
                    <h2>The New Era of Technical <br> Companies</h2>
                    <div class="text">18 - 21 DECEMBER, 2017, Alaska</div>
                    <div class="link-box">
                        <a href="#" class="theme-btn btn-style-two">Official Site</a> <a href="#" class="theme-btn btn-style-three">View Details</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="slide" style="background-image:url(images/main-slider/image-2.jpg)">
            <div class="container">
                <div class="content">
                    <h3>Digital Conference 2018</h3>
                    <h2>The New Era of Technical <br> Companies</h2>
                    <div class="text">18 - 21 DECEMBER, 2017, Alaska</div>
                    <div class="link-box">
                        <a href="#" class="theme-btn btn-style-two">Official Site</a> <a href="#" class="theme-btn btn-style-three">View Details</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="slide" style="background-image:url(images/main-slider/image-3.jpg)">
            <div class="container">
                <div class="content">
                    <h3>Digital Conference 2018</h3>
                    <h2>The New Era of Technical <br> Companies</h2>
                    <div class="text">18 - 21 DECEMBER, 2017, Alaska</div>
                    <div class="link-box">
                        <a href="#" class="theme-btn btn-style-two">Official Site</a> <a href="#" class="theme-btn btn-style-three">View Details</a>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</section>
<!--End Main Slider-->



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
                <li><a href="index.html">----</a></li>
                <li><a href="about-us.html">----</a></li>
                <li><a href="speakers.html">Home</a></li>
                <li><a href="#">List</a></li>
                <li><a href="shedule.html">Calendar</a></li>
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
            Copyright &copy; <a href="#">World Festival</a> 2019. All Rights Reserved
        </div>
    </div>
</section>
<!--End Footer Bottom Section-->

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>


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