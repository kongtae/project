<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<script src="resources/js/jquery.js"></script> 
<script src="resources/js/popper.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.fancybox.js"></script>
<script src="resources/js/owl.js"></script>
<script src="resources/js/wow.js"></script>
<script src="resources/js/jquery.countTo.js"></script>
<script src="resources/js/jquery.countdown.min.js"></script>
<script src="resources/js/appear.js"></script>
<script src="resources/js/jquery-ui.js"></script>
<script src="resources/js/isotope.js"></script>
<script src="resources/js/bxslider.js"></script>
<script src="resources/js/validate.js"></script>

<!-- Custom script -->
<script src="resources/js/custom.js"></script>

<!--Google Map-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBevTAR-V2fDy9gQsQn1xNHBPH2D36kck0"></script>
<script src="resources/js/map-script.js"></script>
<!--End Google Map APi-->

    <title>Wiscon || Responsive HTML 5 Template</title>
    <!-- responsive meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For IE -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- master stylesheet -->
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/responsive.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/favicon.png" type="image/x-icon">
    <link rel="icon" href="resources/images/favicon.png" type="image/x-icon">
<style>
	.longbar{
			width: 300px;	
	}
	
	.pre1{
		width: 370px;
		height: auto;
	}

	.buttonL{
		width: 680px;
	}
</style>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
	$(function () {
	    imagePrint();
	    
	 });
	 var originalFileName = "";
	 var mainb = ${vo.mainBoardNum};
	 var imageData = {'mainBoardNum' : mainb};
	 function imagePrint() {
	         $.ajax({
	            url : "imagePrint",
	            type : "post",
	            data : imageData,
	            dataType: 'json',
	            success : function(result) {
	               if(result != null) {
		            	var arrNumber = new Array();
		                $.each(result,function(index,item){
	            		arrNumber.push(item);
	                	originalFileName = "resources/images/userimage/" +arrNumber[index];
	                	$('#preview'+index).append("<input type='image' class='pre1' src='"+originalFileName+"'><br>");
	                  })
	               }
	            },
	            error : function() {
//	                alert("실패");
	               alert("イメージの読み込みに失敗しました。");
	            }
	         });
	      }

