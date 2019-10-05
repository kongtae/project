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

<!-- <link href="css/paging.css" rel="stylesheet" type="text/css" media="all"> -->

<style>
.infoboxes article {
	color: #191919;
	background-color: rgba(255, 255, 255, .65);
}

.infoboxes article:hover {
	background-color: #FFFFFF;
}

.infoboxes article .fa {
	color: #FFFFFF;
	background-color: #CF4845;
}

.pagination {
	display: block;
	width: 100%;
	text-align: center;
	clear: both;
}

.pagination li {
	display: inline-block;
	margin: 0 2px 0 0;
}

.pagination li:last-child {
	margin-right: 0;
}

.pagination a, .pagination strong {
	display: block;
	padding: 8px 11px;
	border: 1px solid;
	background-clip: padding-box;
	font-weight: normal;
	color: #fa334f;
}

#div_icontext {
	display: flex;
	justify-content: flex-end;
	width: 83%;
}

#icontext {
	padding: 1.5%;
	padding-rigth: 2px;
	padding-left: 2px;
	font-family: 'Robtoto', sans-serif;
	font-size: 30px;
	color: #fa334f;
}
.btn-tt {
    ont-size: 14px;
    font-weight: 700;
    color: #ffffff;
    line-height: 26px;
    background: #fa334f;
    padding: 5px 10px;
    border-radius: 2px;
    border: 1px solid #fa334f;
    text-transform: uppercase;
    /* font-family: 'Poppins', sans-serif; */
    letter-spacing: 1px;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="js/jquery.js"></script>
<script>

	$(function() {
		$('#listSearch').on('click', function() {
			tourAPIselect();
		})
		$("#insertBtn").on('click', function() {
			mainBoardNumSelect();
		})
	})
		var tour = [];

	function tourAPIselect() {
		
		$('#count').empty();
		
		var startEvent = $('#startEvent').val();
		var endEvent = $('#endEvent').val();
		
		var a = startEvent.split("-");
		var b = endEvent.split("-");
		if(a>b){
			alert("検索する期間を間違えて入力しました。");
			$('#startEvent').val("");
			$('#endEvent').val("");
			return false;
		}
		if (startEvent == null || endEvent == "") {
			startEvent = " ";
			alert("始まる日を入力してください。");
			return false;
		}
		if (endEvent == null || endEvent == "") {
			endEvent = " ";
			alert("終わる日を入力してください。");
			return false;
		}
		
		$.ajax({
			type : 'GET',
			url : 'tourAPIselect',
			dataType : 'json',
			data : { 
				"startEvent" : startEvent,
				"endEvent" : endEvent						
			},
			success : output,
			error : function() {
				alert("リストを読み込めませんでした。");
			}
		})
	}
	
	function output(result) {

		var context = "";
		
		var myItem = result.response.body.items.item;
		for (var i = 0; myItem.length; i++) {
			var title = myItem[i].title;
			var adress = myItem[i].addr1;
			var originalFileName = myItem[i].firstimage;
			var startEvent = myItem[i].eventstartdate;
			var endEvent = myItem[i].eventenddate;
			tour.push({
				title : title,
				adress : adress,
				originalFileName : originalFileName,
				surround_place : startEvent,
				saveFileName : endEvent
			});
			context += "<tr><td class='srial'>"+ (i+1) + "</td>";
			context += "<td class='Session'><a href=listDetailGO?mainBoardNum="+ i + ">" + title + "</a></td>";
			context += "<td class='Session'><img src=" + originalFileName + "></td>";
			context += "<td class='Session'>" + startEvent + "~" + endEvent + "</td>";
			context += "<td class='Session'>" + adress + "</td></tr>";
			$("#list").html(context);
			if(i==myItem.length-1){
				console.log(myItem.length);
				$('#count').append("<h3>&nbsp;全て&nbsp;"+myItem.length+"&nbsp;個</h3>");
			}
		};
	}

	function mainBoardNumSelect() {
		
		var startEvent = $('#startEvent').val();
		var endEvent = $('#endEvent').val();
		
		var a = startEvent.split("-");
		var b = endEvent.split("-");
		if(a>b){
			alert("検索する期間を間違えて入力しました。");
			$('#startEvent').val("");
			$('#endEvent').val("");
			return false;
		}
		if (startEvent == null || endEvent == "") {
			startEvent = " ";
			alert("始まる日を入力してください。");
			return false;
		}
		if (endEvent == null || endEvent == "") {
			endEvent = " ";
			alert("終わる日を入力してください。");
			return false;
		}
		if(tour.length == 0) {
			alert("登録するデーターがありません。");
		}
		
		$.ajax({
			type : 'post',
			url : 'mainBoardNumSelect',
			success : function(data){
				tourAPIinsert();
			},
			error : function() {
				alert("番号を確認できませんでした。");
			}
		})
	}
	
	function tourAPIinsert() {
		
		var startEvent = $('#startEvent').val();
		var endEvent = $('#endEvent').val();
		
		var a = startEvent.split("-");
		var b = endEvent.split("-");
		if(a>b){
			alert("検索する期間を間違えて入力しました。");
			$('#startEvent').val("");
			$('#endEvent').val("");
			return false;
		}
		if (startEvent == null || endEvent == "") {
			startEvent = " ";
			alert("始まる日を入力してください。");
			return false;
		}
		if (endEvent == null || endEvent == "") {
			endEvent = " ";
			alert("終わる日を入力してください。");
			return false;
		}
		if(tour.length == 0) {
			alert("登録するデーターがありません。");
		}
		
		$.ajax({
			url : "tourAPIinsert",
			type : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(tour),
			success : function() {
				alert("登録を完了しました。");
			},
			error : function() {
				alert("登録が失敗しました。");
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
						<!-- Main Menu End-->
					</div>

				</div>
			</div>
			<!--End Sticky Header-->

		</header>
		<!--End Main Header -->


		<!-- Page Title-->
		<section class="page-title" style="background: url(resources/images/userimage/fefe.jpg); margin-top: 6%;">
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

		<!--End Schedule Section-->
		<section class="schedule-section" id="schedule-tab">
			<div id="div_icontext"></div>
			<div class="container">
				<div class="schedule-area">
					<div class="schedule-content clearfix">
						<div class="inner-box  table-responsive">
							<table>
								<tr>
									<td>祭りがは祭りの開始日：<input type="date" name="startEvent" value="" id="startEvent">から</td>
									<td>&nbsp;&nbsp;</td>
									<td>祭りの終了日：<input type="date" name="endEvent" id="endEvent">まで行います。 </td>
									<td>&nbsp;&nbsp;</td>
									<td><input type="button" value="search" class="btn-tt" id="listSearch"></td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td><input type='button' id="insertBtn" class="btn-tt" value='登録'></td>
									<td>&nbsp;&nbsp;</td>
									<td id="count"></td>
								</tr>
							</table>
							<div class="inner-box  table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th class="srial">#</th>
											<th class="session">タイトル</th>
											<th class="time">写真</th>
											<th class="speakers">期間</th>
											<th class="venue">住所</th>
										</tr>
									</thead>
									<tbody id="list" class="table table-hover"></tbody>

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
                <li><a href="festival">Home</a></li>
                <li><a href="listForm">List</a></li>
                <li><a href="calendar">Calendar</a></li>
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
