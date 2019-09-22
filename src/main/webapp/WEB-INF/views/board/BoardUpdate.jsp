<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    
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

</style>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>
$(function () {
    imagePrint();
    
 });
 var originalFileName = "";
 var bulb = ${vo.bul_boardnum};
 var imageData = {'bul_boardnum' : bulb};
 function imagePrint() {
         $.ajax({
            url : "imagePrintBoard",
            type : "post",
            data : imageData,
            dataType: 'json',
            success : function(result) {
               if(result != null) {
	            	var arrNumber = new Array();
                  $.each(result,function(index,item){
	            	arrNumber.push(item);
                	alert("요기요"+arrNumber[index]);
                	originalFileName = "resources/images/userimage/" +item;
                	$('#preview'+index).append("<input type='image' src='"+originalFileName+"'><br>");
                  })
	 				var originalFileName1 = "resources/images/userimage/" +arrNumber[0];
	 				var originalFileName2 = "resources/images/userimage/" +arrNumber[1];
	 				var originalFileName3 = "resources/images/userimage/" +arrNumber[2];
                //  $('#preview1').append("<input type='image' src='"+originalFileName1+"'><br>");
                //  $('#preview2').append("<input type='image' src='"+originalFileName2+"'><br>");
                //  $('#preview3').append("<input type='image' src='"+originalFileName3+"'><br>");
               }
            },
            error : function() {
//                alert("실패");
               alert("이미지 로드 실패");
            }
         });
      }

function BoardUpdate() {

		var form = $("#BoardUpdateID")[0];
		var formData = new FormData(form);
		
		$.ajax({
			url:"boardUpdate",
			enctype: 'multipart/form-data',
			data:formData,
			type:"post",
			contentType:false,
			processData:false,
			dataType : 'text',
			success: function() {
				alert("修正完了");
				location.href ="BoardDetailGO?bul_boardnum="+${vo.bul_boardnum};
			},
			error: function(request,status,error) {
				alert("修正ERROR");
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
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
								<li class="dropdown"><a href="listForm">List</a>
									<ul>
										<li><a href="listForm">List</a></li>
										<li><a href="listDetailForm">List Details</a></li>
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
<form action="BoardWrite" id="BoardUpdateID" method="post" enctype="multipart/form-data" >
<section class="schedule-details">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-md-12 col-sm-12">
                <div class="shedule-left-side">
                    <div class="text-title">
                        <h6>写真</h6>
                    </div> 
                    <div id="preview">
                    </div><br>
                    <div id="preview1">
                    </div><br>
                    <div id="preview2">
                    </div>
                     <div class="image-box" id="image-box"></div> 
                <div class="form-group">
                <div class="btn btn-default btn-file">
                <i class="fa fa-paperclip"></i> ファイル添付
                	<input type="file" id="uploadFileName" name="uploadFileName" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg"> <br>
			 	<i class="fa fa-paperclip"></i> ファイル添付
					<input type="file" id="uploadFileName2" name="uploadFileName2" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg"><br>
				<i class="fa fa-paperclip"></i> ファイル添付	
					<input type="file" id="uploadFileName3" name="uploadFileName3" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					
                </div>
              </div> 
                <div class="box-footer">
              <div class="pull-right">
                <button type="button" class="btn btn-primary" onclick="BoardUpdate()"><i class="fa fa-envelope-o"></i> 投稿</button>
                <input type="reset" class="btn btn-default" value="取消" id="reset"><i class="fa fa-ｓtimes"></i>
              </div>
            </div>     
                </div>
            </div>
            <div class="col-xl-8 col-md-12 col-sm-12">
                <div class="shedule-right-side">
                    <div class="image-box">
					    <section class="content">
					      <div class="row">
					        <!-- /.col -->
					        <div class="col-md-9">
					          <div class="box box-primary">
					            <!-- /.box-header -->
					            <div class="box-body">
					              <div class="form-group">
					              	<h1>投稿欄</h1>
					              	<br>
					              	<input type="text" name="userid" class="form-control" value="작성자:${sessionScope.loginid}" disabled="disabled">
					                <input type="text" id="title" name="title" class="form-control" placeholder="타이틀。" value="${vo.title}" >
					              </div>
					              <div class="form-group">
					                <textarea name="contents" id="contents" class="form-control" placeholder="내용。" style="height: 300px">${vo.contents}</textarea>
									<table>	
 					             	<tr><td>国家:<input class="longbar" id="country" type="text" name="country" placeholder="国の名前を入力してください。" value="${vo.country}"><br>  
				           			 住所:<input class="longbar" id="adress" type="text" name="adress" placeholder="地域を入力してください。" value="${vo.adress}">
				           			 <input type="hidden" name="bul_boardnum" id="bul_boardnum" value="${vo.bul_boardnum}">
				           			 </td></tr> 
					             	</table> 
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </section>
					</div>
                    <div class="event-details">
                        <h5>Event Details</h5>
                        <div class="inner-box  table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="start">Start</th>
                                        <th class="end">End</th>
                                        <th class="rate">Rate</th>
                                        <th class="categories">Categories</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="start">Jan 5 , 2018  9 Am</td>
                                        <td class="end">Jan 8 , 2018  4 Pm</td>
                                        <td class="rate">$23.00</td>
                                        <td class="categories">Business Events</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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
    var preview = document.querySelector('#preview');
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
                /* base64 인코딩 된 스트링 데이터 */
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
        $('#preview').empty();
        preview.appendChild(image);
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
 	 	 $('#preview').empty();
 	 	 $('#preview1').empty();
 	 	 $('#preview2').empty();
	 });
</script>
</html>
