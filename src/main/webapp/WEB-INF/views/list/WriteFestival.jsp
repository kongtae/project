<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    
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
		width: 645px;
	}
	#hashtagPlus {
		width: 6%;
	    display: inline;
	    padding: 1.6%;
	    background: #fa334f;
	    border-color: #fa334f;
	    border-radius: 10%;
	    color: white;
	    -webkit-text-stroke-width: thick;
	}
	#hashtag1{
		width: 92%;
    	display: inline;
    	margin-bottom: 2%;
    	margin-right: 1%;

	}
	.filebox {
	padding-bottom: 5%;
	}
	.filebox label { 
	position: absolute; 
	display: inline-block; 
	padding: .5em .75em; 
	color: white; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fa334f; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
	} 
	.filebox input[type="file"] {
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
	}
	.filebox input[type="button"] {
	margin-left: 35%;
    display: inline-block;
    padding: .5em .75em;
    color: black;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #DDDDDD;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
	}
	.table_text {
	margin-top: 2.5%;
	}
	.table_text p {
	margin-bottom: 0;
    position: absolute;
    display: contents;
	}
	.table_text input[type="date"] {
	border-radius: 0.25rem;
    border: 1.5px solid #ebebeb;
    color: #495057;
	} *
	.table_text input[type="text"] {
	border-radius: 0.25rem;
    border: 1.5px solid #ebebeb;
    color: #495057;
	}
</style>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script>

$(function() {
	$('#hashtagPlus').on('click', hashtag2);
});

var sharp = "";
var idx = 0;

function checkValue() {
	
	var title = document.getElementById("title");
	var startEvent = document.getElementById("startEvent");
	var endEvent = document.getElementById("endEvent");
	var adress = document.getElementById("adress");
	var country = document.getElementById("country");
	var surround_place = document.getElementById("surround_place");
	
	
	
	if (title.value == '' || title.value.length == 0) {
		alert('タイトルを入力してください。');
		title.focus();
		return false;
	}
	if (startEvent.value == '' || startEvent.value == null) {
		alert('始まる日を入力してください。');
		return false;
	}
	if (endEvent.value == '' || endEvent.value == null) {
		alert('終わる日を入力してください。');
		return false;
	}
	if (country.value == '' || country.value.length == 0) {
		alert('国家名を入力してください。');
		country.focus();
		return false;
	}
	if (surround_place.value == '' || surround_place.value.length == 0 ){
		alert('都市名を入力してください。');
		surround_place.focus();
		return false;
	}
	if (adress.value == '' || adress.value.length == 0) {
		alert('住所を入力してください。');
		adress.focus();
		return false;
	}
}

var hashtag = "";

function hashtag2() {
	var hashtag1 = document.getElementById("hashtag1").value;
	if(hashtag1.charAt(0) != '#') {
		alert("「＃」を入力してください。");
		return false;
	}
	sharp = hashtag1;
//	alert(sharp);
	sharp = sharp.replace("#", "");
	idx += 1;
	$('#hash').append("<span id="+sharp+">"+hashtag1+"<button id="+idx+" value="+hashtag1+" onclick='btnClick("+sharp+")'>X</button></span>");
	hashtag += hashtag1+',';
	return false;
}
function btnClick(sharp1){
//	alert("sharp1 : "+sharp1);
	
	var key = sharp1.innerHTML;
//	alert("key : "+ key);
	var a = key.indexOf('(')+1;
	var b = key.indexOf(')');
	var key1 = key.substring(a,b);
	var key2 = key1;
	key1 = "#"+key1+",";
//	alert("key1 : "+key1);
//	alert("key2 : "+key2);
	hashtag = hashtag.replace(key1, "");
//	alert("hashtag : "+hashtag);
	//hashtagPrint();
	$('#'+key2).empty();
}