function updateFestival() {	

		var form = $("#updateFestivalID")[0];
		var formData = new FormData(form);
		
		$.ajax({
			url:"updateFestival",
			enctype: 'multipart/form-data',
			data:formData,
			type:"post",
			contentType:false,
			processData:false,
			dataType : 'text',
			success: function(data) {
				alert("修正を完了しました。");
				location.href ="listDetailGO?mainBoardNum="+${vo.mainBoardNum};
			},
			error: function() {
				alert("修正に失敗しました。");
			}
		});
	} 
	
	function delete1() {
		$("#uploadFileName").val("");
		$('#preview0').empty();
	}
	
	function delete2() {
		$("#uploadFileName2").val("");
		$('#preview1').empty();
	}
	
	function delete3() {
		$("#uploadFileName3").val("");
		$('#preview2').empty();
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
                        <li><span class="icon fa fa-envelope"></span><strong>Email</strong> info@wiscon.com</li>
                        <li><span class="icon fa fa-map-marker"></span><strong>Location</strong> 49 BelWest Lane, TX 26098</li>
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
							<li><a href="logout" >Logout</a></li>
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
                    <div class="logo"><a href="festival"><img src="images/logo.png" alt="" title="ホームへ"></a></div>
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
								<li class="dropdown"><a href="Calendar">Calendar</a>
									<ul>
										<li><a href="calendar">Calendar</a></li>
									</ul></li>
								<li class="dropdown"><a href="Map">Map</a>
									<ul>
										<li><a href="Map">Map</a></li>
									</ul></li>
								<li class="dropdown"><a href="boardList">Board</a>
									<ul>
										<li><a href="boardList">Board2</a></li>
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
<section class="page-title" style="background: url(resources/images/background/page-title-4.jpg);">
    <div class="container">
        <div class="title-text text-center">
            <h3>Shedule Details</h3>
            <ul>
                <li><a href="index.html">home</a></li>
                <li>/</li>
                <li>Shedule Details</li>
            </ul>
        </div>                
    </div>
</section>
<!-- End Page Title-->


<!--Schedule Details-->
<form action="writeFestival" id="updateFestivalID" method="post" enctype="multipart/form-data" >
<section class="schedule-details">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-md-12 col-sm-12">
                <div class="shedule-left-side">
                    <div class="text-title">
                        <h6>祭りの写真</h6>
                    </div> 
			  
                    <div id="preview0"></div>
                	<i class="fa fa-paperclip"></i> ファイル添付
                	<input type="file" id="uploadFileName" name="uploadFileName" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" onclick="delete1()" value="1番目の写真を消す">
                     
                    <div id="preview1"></div>
			 		<i class="fa fa-paperclip"></i> ファイル添付
					<input type="file" id="uploadFileName2" name="uploadFileName2" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" onclick="delete2()" value="2番目の写真を消す">	
                    
                    <div id="preview2"></div>	
					<i class="fa fa-paperclip"></i> ファイル添付	
					<input type="file" id="uploadFileName3" name="uploadFileName3" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" onclick="delete3()" value="3番目の写真を消す">
					
			    </div>
              </div>


            <div class="col-xl-8 col-md-12 col-sm-12">
                <div class="shedule-right-side">
                    <div class="image-box">
					    <section class="content">
					      <div class="row">
					        <!-- /.col -->
					        <div class="col-md-9">
					            <!-- /.box-header -->
					            <div class="box-body">
					              <div class="form-group">
	
		              <table class="buttonL">
		                <tr>
		              	<td align="left"><h1>祭りの投稿欄</h1></td>
		                <td><button type="button" class="btn btn-primary" onclick="updateFestival()"><i class="fa fa-envelope-o"></i> 投稿</button>
		                <input type="reset" class="btn btn-default" value="取消" id="reset"><i class="fa fa-ｓtimes"></i>
		                </td>
						</tr>					              
		              </table>
					              	
					              	<br>
					                <input type="text" id="title" name="title" class="form-control" placeholder="祭りの名前を記入してください。" value="${vo.title}" >
								        </div> 
								    <div class="form-group">
					                     <textarea name="festival_intro" id="festival_intro" class="form-control" placeholder="内容を記入してください。" style="height: 300px">${vo.festival_intro}</textarea> 
									
									<table>	
										<tr><td>祭りがは祭りの開始日：<input type="date" name="startEvent" value="${vo.startEvent }" id="startEvent">から</td></tr>
										<tr><td>祭りの終了日：<input type="date" name="endEvent" value="${vo.endEvent }" id="endEvent">まで行います。</td></tr>
					             	<tr><td>国家:<input class="longbar" id="country" type="text" name="country" placeholder="国の名前を入力してください。" value="${vo.country}"><br> 
					             	住所:<input class="longbar" id="adress" type="text" name="adress" placeholder="住所を入力してください。" value="${vo.adress}">
										<input type="hidden" name="mainBoardNum" value="${vo.mainBoardNum }"></td></tr>
					             	</table> 
					              </div>
					            </div>
					        </div>
					      </div>
					    </section>
 					</div>
 
                    <!--Map Outer-->
                    <div class="map-outer">
                        <!--Map Canvas-->
                        <div class="map-canvas"
                            data-zoom="12"
                            data-lat="-37.815038"
                            data-lng="144.967359"
                            data-type="roadmap"
                            data-hue="#ffc400"
                            data-title="184 Collins Street West Victoria,"
                            data-icon-path="resources/images/icons/map-marker.png"
                            data-content="184 Collins Street West Victoria<br><a href='mailto:info@youremail.com'>info@youremail.com</a>">
                        </div>
                    </div>
                </div>
            </div>
        </div>                
    </div>
</section>
</form>
<!--End Schedule Details-->

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


<!-- Main Footer-->
<footer class="main-footer" style="background: url(resources/images/background/footer.jpg);">
    <div class="container">
        <div class="footer-area text-center">
            <div class="footer-logo">
                <figure>
                    <a href="index.html"><img src="resources/images/logo-2.png" alt=""></a>
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





</div>
</body>
<script>
    var upload = document.querySelector('#uploadFileName');
    var upload2 = document.querySelector('#uploadFileName2');
    var upload3 = document.querySelector('#uploadFileName3');
    var preview0 = document.querySelector('#preview0');
    var preview1 = document.querySelector('#preview1');
    var preview2 = document.querySelector('#preview2');
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        /* FileReader 객체 생성 */
        var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            /* 
                get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                onload 에 설정했던 return 으로 넘어간다.
                이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
            */
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }

        $('#removeImg').empty();
        $('#preview0').empty();
        preview0.appendChild(image);
    });
    
    upload2.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        var reader = new FileReader();
 
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }

        $('#removeImg').empty();
        $('#preview1').empty();
        preview1.appendChild(image);
    });
    
    upload3.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        var image = document.createElement('img');
 
        var reader = new FileReader();
 
        reader.onload = (function (aImg) {
            console.log(1);
 
            return function (e) {
                console.log(3);
                aImg.src = e.target.result
            }
        })(image)
 
        if(get_file){
            reader.readAsDataURL(get_file[0]);
            console.log(2);
        }

        $('#removeImg').empty();
        $('#preview2').empty();
        preview2.appendChild(image);
    }); 
    
	 $("#reset").click(function () { 
 	 	 $('#preview0').empty();
 	 	 $('#preview1').empty();
 	 	 $('#preview2').empty();
	 });
</script>
</html>
