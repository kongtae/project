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
                        <li><span class="icon fa fa-envelope"></span><strong>Email</strong> info@wiscon.com</li>
                        <li><span class="icon fa fa-map-marker"></span><strong>Location</strong> 49 BelWest Lane, TX 26098</li>
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
                    <div class="logo"><a href="/festival"><img src="images/logo.png" alt="" title=""></a></div>
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
                                <li class="dropdown"><a href="#">Home</a>
                                    <ul>
                                        <li><a href="index.html">Home Page 01</a></li>
                                        <li><a href="index-2.html">Home Page 02</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">About</a>
                                    <ul>
                                        <li><a href="about-us.html">About Us</a></li>
                                        <li><a href="speakers.html">Speakers</a></li>
                                        <li><a href="speakers-details.html">Speaker Details</a></li>
                                        <li><a href="error-page.html">Error Page</a></li>
                                    </ul>
                                </li>
                                <li class="current dropdown"><a href="#">Shedule</a>
                                    <ul>
                                        <li><a href="shedule.html">Shedule</a></li>
                                        <li><a href="shedule-details.html">Shedule Details</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Sponsors</a>
                                    <ul>
                                        <li><a href="sponsor.html">Sponsors</a></li>
                                        <li><a href="sponsor-details.html">Sponsor Details</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown"><a href="#">Blog</a>
                                    <ul>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="blog-single.html">Blog Details</a></li>
                                    </ul>
                                </li>
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
                            <li class="dropdown"><a href="#">Home</a>
                                <ul>
                                    <li><a href="index.html">Home Page 01</a></li>
                                    <li><a href="index-2.html">Home Page 02</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">About</a>
                                <ul>
                                    <li><a href="about-us.html">About Us</a></li>
                                    <li><a href="speakers.html">Speakers</a></li>
                                    <li><a href="speakers-details.html">Speaker Details</a></li>
                                    <li><a href="error-page.html">Error Page</a></li>
                                </ul>
                            </li>
                            <li class="current dropdown"><a href="#">Shedule</a>
                                <ul>
                                    <li><a href="shedule.html">Shedule</a></li>
                                    <li><a href="shedule-details.html">Shedule Details</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Sponsors</a>
                                <ul>
                                    <li><a href="sponsor.html">Sponsors</a></li>
                                    <li><a href="sponsor-details.html">Sponsor Details</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#">Blog</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-single.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">Contact us</a></li>
                        </ul>
                    </div>
                </nav><!-- Main Menu End-->
            </div>
            
        </div>
    </div>
    <!--End Sticky Header-->

</header>
<!--End Main Header -->