function writeFestival() {

		checkValue();
		$('#hashtag').val(hashtag);
		//alert($('#hashtag').val());
		var form = $("#writeFestivalID")[0];
		var formData = new FormData(form);
		
		$.ajax({
			url:"writeFestival",
			enctype: 'multipart/form-data',
			data:formData,
			type:"post",
			contentType:false,
			processData:false,
			dataType : 'text',
			//cache: false,
			success: function(data) {
				alert("投稿を完了しまいた。");
				location.href ="listForm";
			},
			error: function() {
				alert("投稿に失敗しました。");
			}
		});
	} 
	
	function delete1() {
		$("#uploadFileName").val("");
		$('#preview').empty();
	}
	
	function delete2() {
		$("#uploadFileName2").val("");
		$('#preview2').empty();
	}
	
	function delete3() {
		$("#uploadFileName3").val("");
		$('#preview3').empty();
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
                    <div class="logo"><a href="festival"><img src="images/fespedia.png" alt="" title="ホームへ"></a></div>
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
<section class="page-title" style="background: url(resources/images/background/page-title-4.jpg);">
    <div class="container">
        <div class="title-text text-center">
           <h3>祭り掲示板</h3>
            <ul>
                <li><a href="festival">home</a></li>
                <li>/</li>
                <li><a href="listForm">List</a></li>
            </ul>
        </div>                
    </div>
</section>
<!-- End Page Title-->


<!--Schedule Details-->
<form action="writeFestival" id="writeFestivalID" method="post" enctype="multipart/form-data" >
<section class="schedule-details">
    <div class="container">
        <div class="row">
            <div class="col-xl-4 col-md-12 col-sm-12">
                <div class="shedule-left-side">
                    <div class="text-title" style="margin-bottom: 5%;">
                        <h6>祭りの写真</h6>
                    </div> 
                    
           <div id="preview"></div>
           			<div class="uploadButton">
                	<i class="fa fa-paperclip"></i> ファイル添付
                	<div class="filebox">
                	<label for="uploadFileName">ファイル選択</label>
                	<input type="file" class="uploadButton" id="uploadFileName" name="uploadFileName" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" class="uploadButton" onclick="delete1()" value="1番目の写真を消す">
					</div>
                    
                    <div id="preview2"></div>
			 		<i class="fa fa-paperclip"></i> ファイル添付
			 		<div class="filebox">
			 		<label for="uploadFileName2">ファイル選択</label>
					<input type="file" id="uploadFileName2" name="uploadFileName2" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" onclick="delete2()" value="2番目の写真を消す">	
                    </div>
                    
                    <div id="preview3"></div>	
					<i class="fa fa-paperclip"></i> ファイル添付
					<div class="filebox">
			 		<label for="uploadFileName3">ファイル選択</label>
					<input type="file" id="uploadFileName3" name="uploadFileName3" multiple="multiple"  accept="image/png,image/jpg,image/gif,image/jpeg">
					<input type="button" onclick="delete3()" value="3番目の写真を消す">
               		</div>
               		</div>
                </div>
            </div>
            <div class="col-xl-8 col-md-12 col-sm-12">
                <div class="shedule-right-side">
                    <div class="image-box">
					    <section class="content">
					        <!-- /.col -->
					        <div class="col-md-9">

					          <div class="box box-primary">
					            <!-- /.box-header -->
					            <div class="box-body">
					              <div class="form-group">
					      
	 					<table class="buttonL">
		                <tr>
		              	<td align="left"><h1>祭りの投稿欄</h1></td>
		                <td><button type="button" class="btn btn-primary" style="background-color: #fa334f; border-color: #fa334f;" onclick="writeFestival()"><i class="fa fa-envelope-o"></i>投稿</button>
		                <input type="reset" class="btn btn-default" value="取消" id="reset"><i class="fa fa-ｓtimes"></i>
		                </td>
						</tr>					              
		              </table>
					      
					              	<br>
					              	<div id="hash"></div>
					              	<input type="text" id="hashtag1" class="form-control" placeholder="#HashTag">
					          		<button type="button" id="hashtagPlus" class="btn">+</button>
					          		<input type="hidden" id="hashtag" name="hashtag">
					              	<br>
					                <input type="text" id="title" name="title" class="form-control" placeholder="祭りの名前を記入してください。" >
					              </div>
					              <div class="form-group">
					                    <textarea name="festival_intro" id="festival_intro" class="form-control" placeholder="内容を記入してください。" style="height: 300px"></textarea> 
									<div class="wrapper">
  
									
									<table class="table_text">	
										<tr><td><p>祭りの開始日: </p><input type="date" name="startEvent" value="" id="startEvent">から</td></tr>
										<tr><td><p>祭りの終了日: </p><input type="date" name="endEvent" id="endEvent">まで行います。</td></tr>
					             		<tr><td><p>国家: </p><input class="longbar" id="country" type="text" name="country" placeholder="国の名前を入力してください。"><br> 
					             		<p>都市: </p><input class="longbar" type="text" id="surround_place" placeholder="都市名を入力してください。" name="surround_place"><br>
					             		<p>住所: </p><input class="longbar" id="adress" type="text" name="adress" placeholder="住所を入力してください。"></td></tr>
					             	</table>
					              </div>
					            </div>
					          </div>
					        </div>
					     </div>  
				</section>
					

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
    </div>
</section>
</form>
<!--End Schedule Details-->

<!--Contact Info-->


<!-- Main Footer-->
<footer class="main-footer">
    <div class="container">
        <div class="footer-area text-center">
            <div class="footer-logo">
                <figure>
                    <a href="festival"><img src="resources/images/logo-2.png" alt=""></a>
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
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></div>





</div>


<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1')
    //bootstrap WYSIHTML5 - text editor
    $('.textarea').wysihtml5()
  })
</script>
</body>
<script>
    var upload = document.querySelector('#uploadFileName');
    var upload2 = document.querySelector('#uploadFileName2');
    var upload3 = document.querySelector('#uploadFileName3');
    var preview = document.querySelector('#preview');
    var preview2 = document.querySelector('#preview2');
    var preview3 = document.querySelector('#preview3');
 
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

        $('#preview2').empty();
        preview2.appendChild(image);
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

        $('#preview3').empty();
        preview3.appendChild(image);
    }); 
    
	 $("#reset").click(function () { 
 	 	 $('#preview').empty();
 	 	 $('#preview2').empty();
 	 	 $('#preview3').empty();
	 });
</script>
</html>
