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
				if(check < 4 ){
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
		if (check > 4) {
			result();
			return false;
		}
		ry = Math.floor(Math.random() * (fesimages.length - 1));
		rn = Math.floor(Math.random() * (fesimages.length - 1));
		if(ry == rn){
			alert("중복이라 다시");
			check -= 1;
			return random_image();
		}
		$('#image-box').append("<div id='left-box'><div id ='left-text' class='title-text text-center'><h3><a href='javascript:leftBtn();'>"+ fesnames[ry] +"</a>"
			+"</h3><div id='left-image'><img src=" + fesimages[ry] + " border=0></div></div></div>");
		$('#image-box').append("<div id='right-box'><div id ='right-text' class='title-text text-center'><h3><a href='javascript:rightBtn();'>"+ fesnames[rn] +"</a>"
			+"</h3><div id='right-image'><img src=" + fesimages[rn] + " border=0></div></div></div>");
		console.log("왼쪽 파일명 : "+ fesnames[ry]+"/ry : "+ry);
		console.log("오른쪽 파일명 : "+ fesnames[rn]+"/rn : "+rn);
		console.log("랭쓰 : "+fesnames.length);
	}

	function leftBtn() {
		var a = fesimages[ry].lastIndexOf('/') + 1;
		var b = fesimages[ry].indexOf('.');
		var key1 = "";
		key1 = fesimages[ry].substring(a, b);
		CheckSearch(key1);
		console.log("왼쪽 삭제명 : "+ fesnames[ry]+"/"+ry);
		fesimages.splice(ry, 1);
		fesnames.splice(ry, 1);
		if(ry < rn){
			var rnn = rn-1;
			console.log("오른쪽 삭제명 : "+ fesnames[rnn]+"/"+rnn);
			fesimages.splice((rnn), 1);
			fesnames.splice((rnn), 1);
		}else{
			console.log("오른쪽 삭제명 : "+ fesnames[rn]+"/"+rn);
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
		console.log("왼쪽 삭제명 : "+ fesnames[ry]+"/"+ry);
		fesimages.splice(ry, 1);
		fesnames.splice(ry, 1);
		if(ry < rn){
			var rnn = rn-1;
			console.log("오른쪽 삭제명 : "+ fesnames[rnn]+"/"+rnn);
			fesimages.splice((rnn), 1);
			fesnames.splice((rnn), 1);
		}else{
			console.log("오른쪽 삭제명 : "+ fesnames[rn]+"/"+rn);
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
		var s = new Date(selectResult[0].startEvent);
		var start = s.getFullYear() + "-"
				+ ("00" + (s.getMonth() + 1)).slice(-2) + "-"
				+ ("00" + s.getDate()).slice(-2);
		var e = new Date(selectResult[0].endEvent);
		var end = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2)
				+ "-" + ("00" + s.getDate()).slice(-2);
		$('#image-box').append(
				"<div id='left-box'>" + title + country + adress + intro
						+ start + end + "</div>");
	}

	function rightResult() {
		var title = selectResult[1].title;
		var country = selectResult[1].country;
		var adress = selectResult[1].adress;
		var intro = selectResult[1].festival_intro;
		var s = new Date(selectResult[1].startEvent);
		var start = s.getFullYear() + "-"
				+ ("00" + (s.getMonth() + 1)).slice(-2) + "-"
				+ ("00" + s.getDate()).slice(-2);
		var e = new Date(selectResult[1].endEvent);
		var end = s.getFullYear() + "-" + ("00" + (s.getMonth() + 1)).slice(-2)
				+ "-" + ("00" + s.getDate()).slice(-2);
		$('#image-box').append(
				"<div id='right-box'>" + title + country + adress + intro
						+ start + end + "</div>");
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
		<div class="slide">
			<div id="image-box">
				<!-- <div id="left-box">
					<div class="title-text text-center">
						<h3>
							<a href="javascript:leftBtn();" >#음악</a>
						</h3>
						<div id="left-image"></div>
					</div>
				</div>
				<div id="right-box">
					<div class="title-text text-center">
						<h3>
							<a href="javascript:rightBtn();">#영화</a>
						</h3>
						<div id="right-image"></div>
					</div>
				</div> -->
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