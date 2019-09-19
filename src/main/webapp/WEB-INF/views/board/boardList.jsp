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
<style>
	#div_icontext{
		display: flex;
		justify-content: flex-end;
		width: 83%;
	}
	#icontext{
		padding: 1.5%;
		padding-rigth: 2px;
		padding-left: 2px;
		font-family: 'Robtoto', sans-serif;
		font-size: 30px;
		color: #fa334f;
	}
</style>
    
</head>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>

$(function() {
			boardPrintAll();
		})
		
		function searchDate(value){
			var result00="startEvent";
			
			var result11 = document.getElementById("searchKeyword");
			var result22 = document.getElementById("searchItem").value;
			var result33 = document.getElementById("searchHidden");
			if(result22=="startEvent"){
				result11.setAttribute("type", "date");
				result33.setAttribute("type", "date");
				$("#insertmark").append("~");
			}
			if(result22!="startEvent"){
				result11.setAttribute("type", "text");
				result33.setAttribute("type", "hidden");
				$("#insertmark").empty();
			}

		}
		
	function selectOne(value) {
		var searchItem = $("#searchItem").val();
		var searchKeyword = $("#searchKeyword").val();
		var endEvent = $("#searchHidden").val();
		
		if(searchItem=="startEvent"){
		var a = $("#searchKeyword").val().split("-");
		var b = $("#searchHidden").val().split("-");
		if(a>b){
			alert("検索する期間を間違えて入力しました。");
			$("#searchKeyword").val("");
			$("#searchHidden").val("");
			return false;
		}
		}
		
		$.ajax({
			type:'GET',
			url : 'selectOne',					
			data: {'searchItem':searchItem,'searchKeyword':searchKeyword,'endEvent':endEvent },
			dataType: 'json',
			success : output,
			error: function() {
				alert("리스트 불러오기 실패");
			}
		})
		
	}	
	function boardPrintAll() {
		
		$.ajax({
			type:'GET',
			url : 'boardPrintAll',
			dataType: 'json',
			success : output,
			error: function() {
				alert("리스트 불러오기 실패");
			}
		})
	}
	function output(result) {
		var context = '';
		$.each(result,function(index,item){
		context += "<tr><td class='srial'>"+item.mainBoardNum+"</td>";
		context += "<td class='Session'><a href=listDetailGO?mainBoardNum="+item.mainBoardNum+">"+item.title+"</a></td>";
		context += "<td class='Session'>"+item.userid+"조회수 HIT"+"</td>";
		context += "<td class='Session'>"+item.inputTime"등록날짜 sysdate"+"</td>"; 
		context += "<td class='Session'>"+item.adress+"조회수 HIT"+"</td></tr>";
		})
		$("#list").html(context);
		
		if(context!=''){
		$("#searchKeyword").val("");
		$("#searchHidden").val("");
		}
		
	}
	
/* 	function page() {
		var reSortColors = function($table) {
			  $('tbody tr:odd td', $table).removeClass('even').removeClass('Session').addClass('odd');
			  $('tbody tr:even td', $table).removeClass('odd').removeClass('Session').addClass('even');
			 }; */

</script>
</head>
<body>
<c:choose>
	<c:when test="${deleteResult == true}">
		<script>alert("削除に成功しました。");</script>
	</c:when>
	<c:when test="${deleteResult == false}">
		<script>alert("削除に失敗しました。");</script>
	</c:when>
</c:choose>
    
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
								<li class="dropdown"><a href="#">Board</a>
									<ul>
										<li><a href="#">Board</a></li>
									</ul></li>
							</ul>
                        </div>
                        
                    </nav>
                    
					<!--Button Box-->
					<div class="button-box">
						<a href="#" class="theme-btn btn-style-one">Search Festival</a>
					</div>
                    
                    <!--Search Box Outer-->
                   <!--  <div class="search-box-outer">
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
                    </div> -->
                    
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
								<li class="dropdown"><a href="#">Board</a>
									<ul>
										<li><a href="#">Board</a></li>
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


<!-- Page Title-->
<section class="page-title" style="background: url(images/background/page-title-2.jpg);">
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


<!--Schedule Section-->
<section class="schedule-section" id="schedule-tab">
	<div id="div_icontext">
		<h4 id="icontext"><b>投稿する</b></h4>
		<a href="insertBoard"><img src="listImages/write.png" title="投稿"></a>
	</div>
    <div class="container">
          <div class="schedule-area">
      		<div class="schedule-content clearfix">
			            <div class="inner-box  table-responsive">      
				<form action="searchList" method="get">
					<table><tr><td>
					<select name="searchItem" id="searchItem" onchange="searchDate(this)">
					<option value="userid" <c:if test="${'userid'==searchItem}">selected</c:if>>
					ユーザー名
					</option>
					<option value="title" <c:if test="${'title'==searchItem}">selected</c:if>>
					タイトル
					</option>
					<option value="country"<c:if test="${'country'==searchItem}">selected</c:if>>
					国家
					</option>
					<option value="startEvent"<c:if test="${'startEvent'==searchItem}">selected</c:if>>
					期間
					</option>
					</select>
					</td>
					<td><input type="text" name="searchKeyword" id="searchKeyword"></td>
					<td id="insertmark"></td>
					<td><input type="hidden" name="endEvent" id="searchHidden">
					<input type="button" value="検索" onclick="selectOne(this)">	
					</td></tr>
					</table>
				</form>           
			            <div class="inner-box  table-responsive"> 
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="srial">#</th>
                                    <th class="session">タイトル</th>
                                    <th class="time">ユーザー名</th>
                                    <th class="speakers">投稿時間</th>
                                    <th class="venue">HIT</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="table table-hover"></tbody> 
                            
                          </table>
                            
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