<!-- Page Title-->
<section class="page-title" style="background: url(images/background/page-title-2.jpg);">
    <div class="container">
        <div class="title-text text-center">
            <h3>MAP</h3>
            <ul>
                <li><a href="index.html">home</a></li>
                <li>/</li>
                <li>Map</li>
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
                <div class="item active" data-tab-name="day-one">
                    <div class="item-text">
                        <h6>DAY 1</h6>
                        <span>5 jan, 2018</span>
                    </div>
                </div>
                <div class="item" data-tab-name="day-two">
                    <div class="item-text">
                        <h6>DAY 2</h6>
                        <span>15 jan, 2018</span>
                    </div>                                            
                </div>
                <div class="item" data-tab-name="day-three">
                    <div class="item-text">
                        <h6>DAY 3</h6>
                        <span>18 jan, 2018</span>
                    </div>                                            
                </div>    
            </div>
            <div class="schedule-content clearfix">
                <div id="day-one">
                    <div class="inner-box  table-responsive">
						<table>                
			   				<tr>
								<td class="right" colspan="5">
									<a href="insertFestival"><img src="/resources/listImages/write.png"></a>
								</td>
							</tr>
			            </table>        
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">Session</th>
                                    <th class="speakers">Speakers</th>
                                    <th class="time">Time</th>
                                    <th class="venue">Venue</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="srial">01</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Introduction to UI/Ux
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-1.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 AM
                                    </td>
                                    <td class="venue">Hall 1</td>
                                </tr>
                                <tr>
                                    <td class="srial">02</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-2.jpg" alt="">
                                        </figure>
                                        <h6>Jhone Doe</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        10:00 AM
                                    </td>
                                    <td class="venue">Hall 2</td>
                                </tr>
                                <tr>
                                    <td class="srial">03</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        WP Plugins Installation
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-3.jpg" alt="">
                                        </figure>
                                        <h6>Margarita Rose</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        11:00 AM
                                    </td>
                                    <td class="venue">Hall 3</td>
                                </tr>
                                <tr>
                                    <td class="srial">04</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basic GO Language
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-4.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        12:00 PM
                                    </td>
                                    <td class="venue">Hall 4</td>
                                </tr>
                                <tr>
                                    <td class="srial">05</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Business Analysis
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-5.jpg" alt="">
                                        </figure>
                                        <h6>Donald Pump</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        01:00 PM
                                    </td>
                                    <td class="venue">Hall 5</td>
                                </tr>
                                <tr>
                                    <td class="srial">06</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Wp Requirements
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-6.jpg" alt="">
                                        </figure>
                                        <h6>Lee Mun</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        04:00 PM
                                    </td>
                                    <td class="venue">Hall 6</td>
                                </tr>
                                <tr>
                                    <td class="srial">07</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-7.jpg" alt="">
                                        </figure>
                                        <h6>Baily Lio</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        07:00 PM
                                    </td>
                                    <td class="venue">Hall 7</td>
                                </tr>
                                <tr>
                                    <td class="srial">08</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Plugin Development
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-8.jpg" alt="">
                                        </figure>
                                        <h6>Henri Mong</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 PM
                                    </td>
                                    <td class="venue">Hall 8</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="day-two">
                    <div class="inner-box  table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">Session</th>
                                    <th class="speakers">Speakers</th>
                                    <th class="time">Time</th>
                                    <th class="venue">Venue</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="srial">01</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Introduction to UI/Ux
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-1.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 AM
                                    </td>
                                    <td class="venue">Hall 1</td>
                                </tr>
                                <tr>
                                    <td class="srial">02</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-2.jpg" alt="">
                                        </figure>
                                        <h6>Jhone Doe</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        10:00 AM
                                    </td>
                                    <td class="venue">Hall 2</td>
                                </tr>
                                <tr>
                                    <td class="srial">03</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        WP Plugins Installation
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-3.jpg" alt="">
                                        </figure>
                                        <h6>Margarita Rose</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        11:00 AM
                                    </td>
                                    <td class="venue">Hall 3</td>
                                </tr>
                                <tr>
                                    <td class="srial">04</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basic GO Language
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-4.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        12:00 PM
                                    </td>
                                    <td class="venue">Hall 4</td>
                                </tr>
                                <tr>
                                    <td class="srial">05</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Business Analysis
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-5.jpg" alt="">
                                        </figure>
                                        <h6>Donald Pump</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        01:00 PM
                                    </td>
                                    <td class="venue">Hall 5</td>
                                </tr>
                                <tr>
                                    <td class="srial">06</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Wp Requirements
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-6.jpg" alt="">
                                        </figure>
                                        <h6>Lee Mun</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        04:00 PM
                                    </td>
                                    <td class="venue">Hall 6</td>
                                </tr>
                                <tr>
                                    <td class="srial">07</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-7.jpg" alt="">
                                        </figure>
                                        <h6>Baily Lio</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        07:00 PM
                                    </td>
                                    <td class="venue">Hall 7</td>
                                </tr>
                                <tr>
                                    <td class="srial">08</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Plugin Development
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-8.jpg" alt="">
                                        </figure>
                                        <h6>Henri Mong</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 PM
                                    </td>
                                    <td class="venue">Hall 8</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="day-three">
                    <div class="inner-box  table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">Session</th>
                                    <th class="speakers">Speakers</th>
                                    <th class="time">Time</th>
                                    <th class="venue">Venue</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="srial">01</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Introduction to UI/Ux
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-1.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 AM
                                    </td>
                                    <td class="venue">Hall 1</td>
                                </tr>
                                <tr>
                                    <td class="srial">02</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-2.jpg" alt="">
                                        </figure>
                                        <h6>Jhone Doe</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        10:00 AM
                                    </td>
                                    <td class="venue">Hall 2</td>
                                </tr>
                                <tr>
                                    <td class="srial">03</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        WP Plugins Installation
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-3.jpg" alt="">
                                        </figure>
                                        <h6>Margarita Rose</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        11:00 AM
                                    </td>
                                    <td class="venue">Hall 3</td>
                                </tr>
                                <tr>
                                    <td class="srial">04</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basic GO Language
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-4.jpg" alt="">
                                        </figure>
                                        <h6>Henry Keen</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        12:00 PM
                                    </td>
                                    <td class="venue">Hall 4</td>
                                </tr>
                                <tr>
                                    <td class="srial">05</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Business Analysis
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-5.jpg" alt="">
                                        </figure>
                                        <h6>Donald Pump</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        01:00 PM
                                    </td>
                                    <td class="venue">Hall 5</td>
                                </tr>
                                <tr>
                                    <td class="srial">06</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Wp Requirements
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-6.jpg" alt="">
                                        </figure>
                                        <h6>Lee Mun</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        04:00 PM
                                    </td>
                                    <td class="venue">Hall 6</td>
                                </tr>
                                <tr>
                                    <td class="srial">07</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Basics WordPress
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-7.jpg" alt="">
                                        </figure>
                                        <h6>Baily Lio</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        07:00 PM
                                    </td>
                                    <td class="venue">Hall 7</td>
                                </tr>
                                <tr>
                                    <td class="srial">08</td>
                                    <td class="session">
                                        <i class="fas fa-caret-right"></i>
                                        Plugin Development
                                    </td>
                                    <td class="speakers">
                                        <figure>
                                            <img src="images/resources/schedule-8.jpg" alt="">
                                        </figure>
                                        <h6>Henri Mong</h6>
                                    </td>
                                    <td class="time">
                                        <i class="far fa-clock"></i>
                                        09:00 PM
                                    </td>
                                    <td class="venue">Hall 8</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
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
                            <p>184 Collins Street West <br>Victoria, United States, 8007</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-sm-12">
                    <div class="contact-info-item-one">
                        <div class="icon-box">
                            <i class="flaticon-phone-call"></i>
                        </div>
                        <div class="text">
                            <p>(1800) 123 4567 <br>(1800) 123 4568</p>
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
                                <a href="#">info@wiscon.com</a>
                                <a href="#">support@wiscon.com</a>
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
<footer class="main-footer" style="background: url(images/background/footer.jpg);">
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

<!--Google Map-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBevTAR-V2fDy9gQsQn1xNHBPH2D36kck0"></script>
<script src="js/map-script.js"></script>
<!--End Google Map APi-->


</div>
</body>
</html>
