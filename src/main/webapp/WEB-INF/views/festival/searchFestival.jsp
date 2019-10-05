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
<link rel="shortcut icon" href="images/f.png" type="image/x-icon">
<link rel="icon" href="images/f.png" type="image/x-icon">
<style>
#left-box {
	float: left;
	width: 50%;
	
}
#right-box {
	float: right;
	width: 50%;
}
#left-image {
	height: 70%;
}
#right-image {
	height: 70%;
}
#tit1 {
	text-align: center;
	color: hotpink;
	font-weight: bold;
}
#tit2 {
	text-align: center;
	color: dodgerblue;
    font-weight: bold;
}
.detailview {
	text-align: center;
	color: midnightblue;
}
table{
	text-align: center;
}
.tableSecond{
	border-right-style: inset;
    border-right-width: thick;
    border-right-color: darkgray;
}
</style>
<script src="js/jquery.js"></script>
<script>
	$(function() {
		push_image();
	})

	var check = 0;
	var ry;
	var rn;
	var fesimages = new Array();
	var fesnames = new Array();

	function push_image() {
		$.ajax({
			url: 'pushImage',
			type: 'post',
			dataType: "json",
			success : function(data) {
				$.each(data, function(index, item) {
					fesimages.push(item.image);
					fesnames.push(item.festivalname);
				});
				if(check < 5 ){
				random_image();
				}
			},
			error : function(data) {
				alert("푸시이미지 실패");
			} 
		});
	
	}

	function random_image() {
		check += 1;
		if (check > 5) {
			result();
			return false;
		}
		ry = Math.floor(Math.random() * (fesimages.length - 1));
		rn = Math.floor(Math.random() * (fesimages.length - 1));
		if(ry == rn){
			check -= 1;
			return random_image();
		}
		$('#image-box').append("<div id='left-box'><div id ='left-text' class='title-text text-center'><h3><a href='javascript:leftBtn();'>"+ fesnames[ry] +"</a>"
			+"</h3><div id='left-image'><img src=" + fesimages[ry] + " border=0></div></div></div>");
		$('#image-box').append("<div id='right-box'><div id ='right-text' class='title-text text-center'><h3><a href='javascript:rightBtn();'>"+ fesnames[rn] +"</a>"
			+"</h3><div id='right-image'><img src=" + fesimages[rn] + " border=0></div></div></div>");
	}

	function leftBtn() {
		var a = fesimages[ry].lastIndexOf('/') + 1;
		var b = fesimages[ry].indexOf('.');
		var key1 = "";
		key1 = fesimages[ry].substring(a, b);
		CheckSearch(key1);
		fesimages.splice(ry, 1);
		fesnames.splice(ry, 1);
		if(ry < rn){
			var rnn = rn-1;
			fesimages.splice((rnn), 1);
			fesnames.splice((rnn), 1);
		}else{
		fesimages.splice(rn, 1);
		fesnames.splice(rn, 1);
		}
		$('#left-box').remove();
		$('#right-box').remove();
		random_image();
	}

	function rightBtn() {
		var a = fesimages[rn].lastIndexOf('/') + 1;
		var b = fesimages[rn].indexOf('.');
		var key1 = fesimages[rn].substring(a, b);
		CheckSearch(key1);
		fesimages.splice(ry, 1);
		fesnames.splice(ry, 1);
		if(ry < rn){
			var rnn = rn-1;
			fesimages.splice((rnn), 1);
			fesnames.splice((rnn), 1);
		}else{
		fesimages.splice(rn, 1);
		fesnames.splice(rn, 1);
		}
		$('#left-box').remove();
		$('#right-box').remove();
		random_image();
	}

	function CheckSearch(key1) {
		$.ajax({
			url : 'CheckSearch',
			type : "post",
			data : {
				"key" : key1
			},
			success : function(data) {
			},
			error : function() {
				alert("체크 등록 失敗");
			}
		});
	}

	var selectResult = [];
	function result() {
		$('#image-box').empty();
		$.ajax({
			url : "result",
			type : "post",
			success : function(data) {
				$.each(data, function(index, item) {
					selectResult.push(item);
				});
				leftResult();
				rightResult();
				reset();
			},
			error : function(data) {
				alert("결과 실패");
			}
		});
	}

	function leftResult() {
		var title = selectResult[0].title;
		var country = selectResult[0].country;
		var adress = selectResult[0].adress;
		var intro = selectResult[0].festival_intro;
		var hashtag = selectResult[0].hashtag;
		var surround_place = selectResult[0].surround_place;
		var mainBoardNum = selectResult[0].mainBoardNum;
		if(hashtag == null){
			hashtag = ''; 
		}
		if(intro == null){
			intro = '';
		}
		if(surround_place == null){
			surround_place = '';
		}
		if(country == null){
			country = '';
		}
		if(adress == null){
			adress = '';
		}
			
		var s = new Date(selectResult[0].startEvent);
		var start = s.getFullYear() + "-"
				+ ("00" + (s.getMonth() + 1)).slice(-2) + "-"
				+ ("00" + s.getDate()).slice(-2);
		var e = new Date(selectResult[0].endEvent);
		var end = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2)
				+ "-" + ("00" + s.getDate()).slice(-2);
		$('#image-box').append(
				"<div id='left-box'><div class='tableSecond'><br><h1 id='tit1'>お勧め①</h1><br><table class='table table-hover'><tr><td><b>分類</b></td><td><b>詳細情報</b></td></tr>"+
                 "<tr><td>#HASHTAG</td><td>"+hashtag+"</td></tr><tr><td>タイトル</td><td>"+title+"</td></tr><tr><td>内容</td><td>"+intro+"</td>"+
                "</tr><tr><td>期間</td><td>"+start+"~"+end+"</td></tr><tr><td>国家</td><td>"+country+"</td></tr>"+
                "<tr><td>都市</td><td>"+surround_place+"</td></tr><tr><td>住所</td><td>"+adress+"</td></tr></table><a href=listDetailGO?mainBoardNum="+mainBoardNum+" class='detailview'><h3 class='detailview1'>➡️Detail View</h3></a></div>");
	}

	function rightResult() {
		var title = selectResult[1].title;
		var country = selectResult[1].country;
		var adress = selectResult[1].adress;
		var intro = selectResult[1].festival_intro;
		var hashtag = selectResult[1].hashtag;
		var surround_place = selectResult[1].surround_place;
		var mainBoardNum = selectResult[1].mainBoardNum;
		if(hashtag == null){
			hashtag = ''; 
		}
		if(intro == null){
			intro = '';
		}
		if(surround_place == null){
			surround_place = '';
		}
		if(country == null){
			country = '';
		}
		if(adress == null){
			adress = '';
		}
		var s = new Date(selectResult[1].startEvent);
		var start = s.getFullYear() + "-"
				+ ("00" + (s.getMonth() + 1)).slice(-2) + "-"
				+ ("00" + s.getDate()).slice(-2);
		var e = new Date(selectResult[1].endEvent);
		var end = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2)
				+ "-" + ("00" + s.getDate()).slice(-2);
		$('#image-box').append(
				"<div id='left-box'><div class='tableSecond'><br><h1 id='tit2'>お勧め②</h1><br><table class='table table-hover'><tr><td><b>分類</b></td><td><b>詳細情報</b></td></tr>"+
                 "<tr><td>#HASHTAG</td><td>"+hashtag+"</td></tr><tr><td>タイトル</td><td>"+title+"</td></tr><tr><td>内容</td><td>"+intro+"</td>"+
                "</tr><tr><td>期間</td><td>"+start+"~"+end+"</td></tr><tr><td>国家</td><td>"+country+"</td></tr>"+
                "<tr><td>都市</td><td>"+surround_place+"</td></tr><tr><td>住所</td><td>"+adress+"</td></tr></table><a href=listDetailGO?mainBoardNum="+mainBoardNum+" class='detailview'><h3 class='detailview1'>➡️Detail View</h3></a></div>");
	}

	function reset() {
		$.ajax({
			url : "reset",
			type : "post",
			success : function(result) {
			},
			error : function(data) {
				alert("reset실패");
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
								<a href="festival"><img src="images/fespedia.png" alt=""
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
										<li class="dropdown"><a href="">Home</a></li>
									<li class="dropdown"><a href="listForm">List</a>
										<ul>
											<li><a href="listForm">List</a></li>
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
								<a href="searchFestival" class="theme-btn btn-style-one">Search Festival</a>
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
						<a href="festival" class="img-responsive"><img
							src="images/fespedia.png" alt="" title=""></a>
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
									<li class="dropdown"><a href="">Home</a></li>
									<li class="dropdown"><a href="#">List</a>
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
		<!-- Page Title-->
<<<<<<< HEAD
			<section class="page-title" style="background: url(resources/images/userimage/turkeyBalloon.jpg); margin-top: 6%;">

=======
			<section class="page-title" style="background: url(resources/images/userimage/turkeyballoon.jpg); margin-top: 6%;">
>>>>>>> 8a798b09baba47c09478ba6dd2b096846ba15885
			<div class="container">
				<div class="title-text text-center">
					<h3>Search Festival</h3>
					<ul>
						<li><a href="festival">home</a></li>
						<li>/</li>
						<li><a href="searchFestival">Search Festival</a></li>
					</ul>
				</div>
			</div>
		</section>
		<!-- End Page Title-->
		<div class="slide">
			<div id="image-box"></div>
		</div>
		
		</header>
		
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